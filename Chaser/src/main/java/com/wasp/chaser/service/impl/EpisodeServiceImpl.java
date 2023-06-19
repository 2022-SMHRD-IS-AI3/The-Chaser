package com.wasp.chaser.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wasp.chaser.domain.Criteria;
import com.wasp.chaser.domain.EpisodeDTO;
import com.wasp.chaser.persistence.impl.EpisodeDAOImpl;
import com.wasp.chaser.service.IEpisodeService;

@Service
public class EpisodeServiceImpl implements IEpisodeService {

	@Autowired
	private EpisodeDAOImpl eDao;
	
		
	@Override
	public void insert(EpisodeDTO episode) throws Exception {
		eDao.insert(episode);
		
	}

	@Override
	public EpisodeDTO read(int episode_idx) throws Exception {
		return eDao.read(episode_idx);
	}

	@Override
	public boolean update(EpisodeDTO episode) throws Exception {
		return eDao.update(episode) == 1;
	}

	@Override
	public boolean delete(int episode_idx) throws Exception {
		return eDao.delete(episode_idx) == 1;
	}

	@Override
	public List<EpisodeDTO> listAll(Criteria cri) throws Exception {
		return eDao.listAll(cri);
	}

	@Override
	public boolean updateFlag(EpisodeDTO episode) throws Exception {
		return eDao.updateFlag(episode) == 1;
	}

	@Override
	public boolean updateEnd(EpisodeDTO episode) throws Exception {
		return eDao.updateEnd(episode) == 1;
	}

	@Override
	public int getTotalCnt(Criteria cri) throws Exception {
		return eDao.getTotalCnt(cri);
		
	}

	@Override
	public String getEpisodeLoc(int episode_idx) throws Exception {
		return eDao.getEpisodeLoc(episode_idx);
	}

}
