package com.wasp.chaser.service;

import java.util.List;

import com.wasp.chaser.domain.Criteria;
import com.wasp.chaser.domain.EpisodeDTO;

public interface IEpisodeService {
	
	public void insert(EpisodeDTO episode) throws Exception;
	
	public EpisodeDTO read(int episode_idx) throws Exception;
	
	public boolean update(EpisodeDTO episode) throws Exception;
	
	public boolean delete(int episode_idx) throws Exception;
	
	public List<EpisodeDTO> listAll(Criteria cri) throws Exception;
	
	public boolean updateFlag(EpisodeDTO episode) throws Exception;
	
	public boolean updateEnd(EpisodeDTO episode) throws Exception;

	public int getTotalCnt(Criteria cri) throws Exception;

	public String getEpisodeLoc(int episode_idx) throws Exception;
}
