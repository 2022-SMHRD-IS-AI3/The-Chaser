package com.wasp.chaser.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AppeDTO {
	
	private int appe_idx;					// 인상착의 순번
	private int case_idx;					// 사건 번호
	private String appe_top_type;			// 상의 종루
	private String appe_top_color;			// 상의 색상
	private String appe_bottom_type;		// 하의 종류
	private String appe_bottom_color;		// 하의 색상
	private String appe_stuff_type;			// 소지품 종류
	private String appe_stuff_color;		// 소지품 색상
	private char appe_gender;				// 성별
	private int appe_age;					// 연령대
	private int appe_height;				// 키
	private String appe_form;				// 체형

}
