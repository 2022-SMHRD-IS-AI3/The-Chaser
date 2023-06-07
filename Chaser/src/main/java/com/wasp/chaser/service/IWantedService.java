package com.wasp.chaser.service;

import java.util.List;

import com.wasp.chaser.domain.WantedDTO;

public interface IWantedService {

	public List<WantedDTO> listAll(WantedDTO wanted) throws Exception;
	
	public boolean update(WantedDTO wanted) throws Exception;
	
	public boolean delete(int w_idx) throws Exception;
	
	public boolean deleteAll(int img_idx) throws Exception;
	
}
