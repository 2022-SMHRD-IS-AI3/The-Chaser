# The-Chaser
이문석, 유종국, 김용훈, 안운암, 심우석, 장민혁

# 1. 프로젝트 개요
**주제 : 인상착의를 기반으로 이미지, 영상처리를 잛은시간에 지치지 않 다량의 데이터를 분석하는 AI Model Solution**

* 입력한 인상착의를 기반으로 영상을 로컬pc에서 불러와 분석하고 싶은 영상들을 선택하여 인상착의 일치율이 높은순으로 용의자를 나열하고 이동경로를 지도 API를 사용하여 시각화 해주는 기능 제공*


**프로젝트 명 : The Chaser**

**프로젝트 팀명 : Team.AI 왓슨**

**프로젝트 기간 : 2023.05.29 ~ 2023.06.22**


# 2. 주요기능
### 개발 목표 : 객체 탐지(Yolov8) 및 Instance Segmentaition (Mask R-CNN)을 이용한 CCTV 영상에서의 용의자 추적


### 개발 내용 
* 범죄자 등록 기능 (사진, 레이블)
* 사람 탐지 기능
* 레이블 추출 기능
* 영상 업로드 기능
* 이동경로 트래킹 및 예측 기능
* 영상 실시간 분석 기


# 3. 개발환경
![develop](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/23a1a35d-16c6-47cc-9e1f-80a7942320e6)

# 4. 유스케이스
![usecase](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/962937bd-2eab-4a40-ba5f-eaa7dd692137)

# 5. WEB페이지
* 메인 페이지
![스크린샷 2023-07-04 092132](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/5886cfbf-0362-4566-b620-dc882a0eea2f)

* 도움말 및 가이드 페이지
![desc](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/f8c07fb6-0816-4981-b149-c466681255b9)

* 사건 목록 페이지
![list](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/455edf25-1f92-4e05-95b3-82a9a7644599)

* 인상착의 등록 페이지
![appe](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/6dccfbc0-e073-405a-91f4-d342902cd5bb)

* 영상 선택 페이지 (지도 API를 통해 영상위치 선택)
![select](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/11093a54-e947-4eaa-a33a-feb1747b97f5)
* 영상 분석 페이지 (FLASK를 통해 실시간 분석)
![analyzing](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/1296e054-f9a9-4716-b1e5-7a07fe66ff82)
* 영상 분석 결과 페이지
![result1](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/533ab120-f9b8-4339-8fea-74832900030e)
* 선택한 용의자 경로 시각화 페이지
![result2](https://github.com/2022-SMHRD-IS-AI3/The-Chaser/assets/125546505/20ad8661-5db0-44af-965c-c8b04ccbb7d8)
