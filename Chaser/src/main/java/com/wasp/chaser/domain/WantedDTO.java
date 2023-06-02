package com.wasp.chaser.domain;

public class WantedDTO {
	
	private int w_idx;				// 용의자 후보 순번
	private int w_first;				// 영상에서 나온 첫 프레임
	private int w_last;				// 영상에서 사라진 끝 프레임
	private String w_thumb;			// 인물이 나온 대표이미지
	private String w_clip;			// 인물이 나온 클립 영상
	private String w_color;			// 인물의 바운딩 박스 색깔
	private char w_flag;				// 인물의 상태
	private int w_per;				// 인상착의와의 일치율
	private int episode_idx;				// 사건 번호
	private int img_idx;				// 영상 순번
	private int appe_idx;				// 인상착의 순번

}
