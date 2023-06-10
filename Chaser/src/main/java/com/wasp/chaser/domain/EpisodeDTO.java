package com.wasp.chaser.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EpisodeDTO {

	private Integer episode_idx;			// 사건 번호
	private String episode_type;			// 사건 유형
	private String episode_title;			// 사건 제목
	private String episode_content;			// 사건 내용
	private String episode_loc;				// 사건 위치
	private String time_string;
	private Date episode_time;				// 사건 발생 시간
	private Date episode_start_dt;			// 사건 생성 시간
	private Date episode_end_dt;			// 사건 완료 시간
	private char episode_flag;				// 사건 상태
	
}
