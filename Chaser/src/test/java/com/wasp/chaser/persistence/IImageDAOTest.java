package com.wasp.chaser.persistence;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wasp.chaser.domain.ImageDTO;
import com.wasp.chaser.persistence.IImageDAO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
@Log4j
public class IImageDAOTest {
	
	@Autowired
	private IImageDAO iDao;

//	@Test
//	public void testInsert() throws Exception{
//		ImageDTO iDto = new ImageDTO();
//		iDto.setImg_nm("영상 이름");
//		iDto.setImg_src("이미지 경로");
//		iDto.setImg_xy("이미지 좌표");
//		iDto.setImg_length(394810);
//		iDto.setEpisode_idx(1);
//		iDto.setImg_time(new Date());
//		
//		iDao.insert(iDto);
//		
//		log.info("ifewhfoewhfiowefhweoifhweo======================");
//	}
	
//	@Test
//	public void testListAll() throws Exception{
//		List<ImageDTO> imgList = iDao.listAll(2);
//		
//		for (ImageDTO img : imgList) {
//			log.info("listAll--------------------------->" + img.toString());			
//		}
//	}
	
//	@Test
//	public void testDelete() throws Exception{
//		iDao.delete(1);
//	}

}
