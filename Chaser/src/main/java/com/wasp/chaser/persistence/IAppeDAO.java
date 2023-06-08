package com.wasp.chaser.persistence;

import com.wasp.chaser.domain.AppeDTO;

public interface IAppeDAO {
	
	// 인상착의 작성, 수정
	public void insert(AppeDTO appe) throws Exception;
	
	// 인상착의 불러오기
	public AppeDTO read(int episode_idx) throws Exception;
		
	// 인상착의 삭제
	public int delete(int episode_idx) throws Exception;
	

}
