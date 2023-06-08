package com.wasp.chaser.persistence;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wasp.chaser.domain.Criteria;
import com.wasp.chaser.domain.EpisodeDTO;
import com.wasp.chaser.persistence.IEpisodeDAO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
@Log4j
public class IEpisodeDaoTest {

	@Autowired
	private IEpisodeDAO eDao;
	
//	@Test
//	public void testListAll() throws Exception{
//		Criteria cri = new Criteria();
//		cri.setPageNum(1);
//		cri.setAmount(10);
//		
//		eDao.listAll(cri);
//	}
	
//	@Test
//	public void testCreate() throws Exception {
//		EpisodeDTO eDto = new EpisodeDTO();
//		
//		eDto.setEpisode_title("타이틀");
//		eDto.setEpisode_content("내용");
//		eDto.setEpisode_loc("장소");
//		eDto.setEpisode_type("유형");
//		eDto.setEpisode_time(new Date());
//		eDto.setEpisode_flag('1');
//		
//		eDao.insert(eDto);
//		
//	}
//	
//	@Test
//	public void testRead() throws Exception{
//		log.info(eDao.read(105));
//	}
	
//	@Test
//	public void testUpdate() throws Exception{
//		EpisodeDTO eDto = eDao.read(105);
//		
//		eDto.setEpisode_content("수정된 내용");
//		
//		int result = eDao.update(eDto);
//		log.info("result========================>" + result);
//	}
//
//	@Test
//	public void testDelete() throws Exception{
//		log.info(eDao.delete(18));
//	}
//	
//	@Test
//	public void testUpdateFlag() throws Exception{
//		EpisodeDTO eDto = new EpisodeDTO();
//		eDto.setEpisode_idx(1);
//		eDto.setEpisode_flag('1');
//		log.info(eDao.updateFlag(eDto));
//	}
	
	@Test
	public void testUpdateEnd() throws Exception{
		EpisodeDTO eDto = new EpisodeDTO();
		eDto.setEpisode_idx(1);
		eDto.setEpisode_flag('9');
		log.info(eDao.updateEnd(eDto));
	}
	

}
