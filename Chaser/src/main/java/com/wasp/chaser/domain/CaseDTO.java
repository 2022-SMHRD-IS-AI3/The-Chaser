package com.wasp.chaser.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CaseDTO {

	private Integer case_idx;			// 사건 번호
	private String case_title;			// 사건 제목
	private String case_type;			// 사건 유형
	private String case_loc;			// 사건 위치
	private Date case_time;				// 사건 발생 시간
	private Date case_start;			// 사건 생성 시간
	private Date case_end;				// 사건 완료 시간
	private String case_contents;		// 사건 내용
	private int case_flag;				// 사건 상태
	
}
