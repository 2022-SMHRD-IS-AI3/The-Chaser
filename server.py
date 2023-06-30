# 플라스크 클래스 임포트
from flask import Flask
from flask import request, redirect, url_for
import requests
import time
from ultralytics import YOLO
import cv2
import os
import re
import pytesseract
import numpy as np
import json
from gara_module import load_person_model, load_garments_model, load_gender_age_model, load_sr_model, preprocess_image, save_image, super_resolution, manipulate_image, OCR, analyze, transfer_data

os.environ["PYTORCH_CUDA_ALLOC_CONF"] = "max_split_size_mb:512"

# GPU 확인
import ultralytics
ultralytics.checks()

# 파이썬 버전확인 - 3.7 이상인지 확인
import sys
print(sys.version)

# pytorch 버전확인 - 1.7 이상인지 확인
import torch
print(torch.__version__)

# CUDA 확인
print(torch.cuda.is_available())
print(torch.backends.cudnn.version())

import matplotlib.pyplot as plt
from PIL import Image
import tensorflow as tf

from analyzing_model import load_person_model, load_garments_model, OCR, analyze


app = Flask(__name__) # 내장변수 name을 이용해 서버를 구동시키는 객체 생성

@app.route("/", methods=['POST'])
def hello() :
    a = request.get_json()
    episode_idx = a['imgList'][0]['episode_idx']

    location_list = []
    img_idx_list = []
    for i in a['imgList'][0]['imgDTOList'] :
        location_list.append(i['origin_img_src'])
        img_idx_list.append(i['img_idx'])

    return_values = OCR(location_list)

    surl = "http://localhost:9090/sendWebSocketMessage"

    ocr_dict = {
        'episode_idx' : episode_idx,
        'img_list' : return_values['passing_value_img_length']
    }

    requests.post(surl, data=json.dumps(ocr_dict))

    img_src_list = np.array(return_values['passing_value_img_src'])
    img_length_list = np.array(return_values['passing_value_img_length'])
    img_time_list = np.array(return_values['passing_value_img_time'])
    origin_imgs_list = np.array(return_values['passing_value_origin_imgs'])
    
    concat1 = np.concatenate((img_src_list, img_length_list), axis = 1)
    concat2 = np.concatenate((concat1, img_time_list), axis = 1)
    concat3 = np.concatenate((concat2, origin_imgs_list), axis = 1)
    
    transfer_to_DTO = concat3.T # imgDTO에 정보 넘겨줄 List
    
    passed_value_img_idx, people_list, return_values = analyze(img_idx_list, episode_idx, passed_value_img_idx, return_values)
    
    
    

    print(a)
    result_list = []



    for i in a['imgList'][0]['imgDTOList'] :
        
        print("-----------------------------------------------------------------")
        print(f"영상 번호 : {i['img_idx']}")
        print(f"영상 이름 : {i['img_nm']}")
        print(f"영상 원본 주소 : {i['origin_img_src']}")
        print(f"영상 원본들 : {i['origin_imgs']}")
        
        for t in range(len(transfer_to_DTO)) :
            w_last = []
            w_first = list(people_list[t].keys())
            for first in w_first :
                if first > transfer_to_DTO[t][1] - 11 :
                    w_last.append(transfer_to_DTO[t][1])
                else :
                    w_last.append(first + 10)

            result = {'img_idx' : i['img_idx'],'img_src' : transfer_to_DTO[t][0], 'img_length' : transfer_to_DTO[t][1], 'img_time' : transfer_to_DTO[t][2], 'origin_imgs' : transfer_to_DTO[t][3], 
                      'wantedDTOList' : [{'w_first' : w_first, 'w_last' : w_last, 'w_per' : 23}]}


            result_list.append(result)
    print("-----------------------------------------------------------------")
    print(a['imgList'][0]['appe'])
    print("-----------------------------------------------------------------")
    
    return result_list

def transfer_data(surl, episode_idx, total_processing) :
    return_dict = {
        'episode_idx' : episode_idx,
        'img_frame' : total_processing
    }
    requests.post(surl, data=json.dumps(return_dict))

if __name__ == "__main__" :    # .py 파일에서 main함수 역할
    app.run(host="0.0.0.0", port = "9091")