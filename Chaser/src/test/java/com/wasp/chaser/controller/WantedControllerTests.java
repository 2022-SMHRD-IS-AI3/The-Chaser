package com.wasp.chaser.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class WantedControllerTests {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testWantedList() throws Exception {
//		log.info("후보자 리스트 =============> " + mockMvc.perform(MockMvcRequestBuilders
//				.get("/analysis/getWanted")
//				.param("episode_idx", "3")
//				.param("img_idx", "3"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
//	@Test
//	public void testWantedModify() throws Exception{
//		log.info("후보자 상태 변화=============> " + mockMvc.perform(MockMvcRequestBuilders
//				.get("/analysis/analysis_modify")
//				.param("w_idx", "3")
//				.param("w_flag", "Y"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
	
	

}
