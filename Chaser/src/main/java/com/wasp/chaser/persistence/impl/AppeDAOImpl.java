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
		sqlSession.insert(namespace + ".insert", appe);
	}

	@Override
	public AppeDTO read(int episode_idx) throws Exception {
		return sqlSession.selectOne(namespace + ".read", episode_idx);
	}

	@Override
	public int update(AppeDTO appe) throws Exception {
		return sqlSession.update(namespace + ".update", appe);
	}

	@Override
	public int delete(int episode_idx) throws Exception {
		return sqlSession.delete(namespace + ".delete", episode_idx);
	}

}
