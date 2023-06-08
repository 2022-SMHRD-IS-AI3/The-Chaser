package com.wasp.chaser.persistence;

import java.util.List;

import com.wasp.chaser.domain.Criteria;
import com.wasp.chaser.domain.EpisodeDTO;

public interface IEpisodeDAO {
	
	// 사건 작성
	public void insert(EpisodeDTO episode) throws Exception;
	
	// 사건 열기
	public EpisodeDTO read(int episode_idx) throws Exception;
	
	// 사건 수정
	public int update(EpisodeDTO episode) throws Exception;
	
	// 사건 삭제
	public int delete(int episode_idx) throws Exception;
	
	// 사건 리스트
	public List<EpisodeDTO> listAll(Criteria cri) throws Exception;
	
	// 사건 상태 수정
	public int updateFlag(EpisodeDTO episode) throws Exception;
	
	// 사건 종결
	public int updateEnd(EpisodeDTO episode) throws Exception;
	
	
}
