package com.wasp.chaser.persistence;

import java.util.List;

import com.wasp.chaser.domain.ImageDTO;

public interface IImageDAO {
	
	// 분석할 영상 작성
	public void insert(ImageDTO image) throws Exception;
	
	// 분석 영상 리스트 불러오기 (분석되기 전, 분석된 후 둘 다)
	public List<ImageDTO> listAll(int episode_idx) throws Exception;
	
	// 분석된 영상 업데이트
	public int update(ImageDTO image) throws Exception;
	
	// 영상 삭제
	public int delete(int img_idx) throws Exception;

}
