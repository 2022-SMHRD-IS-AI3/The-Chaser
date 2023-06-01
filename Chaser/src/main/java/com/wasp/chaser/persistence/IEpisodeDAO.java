package com.wasp.chaser.persistence;

import java.util.List;

import com.wasp.chaser.domain.EpisodeDTO;

public interface IEpisodeDAO {
	
	// 사건 생성
	public void create(EpisodeDTO episode) throws Exception;
	
	// 사건 열기
	public EpisodeDTO read(Integer episode_idx) throws Exception;
	
	// 사건 수정
	public int update(EpisodeDTO episode) throws Exception;
	
	// 사건 삭제
	public int delete(Integer episode_idx) throws Exception;
	
	// 사건 리스트
	public List<EpisodeDTO> listAll() throws Exception;
	
	
}
