package com.wasp.chaser.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wasp.chaser.domain.ImageDTO;
import com.wasp.chaser.domain.WantedDTO;
import com.wasp.chaser.persistence.impl.ImageDAOImpl;
import com.wasp.chaser.persistence.impl.WantedDAOImpl;
import com.wasp.chaser.service.IImageService;

@Service
public class ImageServiceImpl implements IImageService{
	
	@Autowired
	private ImageDAOImpl iDao;
	
	@Autowired
	private WantedDAOImpl wDao;

	@Override
	public void insert(ImageDTO img) throws Exception {
		iDao.insert(img);
	}

	@Override
	public List<ImageDTO> listAll(int img_idx) throws Exception {
		List<ImageDTO> imgList = iDao.listAll(img_idx);
		for(ImageDTO img : imgList) {
			WantedDTO wanted = new WantedDTO();
			wanted.setEpisode_idx(img.getEpisode_idx());
			wanted.setImg_idx(img.getImg_idx());
			img.setWantedDTOList(wDao.listAll(wanted));
		}
		return imgList;
	}

	@Override
	public boolean delete(int img_idx) throws Exception {
		return iDao.delete(img_idx) == 1;
	}

	@Override
	public boolean update(ImageDTO img) throws Exception {
		return iDao.update(img) == 1;
	}


}
