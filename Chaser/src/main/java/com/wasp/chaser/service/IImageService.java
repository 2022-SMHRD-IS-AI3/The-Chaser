package com.wasp.chaser.service;

import java.util.List;

import com.wasp.chaser.domain.ImageDTO;

public interface IImageService {

	public void insert(ImageDTO img) throws Exception;
		
	public List<ImageDTO> listAll(int img_idx) throws Exception;
	
	public boolean delete(int img_idx) throws Exception;
	
}
