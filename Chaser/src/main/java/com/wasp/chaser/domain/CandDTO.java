package com.wasp.chaser.domain;

public class CandDTO {
	
	private int cand_idx;				// 용의자 후보 순번
	private int cand_first;				// 영상에서 나온 첫 프레임
	private int cand_last;				// 영상에서 사라진 끝 프레임
	private String cand_thumb;			// 인물이 나온 대표이미지
	private String cand_clip;			// 인물이 나온 클립 영상
	private String cand_color;			// 인물의 바운딩 박스 색깔
	private int cand_flag;				// 인물의 상태
	private int cand_per;				// 인상착의와의 일치율
	private int case_idx;				// 사건 번호
	private int img_idx;				// 영상 순번
	private int appe_idx;				// 인상착의 순번

}
