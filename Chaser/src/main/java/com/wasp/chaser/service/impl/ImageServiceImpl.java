package com.wasp.chaser.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wasp.chaser.domain.ImageDTO;
import com.wasp.chaser.persistence.impl.ImageDAOImpl;
import com.wasp.chaser.service.IImageService;

@Service
public class ImageServiceImpl implements IImageService{
	
	@Autowired
	private ImageDAOImpl iDao;

	@Override
	public void insert(ImageDTO img) throws Exception {
		iDao.insert(img);
	}

	@Override
	public List<ImageDTO> listAll(int img_idx) throws Exception {
		return iDao.listAll(img_idx);
	}

	@Override
	public boolean delete(int img_idx) throws Exception {
		return iDao.delete(img_idx) == 1;
	}


}
