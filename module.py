import ultralytics
from ultralytics import YOLO
import cv2
import os
import tensorflow as tf
import re
import pytesseract
import numpy as np
import tensorflow_hub as hub
import math
os.environ["TFHUB_DOWNLOAD_PROGRESS"] = "True"
from PIL import Image
from server import transfer_data

def load_person_model() :
    person_model = YOLO("yolov8x.pt") # person detection은 COCO Dataset 학습시킨 모델로 사용
    return person_model

def load_garments_model() :
    garments_model = YOLO("clothes_type_13.pt")
    return garments_model

def load_gender_age_model() :
    gender_age_model = YOLO("gender_age_15.pt")
    return gender_age_model

def load_sr_model() :
    SAVED_MODEL_PATH = "https://tfhub.dev/captain-pool/esrgan-tf2/1"
    model = hub.load(SAVED_MODEL_PATH)
    return model

def preprocess_image(image):
    hr_image = tf.convert_to_tensor(image)
    if hr_image.shape[-1] == 4:
        hr_image = hr_image[...,:-1]
    hr_size = (tf.convert_to_tensor(hr_image.shape[:-1]) // 4) * 4
    hr_image = tf.image.crop_to_bounding_box(hr_image, 0, 0, hr_size[0], hr_size[1])
    hr_image = tf.cast(hr_image, tf.float32)
    return tf.expand_dims(hr_image, 0)

def save_image(image, filename):
    if not isinstance(image, Image.Image):
        image = tf.clip_by_value(image, 0, 255)
        image = Image.fromarray(tf.cast(image, tf.uint8).numpy())
    image.save("%s.jpg" % filename)
    print("Saved as %s.jpg" % filename)

def super_resolution(image) :
    sr_model = load_sr_model()
    hr_image = preprocess_image(image) # 이미지를 텐서로 변환 (전처리)
    fake_image = sr_model(hr_image) # 해상도 개선
    fake_image = tf.squeeze(fake_image) # 압축

    fake_image = tf.clip_by_value(fake_image, 0, 255)
    fake_image = tf.cast(fake_image, tf.uint8).numpy()

    return fake_image

def manipulate_image(image) :
    channels = cv2.split(image)
    hist1 = cv2.calcHist([channels[0]], [0], None, [256], [0, 256])
    hist2 = cv2.calcHist([channels[1]], [0], None, [256], [0, 256])
    hist3 = cv2.calcHist([channels[2]], [0], None, [256], [0, 256])

    sum_b = 0
    mean_b = 0
    for j in range(len(hist1)) :
        sum_b += hist1[j]
        if sum_b > image.shape[0]*image.shape[1]/2 :
            mean_b = j
            break
    sum_g = 0
    mean_g = 0
    for j in range(len(hist2)) :
        sum_g += hist2[j]
        if sum_g > image.shape[0]*image.shape[1]/2 :
            mean_g = j
            break
    sum_r = 0
    mean_r = 0
    for j in range(len(hist3)) :
        sum_r += hist3[j]
        if sum_r > image.shape[0]*image.shape[1]/2 :
            mean_r = j
            break

    mean_bgr = (mean_b + mean_g + mean_r)/3
    rat_b = mean_bgr/mean_b
    rat_g = mean_bgr/mean_g
    rat_r = mean_bgr/mean_r

    mean_b *= (rat_b+1)/2
    mean_g *= (rat_g+1)/2
    mean_r *= (rat_r+1)/2

    image2 = image.copy()
    for k in image2 :
        for j in k :
            j[0] *= (rat_b+1)/2
            j[1] *= (rat_g+1)/2
            j[2] *= (rat_r+1)/2

    img_f = image2.astype(np.float32)
    img_norm = ((img_f - img_f.min()) * (255) / (img_f.max() - img_f.min()))
    image3 = img_norm.astype(np.uint8)

    image4 = image3.copy()
    for k in image4 :
        for j in k :
            if j[0]-mean_b > j[1]-mean_g :
                if j[1]-mean_g > j[2]-mean_r :
                    j[0] = (255+j[0]*7)/8
                    j[2] = j[2]*7/8
                elif j[1]-mean_g == j[2]-mean_r :
                    j[0] = (255+j[0]*7)/8
                    j[1] = (j[1] * 15)/16
                    j[2] = (j[2] * 15)/16
                else :
                    if j[0]-mean_b > j[2]-mean_r :
                        j[0] = (255+j[0]*7)/8
                        j[1] = j[1]*7/8
                    elif j[0]-mean_b == j[2]-mean_r :
                        j[0] = (j[0] * 15 + 255)/16
                        j[1] = j[1]*7/8
                        j[2] = (j[2] * 15 + 255)/16
                    else :
                        j[1] = j[1]*7/8
                        j[2] = (255+j[2]*7)/8
            elif j[0]-mean_b == j[1]-mean_g :
                if j[0]-mean_b == j[2]-mean_r :
                    j[0] = j[0]
                    j[1] = j[1]
                    j[2] = j[2]
                elif j[0]-mean_b > j[2]-mean_r :
                    j[0] = (j[0] * 15 + 255)/16
                    j[1] = (j[1] * 15 + 255)/16
                    j[2] = j[2]*7/8
                else :
                    j[0] = (j[0] * 15)/16
                    j[1] = (j[1] * 15)/16
                    j[2] = (j[2]*7 + 255)/8
            else :
                if j[1]-mean_g < j[2]-mean_r :
                    j[0] = j[0]*7/8
                    j[2] = (255+j[2]*7)/8
                elif j[1]-mean_g == j[2]-mean_r :
                    j[0] = j[0]*7/8
                    j[1] = (j[1] * 15 + 255)/16
                    j[2] = (j[2] * 15 + 255)/16
                else :
                    if j[0]-mean_b > j[2]-mean_r :
                        j[1] = (255+j[1]*7)/8
                        j[2] = j[2]*7/8
                    elif j[0]-mean_b == j[2]-mean_r :
                        j[0] = (j[0] * 15)/16
                        j[1] = (255+j[1]*7)/8
                        j[2] = (j[2] * 15)/16
                    else :
                        j[0] = j[0]*7/8
                        j[1] = (255+j[1]*7)/8

    hsv = cv2.cvtColor(image4, cv2.COLOR_BGR2HSV)

    val = 30
    array = np.full(hsv.shape, (0,val,0), dtype=np.uint8)

    image5 = cv2.add(hsv, array)
    image5 = image5.astype(np.uint8)

    image5 = cv2.cvtColor(image5, cv2.COLOR_HSV2BGR)

    return image5

def OCR(location_list) :
    entire_video_list = [] # [[장소1, 영상1, 영상2, ...], [장소2, 영상1, 영상2, ...], ...]

    passing_value_img_src = [] # framedropped 영상의 경로 리스트
    passing_value_img_length = [] # framedropped 영상의 총 프레임 갯수 리스트
    passing_value_img_time = [] # OCR 결과 - 맨 첫 번째 시간 리스트
    passing_value_origin_imgs = [] # 원본 영상 이름 리스트, 컴마로 구분

    extension_list = ['mp4', 'avi', 'm4v', 'wmv', 'mwa', 'asf', 'mpg', 'mpeg', 'ts', 'mkv', 'mov', 'webm'] # 영상파일 확장자 리스트

    time_to_be_elapsed = 0 # 전체 진행도를 담을 변수 / 총 프레임 수 ()


    entire_date_time_list = [] # 폴더별, 영상별 전체 첫 프레임 OCR 결과 담을 리스트
    video_title_list = [] # 폴더별 영상 제목 담을 리스트

    for location in location_list : # 개별 장소마다
        location_videos_list=[] # [장소, 영상1, 영상2, ...]
        location_videos_list.append(location) # 첫번째에 장소 담기

        file_list = os.listdir(location) # 장소 폴더 내의 모든 파일 담기
        extracted_videos_list = [] # [영상1, 영상2, 영상3, ...]

        try:
            if not os.path.exists(location+"/_FrameDropped") : # 프레임드랍 폴더 없으면 
                os.makedirs(location+"/_FrameDropped") # 만들기
        except OSError:
            print ('Error: Creating directory. ' + location + "/_FrameDropped")

        for file_name in file_list : # 개별 파일마다
            for extension in extension_list : # 개별 확장자마다
                if extension in file_name : # 파일이 지정한 영상 확장자면
                    extracted_videos_list.append(file_name) # 리스트에 추가

        passing_value_origin_imgs.append(','.join(extracted_videos_list))

        for extracted_video in extracted_videos_list : # 개별 영상마다
            location_videos_list.append(extracted_video) # 장소 담은 리스트에 이어 붙이기


        entire_video_list.append(location_videos_list) # 전체 장소-영상 담는 리스트에 장소별로 완성된 리스트 담기

    ############################################################################################################################################

    for location_videos in entire_video_list : # 개별 장소마다 (장소별 영상 담겨짐)

        date_time_list = [] # 최종 OCR된 영상이름 담을 리스트
        frames_per_location = 0 # 장소별 총 프레임


        firstFrame_list = [] # 첫 프레임을 담을 리스트
        n_video_list = location_videos[1:] # 영상만 따로

        for video_name in n_video_list : # 개별 영상마다
            video = cv2.VideoCapture(location_videos[0] + "/" + video_name) # VideoCapture 객체 할당
            if(video.isOpened()): # 비디오가 Open인 동안에
                ret, image = video.read() # 읽어옴
                firstFrame_list.append(image) # 첫 프레임 저장

                length = video.get(cv2.CAP_PROP_FRAME_COUNT) # 영상 총 프레임 수
                print(f'{entire_video_list.index(location_videos) + 1}번 장소의 {n_video_list.index(video_name) + 1}번 영상 총 프레임 개수 : {int(length)}\n')
                original_fps = video.get(cv2.CAP_PROP_FPS) # 영상 FPS
                converted_length = (length * 2) / original_fps # 프레임드랍 (2로) 됐을 때 프레임 개수 계산

                frames_per_location += converted_length # 장소별 총 프레임 수에 더함
                time_to_be_elapsed += converted_length # 총 실행 시간에 더함

            video.release() # VideoCapture 객체 release (Open 해제)

        passing_value_img_length.append(int(frames_per_location)) # 장소별로 프레임 수 담아주기

        regex = [re.compile(r'\d{2}/\d{2}/\d{4}\d{2}:\d{2}:\d{2}'), re.compile(r'\d{4}/\d{2}/\d{2}\d{2}:\d{2}:\d{2}'),
                re.compile(r'\d{2}:\d{2}:\d{2}\d{2}/\d{2}/\d{4}'), re.compile(r'\d{2}:\d{2}:\d{2}\d{4}/\d{2}/\d{2}')] # 포맷에 맞게 찾을 re객체

        need = ['0','1','2','3','4','5','6','7','8','9','/',':'] # 숫자와 슬래시, 콜론만 찾음

        date_cnt = 1 # 날짜 몇개 담아졌는지 체크할 카운트 / 영상의 기존 순서를 저장하기 위함

        for firstFrame in firstFrame_list : # 개별 첫 프레임마다

            c_end = 40 # C값 브레이크포인트 설정
            c_start = 31 # C값 시작점 설정

            text_n_list = [] # 텍스트 담을 리스트

            while True :
                print(c_start, end="  ") # 진행되면서 C값 출력
                text_n = "" # 추출한 텍스트 담을 변수
                gray = cv2.cvtColor(firstFrame, cv2.COLOR_BGR2GRAY) # 그레이스케일 변경
                gray = 255 - gray # 흑백 반전
                img_blurred = cv2.GaussianBlur(gray, ksize=(11, 11), sigmaX=1) # 블러 적용 (가우시안)
                img_thresh = cv2.adaptiveThreshold( # thresholding
                    src = img_blurred,
                    maxValue = 255.0, 
                    adaptiveMethod = cv2.ADAPTIVE_THRESH_MEAN_C, 
                    thresholdType = cv2.THRESH_BINARY_INV, 
                    blockSize = 15, 
                    C = c_start
                )

                text = pytesseract.image_to_string(img_thresh, lang='eng') # OCR 진행

                for letter in text : # 추출한 텍스트 하나하나마다
                    if letter in need : # 숫자, 슬래시, 콜론 안에 있다면
                        text_n += letter # 변수에 담아줌

                breakPoint = 0 # 브레이크 할지 말지 판단하는 변수
                for re_obj in regex : # 각각의 re 객체마다
                    time = re_obj.findall(text_n) # text_n에서 미리 정한 포맷이 있는지 찾기

                    if regex.index(re_obj) < 2 : # 연도가 앞에 나오는 경우
                        if len(time) > 0 : # 찾아졌으면
                            if time[0][0] in ["0","1"] and time[0][3] in ["0","1","2","3"] and time[0][10] in ["0","1","2"] and int(time[0][13])<6 and int(time[0][16])<6 :
                                # 월/일/년도 시:분:초가 맞으면
                                text_n_list.append(time[0]) # 비교를 위한 리스트에 담기
                            break # re 객체로 찾는 for문 탈출
                    else : # 연도가 뒤에 나오는 경우
                        if len(time) > 0 : # 찾아졌으면
                            if time[0][8] in ["0","1"] and time[0][11] in ["0","1","2","3"] and time[0][0] in ["0","1","2"] and int(time[0][3])<6 and int(time[0][6])<6 :
                                # 시:분:초 월/일/년도가 맞으면
                                text_n_list.append(time[0]) # 비교를 위한 리스트에 담기
                            break # re 객체로 찾는 for문 탈출

                if c_start >= c_end : # 찾다가 한도를 넘으면
                    if  c_end == 25 : # 낮춰진 한도였을 경우
                        c_start = 31 # 시작점 원래대로 돌리고
                        c_end = 40 # 한도도 원래대로 돌림
                        print("검출에 실패했습니다.")
                        location_videos
                        break

                    print("검출되지 않았습니다. 다시 시도 합니다")
                    c_end = 25 # 한도를 낮춤
                    c_start = 15 # 시작점도 낮춤
                    text_n_list = [] # 비교를 위한 리스트도 초기화

                time_temp = [] # 원하는 포맷으로 바꾼 시간 잠시 담을 리스트

                if (len(text_n_list)) < 2 : # 한개만 찾아진 상태면
                    c_start += 1 # C값 한개씩 올리기

                else : # 2개 이상 찾아졌다면
                    ans = "" # 정답으로 인정할 영상명 담는 변수

                    if text_n_list[0] == text_n_list[1] : # 첫 두개가 같다면
                        ans = text_n_list[0] # 정답으로 인정

                    else : # 첫 두개가 다르다면

                        for i in text_n_list[0:2] : # 각 두개를
                            try :
                                if i in text_n_list[2:] : # 3번째 이상에서 찾아진 것과 비교해서 일치하는 것이 있다면 (2개만 있다면 except)
                                    ans = i # 정답을 해당 텍스트로 설정하고
                                    breakPoint = 1 # 탈출점 활성화
                                    break # 비교 for문 탈출 (C값 올리는 코드로 감)
                            except :
                                print("++(3)")
                        c_start += 1 # C값 올려서 계속 탐색

                    if len(ans) > 0 : # 정답이 찾아졌다면
                        date_time = "" # 원하는 포맷으로 바꾼 시간을 담을 변수
                        try : # 월/일/년도 시:분:초
                            date_time += ((re.compile(r'\d{2}/\d{2}/\d{4}')).findall(ans))[0][6:] # 연도
                            date_time += ((re.compile(r'\d{2}/\d{2}/\d{4}')).findall(ans))[0][:2] # 월
                            date_time += ((re.compile(r'\d{2}/\d{2}/\d{4}')).findall(ans))[0][3:5] # 일
                            date_time += ((re.compile(r'\d{2}:\d{2}:\d{2}')).findall(ans))[0][:2] # 시
                            date_time += ((re.compile(r'\d{2}:\d{2}:\d{2}')).findall(ans))[0][3:5] # 분
                            date_time += ((re.compile(r'\d{2}:\d{2}:\d{2}')).findall(ans))[0][6:8] # 초
                        except : # 년도/월/일 시:분:초
                            date_time += ((re.compile(r'\d{4}/\d{2}/\d{2}')).findall(ans))[0][:4]
                            date_time += ((re.compile(r'\d{4}/\d{2}/\d{2}')).findall(ans))[0][5:7]
                            date_time += ((re.compile(r'\d{4}/\d{2}/\d{2}')).findall(ans))[0][8:]
                            date_time += ((re.compile(r'\d{2}:\d{2}:\d{2}')).findall(ans))[0][:2]
                            date_time += ((re.compile(r'\d{2}:\d{2}:\d{2}')).findall(ans))[0][3:5]
                            date_time += ((re.compile(r'\d{2}:\d{2}:\d{2}')).findall(ans))[0][6:8]

                        print(date_time)

                        time_temp.append(int(date_time)) # 정수로 바꾼 연도월일시분초 담기
                        time_temp.append(date_cnt) # 몇 번째 영상이었는지도 담기
                        date_cnt += 1

                        date_time_list.append(time_temp) # 최종 OCR 리스트에 담기
                        breakPoint = 1 # 이때도 탈출점 활성화

                if breakPoint == 1 : # 탈출점 1일 때 while문 빠져나오기
                    break 

            print(date_time_list) # 최종 OCR 확인하기

        date_time_list.sort() # 시간순으로 정렬

        print(date_time_list)

        entire_date_time_list.append(date_time_list)
        try :
            video_title = f"{date_time_list[0][0]}_{date_time_list[-1][0]}" # 첫 프레임과 마지막 프레임 시간으로 영상 제목 만들기
        except :
            video_title = "확인이 필요합니다"
            temp = [location_videos[0],1]
            entire_date_time_list.append(temp)
            print(date_time_list)
            break

        print("video_title = ", video_title)
        video_title_list.append(video_title)

        passing_value_img_time.append(video_title.split('_')[0]) # 넘겨줄 time에 OCR 결과 담아주기 (다 찾는다고 가정)
        passing_value_img_src.append(location_videos[0] + '/' + video_title) # 넘겨줄 src에 framedropped 영상 경로 담아주기

    return_values = {'passing_value_img_src' : passing_value_img_src,
                     'passing_value_img_length' : passing_value_img_length,
                     'passing_value_img_time' : passing_value_img_time,
                     'passing_value_origin_imgs' : passing_value_origin_imgs,
                     'entire_video_list' : entire_video_list,
                     'video_title_list' : video_title_list,
                     'entire_date_time_list' : entire_date_time_list,
                     'time_to_be_elapsed' : time_to_be_elapsed,
                     'location_list' : location_list}

    return return_values


def analyze (img_idx_list, episode_idx, passed_value_img_idx, return_values) :
    surl = "http://localhost:9090/sendWebSocketMessage"
    entire_video_list = return_values['entire_video_list']
    video_title_list = return_values['video_title_list']
    entire_date_time_list = return_values['entire_date_time_list']
    time_to_be_elapsed = return_values['time_to_be_elapsed']
    location_list = return_values['location_list']

    person_model = load_person_model()
    garments_model = load_garments_model()
    gender_age_model = load_gender_age_model()

    people_list = {} # 화면에서 사람 검출한 결과 담을 리스트
    

    font = cv2.FONT_HERSHEY_SIMPLEX # cv2.line() 에서 사용할 font

    total_processing = 0 # 총 진행도 표현할 변수
    people_cnt = 0
    for location_videos in entire_video_list : # 전체에서 개별 장소-영상마다
        people_list[location_videos[0]] = {}

        location_processing = 0 # 장소별 진행도 표현할 변수
        location_total_frames = 0 # 장소별 변환된 프레임 누적 (분모)

        video = cv2.VideoCapture(location_videos[1]) # 장소별 첫 번째 영상 불러오기

        width = int(video.get(cv2.CAP_PROP_FRAME_WIDTH)) # 너비 (사이즈 구하기)
        height = int(video.get(cv2.CAP_PROP_FRAME_HEIGHT)) # 높이 (사이즈 구하기)

        video_area = width * height

        size = (width, height) # 만들어질 영상의 사이즈

        # 만들 영상의 VideoWriter 객체 설정
        converted_fps = 2 # 변환할 FPS 설정
        out = cv2.VideoWriter(location_videos[0]+f'/_FrameDropped/{video_title_list[entire_video_list.index(location_videos)]}.mp4', cv2.VideoWriter_fourcc(*'mp4v'), converted_fps, size)
        
        for location_date_time in entire_date_time_list[entire_video_list.index(location_videos)] : # 장소별 시간 리스트마다 (각 영상마다)

            original_index = location_date_time[1] # 원래 인덱스 찾아옴
            video = cv2.VideoCapture(location_videos[0] + "/" + location_videos[original_index]) # 순서대로 영상 열기
            
            if not video.isOpened() :
                print("Could not Open :", location_videos[original_index])
                continue

            original_fps = video.get(cv2.CAP_PROP_FPS) # 영상 FPS
            current_video_processing = 0 # 영상 개별 진행도 표현할 변수
            frame_id = 0 # 프레임 위치 조작할 변수
            length = int(video.get(cv2.CAP_PROP_FRAME_COUNT)) # 현재 영상의 총 프레임 개수
            converted_length = int((length * converted_fps) / original_fps) # 바뀔 영상의 프레임 개수
            location_total_frames += converted_length

            color_list = [(255,0,0), (0,255,0), (0,0,255), (192,192,192), (255,255,0), (255,0,255),
                          (0, 0, 0), (204, 204, 102), (102, 102, 204), (51, 153, 51), (204, 153, 204),
                          (0, 255,255), (102, 0, 0), (102, 153, 153), (153, 51, 0), (0,128,128),
                          (0,0,128), (205,92,92), (218,165,32), (75,0,130), (218,112,214), (255,235,205),
                          (210,105,30), (222,184,135), (100,149,237), (102,205,170), (107,142,35),
                          (255,99,71), (233,150,122)]

            while True : # 개별 영상 안에서 (시간 순서)
                ret, image = video.read() # frame_id가 정해준 프레임 읽기
                people_result = person_model(image) # 읽은 프레임에서 person detection

                for i in range(len(people_result[0])) : # 모든 detection 결과에서
                    if people_result[0][i].names[int(people_result[0][i].boxes.cls[0].item())] == 'person' : # person을 찾으면
                        

                        if location_processing in people_list[location_videos[0]] :
                            people_list[location_videos[0]][location_processing] = {'person_box' : [], 'accessories' : [], 'garments' : [], 'gender_age' : []} # 장소별 영상 프레임을 키로 만듦

                        c = people_result[0].boxes.xyxy[i] # person 바운딩박스의 좌표값 (Coordinates)
                        bounded_image = image[int(c[1]):int(c[3]), int(c[0]):int(c[2])].copy() # Crop한 이미지 저장
                        bounded_area = (c[3] - c[1]) * (c[2] - c[0])
                        people_list[location_videos[0]][location_processing]['person_box'].append(c)

                        for obj in people_result[0].boxes.cls : # 악세서리
                            if people_result[0].names[int(obj.item())] in ['umbrella', 'backpack', 'handbag', 'tie', 'suitcase'] :
                                for box in people_list[location_videos[0]][location_processing]['person_box'] :
                                    if obj.xywh[0][0].item() in range(box[0].item(), box[2].item()) and obj.xywh[0][1].item() in range(box[1].item(), box[3].item()) :
                                        people_list[location_videos[0][location_processing]['accessories'].append(people_result[0][i].names[int(obj.item())])]

                        if bounded_area <= (video_area / 100) : # 전체 영상 면적의 1퍼센트보다 적다면
                            continue # 버린다

                        elif bounded_area <= (video_area / 50) : # 1~2퍼센트 사이라면
                            h, s, v = cv2.split(bounded_image) # 일단 hsv 나눠봄
                            if sum(v.flatten()) / len(v.flatten()) <= 120 : # V (밝기) 평균값이 120 이하이면
                                bounded_image = manipulate_image(bounded_image) # 이미지 전처리 실행
                            bounded_image = super_resolution(bounded_image) # SR실행

                        else : # 슈퍼레솔루션 필요없음
                            h, s, v = cv2.split(bounded_image)
                            if sum(v.flatten()) / len(v.flatten()) <= 120 :
                                bounded_image = manipulate_image(bounded_image)

                        garments_result = garments_model.predict(bounded_image, conf = 0.1) # 의복 검출 모델 작동
                        gender_age_result = gender_age_model.predict(bounded_image, conf = 0.1) # 성별, 나이 모델 작동

                        if type(garments_result) == ultralytics.yolo.engine.results.Results : # Results가 바로 나온 경우
                            if len(garments_result.boxes.cls) != 0 : # 검출되었을 때만
                                people_list[location_videos[0]][location_processing]['garments'].append(garments_result.names[int(garments_result.boxes.cls[0].item())])
                                image = cv2.rectangle(image, (int(c[0]),int(c[1])), (int(c[2]),int(c[3])), (0,0,255), 2) # person 표시해주기
                                image = cv2.putText(image, garments_result.names[int(garments_result.boxes.cls[0])], (int(c[0]), int(c[1])), font, 1.5, (0, 0, 255), 2)

                        elif type(garments_result) == list : # garments_result가 리스트인 경우
                            garments_result = garments_result[0]
                            if len(garments_result.boxes.cls) != 0 :
                                people_list[location_videos[0]][location_processing]['garments'].append(garments_result.names[int(garments_result.boxes.cls[0].item())])
                                image = cv2.rectangle(image, (int(c[0]),int(c[1])), (int(c[2]),int(c[3])), (0,0,255), 2) # person 표시해주기
                                image = cv2.putText(image, garments_result.names[int(garments_result.boxes.cls[0])], (int(c[0]), int(c[1])), font, 1.5, (0, 0, 255), 2)


                        if type(gender_age_result) == ultralytics.yolo.engine.results.Results : # Results가 바로 나온 경우
                            if len(gender_age_result.boxes.cls) != 0 : # 검출되었을 때만
                                people_list[location_videos[0]][location_processing]['gender_age'].append(gender_age_result.names[int(gender_age_result.boxes.cls[0].item())])
                                image = cv2.rectangle(image, (int(c[0]),int(c[1])), (int(c[2]),int(c[3])), (0,0,255), 2) # person 표시해주기
                                image = cv2.putText(image, gender_age_result.names[int(gender_age_result.boxes.cls[0])], (int(c[0]), int(c[1])), font, 1.5, (0, 0, 255), 2)

                        elif type(gender_age_result) == list : # garments_result가 리스트인 경우
                            gender_age_result = gender_age_result[0]
                            if len(gender_age_result.boxes.cls) != 0 :
                                people_list[location_videos[0]][location_processing]['gender_age'].append(gender_age_result.names[int(gender_age_result.boxes.cls[0].item())])
                                image = cv2.rectangle(image, (int(c[0]),int(c[1])), (int(c[2]),int(c[3])), (0,0,255), 2) # person 표시해주기
                                image = cv2.putText(image, gender_age_result.names[int(gender_age_result.boxes.cls[0])], (int(c[0]), int(c[1])), font, 1.5, (0, 0, 255), 2)

                        people_cnt += 1

                print(f'원본 영상의 다음 프레임을 읽었습니다 : {int(frame_id)} / {length}')
                print(f'현재 영상의 변환된 프레임 : {current_video_processing} / {converted_length}')
                print(f'현재 {entire_video_list.index(location_list) + 1}번 장소 진행도입니다 : {location_processing} / {location_total_frames}')
                print(f'전체 진행도 : {total_processing} / {time_to_be_elapsed}')

                out.write(image)

                frame_id = frame_id + length / converted_length
                video.set(cv2.CAP_PROP_POS_FRAMES, int(frame_id))
                location_processing += 1
                current_video_processing += 1
                

                if total_processing % 10 == 0 :
                    transfer_data(surl, episode_idx, total_processing)

                total_processing += 1

                if(frame_id >= length) :
                    video.release() # Open 해제
                    frame_id = 0
                    break
            

            # identical_object = []
            # isfirst = list(np.zeros(len(garments_list)))

            # i = 0
            # j = 0
            # temp = []
            # while i < len(garments_list) :
            #     if isfirst[i] == 0 :
            #         isfirst[i] = 1
            #         temp.append(i)
            #     else :
            #         i += 1
            #         continue
            #     ith_dot_X = garments_list[i].boxes.xywhn[0][0].item()
            #     ith_dot_Y = garments_list[i].boxes.xywhn[0][1].item()
            #     ith_imgsz = garments_list[i].orig_shape[0] * garments_list[i].orig_shape[1]
            #     cnt = 0
            #     for j in range(i+1, len(garments_list)) :
            #         jth_dot_X = garments_list[j].boxes.xywhn[0][0].item()
            #         jth_dot_Y = garments_list[j].boxes.xywhn[0][1].item()
            #         jth_imgsz = garments_list[j].orig_shape[0] * garments_list[j].orig_shape[1]
                    
            #         distance = math.sqrt((ith_dot_X - jth_dot_X) **2 + (ith_dot_Y - jth_dot_Y) **2)
            #         if distance < 0.09 and abs(ith_imgsz - jth_imgsz) < 100 :
            #             print(f'{i, j} 같습니다.')
            #             i = j
            #             cnt += 1
            #             break
            #     if cnt == 0 :
            #         identical_object.append(temp)
            #         temp = []
            #         try :
            #             i = isfirst.index(0)
            #         except :
            #             break

            # identical_object


        out.release()
        print("*"*50)
        print("*"*50)
        print('변환 영상들의 총 프레임 수 >> ', total_processing)
        print("사람의 수 >> ", people_cnt)
        print("*"*50)
        print("*"*50)

    return_values = {'img_idx_list' : img_idx_list,
                     'entire_video_list' : entire_video_list,
                     'video_title_list' : video_title_list,
                     'entire_date_time_list' : entire_date_time_list,
                     'time_to_be_elapsed' : time_to_be_elapsed,
                     'location_list' : location_list}


    return passed_value_img_idx, people_list, return_values

# def transfer_data(episode_idx, total_processing) :
#     return_dict = {
#         'episode_idx' : episode_idx,
#         'total_processing' : total_processing
#     }
#     return return_dict