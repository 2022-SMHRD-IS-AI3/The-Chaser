package com.wasp.chaser.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wasp.chaser.domain.ImageDTO;
import com.wasp.chaser.persistence.IImageDAO;

@Repository
public class ImageDAOImpl implements IImageDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.wasp.chaser.imageMapper";
	
	@Override
	public void insert(ImageDTO image) throws Exception {
		sqlSession.insert(namespace + ".insert", image);	
	}
	
	@Override
	public int delete(int img_idx) throws Exception {
		return sqlSession.delete(namespace + ".delete", img_idx);
	}

	@Override
	public int update(ImageDTO image) throws Exception {
		return sqlSession.update(namespace + ".update", image);
	}

	@Override
	public List<ImageDTO> beforeListAll(int episode_idx) throws Exception {
		return sqlSession.selectList(namespace + ".beforeListAll", episode_idx);
	}

	@Override
	public List<ImageDTO> afterListAll(int episode_idx) throws Exception {
		return sqlSession.selectList(namespace + ".afterListAll", episode_idx);
	}


}
