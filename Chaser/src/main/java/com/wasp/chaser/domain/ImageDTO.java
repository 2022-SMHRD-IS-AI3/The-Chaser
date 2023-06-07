package com.wasp.chaser.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageDTO {
	
	private int img_idx;			// 영상 순번
	private String img_nm;		// 영상 이름
	private String img_src;			// 영상 파일 주소
	private String img_xy;			// 영상이 찍힌 좌표
	private int img_length;			// 영상 총 프레임 수
	private Date img_time;			// 영상이 찍힌 시간
	private String origin_img_src;		// 원본 영상 파일 주소
	private String origin_img_first;	// 원본 영상 첫 파일
	private String origin_img_last;		// 원본 영상 마지막 파일
	private Integer episode_idx;			// 사건 번호
	
	private List<WantedDTO> wantedDTOList;	// 영상에 나온 후보자 목록

}
