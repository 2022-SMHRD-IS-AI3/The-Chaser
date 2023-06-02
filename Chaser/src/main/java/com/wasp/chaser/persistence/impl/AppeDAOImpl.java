package com.wasp.chaser.persistence.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wasp.chaser.domain.AppeDTO;
import com.wasp.chaser.persistence.IAppeDAO;

@Repository
public class AppeDAOImpl implements IAppeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.wasp.chaser.appeMapper";

	@Override
	public void insert(AppeDTO appe) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public AppeDTO read(int episode_idx) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(AppeDTO appe) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int episode_idx) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
