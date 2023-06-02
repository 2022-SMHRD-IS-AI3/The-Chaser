package com.wasp.chaser.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wasp.chaser.domain.WantedDTO;
import com.wasp.chaser.persistence.IWantedDAO;

public class WantedDAOImpl implements IWantedDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.wasp.chaser.wantedMapper";
	
	@Override
	public List<WantedDTO> listAll(int episode_idx, int img_idx) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(int w_idx) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int w_idx) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
