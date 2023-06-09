package com.wasp.chaser.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wasp.chaser.domain.AppeDTO;
import com.wasp.chaser.domain.EpisodeDTO;
import com.wasp.chaser.persistence.impl.AppeDAOImpl;
import com.wasp.chaser.persistence.impl.EpisodeDAOImpl;
import com.wasp.chaser.service.IAppeService;

@Service
public class AppeServiceImpl implements IAppeService{
	
	@Autowired
	private AppeDAOImpl aDao;
	
	@Autowired
	private EpisodeDAOImpl eDao;

	@Override
	public void insert(AppeDTO appe) throws Exception {
		aDao.insert(appe);
		EpisodeDTO eDto = new EpisodeDTO();
		eDto.setEpisode_idx(appe.getEpisode_idx());
		eDto.setEpisode_flag('1');
		eDao.updateFlag(eDto);
		
		
	}

	@Override
	public AppeDTO read(int appe_idx) throws Exception {
		return aDao.read(appe_idx);
	}

	@Override
	public boolean delete(int appe_idx) throws Exception {
		return aDao.delete(appe_idx) == 1;
	}

}
