package com.wasp.chaser.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wasp.chaser.domain.AppeDTO;
import com.wasp.chaser.persistence.impl.AppeDAOImpl;
import com.wasp.chaser.service.IAppeService;

@Service
public class AppeServiceImpl implements IAppeService{
	
	@Autowired
	private AppeDAOImpl aDao;

	@Override
	public void insert(AppeDTO appe) throws Exception {
		aDao.insert(appe);
		
	}

	@Override
	public AppeDTO read(int appe_idx) throws Exception {
		return aDao.read(appe_idx);
	}

	@Override
	public boolean update(AppeDTO appe) throws Exception {
		return aDao.update(appe) == 1;
	}

	@Override
	public boolean delete(int appe_idx) throws Exception {
		return aDao.delete(appe_idx) == 1;
	}

}
