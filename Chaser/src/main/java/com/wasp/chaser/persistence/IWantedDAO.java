package com.wasp.chaser.persistence;

import java.util.List;

import com.wasp.chaser.domain.WantedDTO;

public interface IWantedDAO {
	
	// 후보 리스트 불러오기
	public List<WantedDTO> listAll(WantedDTO wanted) throws Exception;
	
	// 후보 수정
	public int update(WantedDTO wanted) throws Exception;
	
	// 후보 삭제
	public int delete(int w_idx) throws Exception;
	
	// 후보 전체 삭제
	public int deleteAll(int img_idx) throws Exception;
}
