package com.wasp.chaser.service;

import java.util.List;

import com.wasp.chaser.domain.ImageDTO;

public interface IImageService {

	// 영상 파일 삽입
	public void insert(ImageDTO img) throws Exception;
		
	// 분석할 영상 파일 리스트
	public List<ImageDTO> beforeListAll(int episode_idx) throws Exception;
	
	// 분석한 영상 파일 리스트
	public List<ImageDTO> afterListAll(int episode_idx) throws Exception;
	
	// 분석된 영상 업데이트
	public boolean update(ImageDTO imageDTO) throws Exception;
	
	// 영상 파일 삭제
	public boolean delete(int img_idx) throws Exception;
	
}
