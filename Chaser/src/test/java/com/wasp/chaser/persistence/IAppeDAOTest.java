package com.wasp.chaser.persistence;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wasp.chaser.domain.AppeDTO;
import com.wasp.chaser.persistence.IAppeDAO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
@Log4j
public class IAppeDAOTest {
	
	@Autowired
	private IAppeDAO aDao;

	@Test
	public void testcreate() throws Exception {
		AppeDTO aDto = new AppeDTO();
		
		aDto.setAppe_top_type("상의 종류");
		aDto.setAppe_top_color("상의 색상");
		aDto.setAppe_bottom_type("하의 종류");
		aDto.setAppe_bottom_color("하의 색상");
		aDto.setAppe_stuff_type("소지품 종류");
		aDto.setAppe_stuff_color("소지품 색상");
		aDto.setAppe_gender('M');
		aDto.setAppe_age(22);
		aDto.setAppe_height(183.2);
		aDto.setAppe_body("체형");
		aDto.setEpisode_idx(2);
		
		aDao.insert(aDto);
	}
	
//	@Test
//	public void testRead() throws Exception{
//		AppeDTO aDto = aDao.read(1);
//		log.info("test read =================>" + aDto.toString());
//	}
	
//	@Test
//	public void testUpdate() throws Exception{
//		AppeDTO aDto = aDao.read(2);		
//		aDto.setAppe_top_type("상의 종류");
//		aDto.setAppe_top_color("상의 색상");
//		aDto.setAppe_bottom_type("하의 종류");
//		aDto.setAppe_bottom_color("하의 색상");
//		aDto.setAppe_stuff_type("소지품 종류");
//		aDto.setAppe_stuff_color("소지품 색상");
//		aDto.setAppe_gender('M');
//		aDto.setAppe_age(22);
//		aDto.setAppe_height(183.2);
//		aDto.setAppe_body("체형");
//		aDto.setAppe_idx(2);		
//		aDto.setAppe_top_type("변경된 상의 종류");
//		aDao.update(aDto);
//		
//	}
	
//	@Test
//	public void testDelete() throws Exception{
//		aDao.delete(1);
//	}
	

}
