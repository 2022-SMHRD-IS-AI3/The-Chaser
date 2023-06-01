package com.wasp.chaser.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageDTO {
	
	private int img_idx;			// 영상 순번
	private String img_name;		// 영상 이름
	private String img_src;			// 영상 파일 주소
	private String img_loc;			// 영상이 찍힌 좌표
	private int img_len;			// 영상 총 프레임 수
	private int img_time;			// 영상이 찍힌 시간
	private int case_idx;			// 사건 번호

}
