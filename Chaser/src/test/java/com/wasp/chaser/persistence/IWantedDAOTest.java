package com.wasp.chaser.persistence;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wasp.chaser.domain.WantedDTO;
import com.wasp.chaser.persistence.IWantedDAO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
@Log4j
public class IWantedDAOTest {
	
	@Autowired
	private IWantedDAO wDao;

//	@Test
//	public void testListAll() throws Exception {
//		WantedDTO wanted = new WantedDTO();
//		wanted.setEpisode_idx(1);
//		wanted.setImg_idx(3);
//		List<WantedDTO> wantList =  wDao.listAll(wanted);
//	}
	
//	@Test
//	public void testUpdate() throws Exception{
//		WantedDTO want = new WantedDTO();
//		want.setW_flag('Y');
//		want.setW_idx(32);
//		wDao.update(want);
//	}

//	@Test
//	public void testDelete() throws Exception{
//		wDao.delete(32);
//	}
	
}
