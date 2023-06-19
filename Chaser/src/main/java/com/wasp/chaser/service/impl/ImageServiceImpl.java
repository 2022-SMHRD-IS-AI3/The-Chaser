package com.wasp.chaser.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wasp.chaser.domain.EpisodeDTO;
import com.wasp.chaser.domain.ImageDTO;
import com.wasp.chaser.domain.WantedDTO;
import com.wasp.chaser.persistence.impl.EpisodeDAOImpl;
import com.wasp.chaser.persistence.impl.ImageDAOImpl;
import com.wasp.chaser.persistence.impl.WantedDAOImpl;
import com.wasp.chaser.service.IImageService;

@Service
public class ImageServiceImpl implements IImageService{
	
	@Autowired
	private ImageDAOImpl iDao;
	
	@Autowired
	private WantedDAOImpl wDao;
	
	@Autowired
	private EpisodeDAOImpl eDao;

	@Override
	public void insert(ImageDTO img) throws Exception {
		iDao.insert(img);
		
		EpisodeDTO eDto = new EpisodeDTO();
		eDto.setEpisode_idx(img.getEpisode_idx());
		eDto.setEpisode_flag('2');
		eDao.updateFlag(eDto);
	}
	
	@Override
	public List<ImageDTO> beforeListAll(int episode_idx) throws Exception {
		return iDao.beforeListAll(episode_idx);
	}
	
	@Override
	public List<ImageDTO> afterListAll(int episode_idx) throws Exception {
		List<ImageDTO> imgList = iDao.afterListAll(episode_idx);
		for(ImageDTO img : imgList) {
			WantedDTO wanted = new WantedDTO();
			wanted.setEpisode_idx(img.getEpisode_idx());
			wanted.setImg_idx(img.getImg_idx());
			img.setWantedDTOList(wDao.listAll(wanted));
		}
		return imgList;
	}

	@Override
	public ImageDTO getImageOne(ImageDTO image) throws Exception {
		return iDao.getImageOne(image);
	}

	@Override
	public boolean delete(int img_idx) throws Exception {
		return iDao.delete(img_idx) == 1;
	}

	@Override
	public boolean update(ImageDTO imageDTO) throws Exception {
		boolean b = iDao.update(imageDTO) == 1;
		
		EpisodeDTO eDto = new EpisodeDTO();
		eDto.setEpisode_idx(imageDTO.getEpisode_idx());
		eDto.setEpisode_flag('3');
		eDao.updateFlag(eDto);
		
		return b;
	}

	@Override
	public List<ImageDTO> resultListAll(int episode_idx) throws Exception {
		return iDao.resultListAll(episode_idx);	
	}


}
