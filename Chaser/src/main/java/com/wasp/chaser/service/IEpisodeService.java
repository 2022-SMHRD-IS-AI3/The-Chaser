package com.wasp.chaser.service;

import java.util.List;

import com.wasp.chaser.domain.EpisodeDTO;

public interface IEpisodeService {
	
	public void insert(EpisodeDTO episode) throws Exception;
	
	public EpisodeDTO read(int episode_idx) throws Exception;
	
	public boolean update(EpisodeDTO episode) throws Exception;
	
	public boolean delete(int episode_idx) throws Exception;
	
	public List<EpisodeDTO> listAll() throws Exception;

}
