package com.wasp.chaser.service;

import com.wasp.chaser.domain.AppeDTO;

public interface IAppeService {

	public void insert(AppeDTO appe) throws Exception;
	
	public AppeDTO read(int appe_idx) throws Exception;
	
	public boolean update(AppeDTO appe) throws Exception;
	
	public boolean delete(int appe_idx) throws Exception;
	
}
