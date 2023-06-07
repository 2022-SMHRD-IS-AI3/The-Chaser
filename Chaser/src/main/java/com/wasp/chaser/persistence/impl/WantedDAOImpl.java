package com.wasp.chaser.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wasp.chaser.domain.WantedDTO;
import com.wasp.chaser.persistence.IWantedDAO;

@Repository
public class WantedDAOImpl implements IWantedDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.wasp.chaser.wantedMapper";
	
	@Override
	public List<WantedDTO> listAll(WantedDTO wanted) throws Exception {
		return sqlSession.selectList(namespace + ".listAll", wanted);
	}

	@Override
	public int update(WantedDTO wanted) throws Exception {
		return sqlSession.update(namespace + ".update", wanted);
	}

	@Override
	public int delete(int w_idx) throws Exception {
		return sqlSession.delete(namespace + ".delete", w_idx);
	}

	@Override
	public int deleteAll(int img_idx) throws Exception {
		return sqlSession.delete(namespace + ".deleteAll", img_idx);
	}

}
