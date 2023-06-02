package com.wasp.chaser.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wasp.chaser.domain.ImageDTO;
import com.wasp.chaser.persistence.IImageDAO;

public class ImageDAOImpl implements IImageDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.wasp.chaser.imageMapper";
	
	@Override
	public void insert(int image) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ImageDTO> listAll(int episode_idx) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int img_idx) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
