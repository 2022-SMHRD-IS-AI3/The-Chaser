package com.wasp.chaser.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wasp.chaser.domain.WantedDTO;
import com.wasp.chaser.persistence.impl.WantedDAOImpl;
import com.wasp.chaser.service.IWantedService;

@Service
public class WantedServiceImpl implements IWantedService{
	
	@Autowired
	private WantedDAOImpl wDao;

	@Override
	public void insert(WantedDTO wanted) throws Exception {
		wDao.insert(wanted);
		
	}
	
	@Override
	public List<WantedDTO> listAll(WantedDTO wanted) throws Exception {
		return wDao.listAll(wanted);
	}

	@Override
	public boolean update(WantedDTO wanted) throws Exception {
		return wDao.update(wanted) == 1;
	}

	@Override
	public boolean delete(int w_idx) throws Exception {
		return wDao.delete(w_idx) == 1;
	}

	@Override
	public boolean deleteAll(int img_idx) throws Exception {
		return wDao.deleteAll(img_idx) >= 1;
	}

}
