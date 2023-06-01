package com.wasp.chaser;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wasp.chaser.MyBatisTest;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class MyBatisTest {

	@Autowired
	private SqlSessionFactory sqlFactory;
		
	@Test
	public void test() {
		log.info("sqlSessionFactory ================> " + sqlFactory);
	}
	
	@Test
	public void testSession() {
		try(SqlSession session = sqlFactory.openSession()){
			log.info("sqlSession ==================> " + session);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
