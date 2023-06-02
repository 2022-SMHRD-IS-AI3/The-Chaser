package com.wasp.chaser.persistence;

import java.util.List;

import com.wasp.chaser.domain.ImageDTO;

public interface IImageDAO {
	
	// 영상 작성
	public void insert(int image) throws Exception;
	
	// 영상 리스트 불러오기
	public List<ImageDTO> listAll(int episode_idx) throws Exception;
	
	// 영상 삭제
	public int delete(int img_idx) throws Exception;

}
