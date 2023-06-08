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
public class AppeControllerTests {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testAppeRead() throws Exception {
//		log.info("인상착의 ===========>" + mockMvc.perform(MockMvcRequestBuilders
//				.get("/analysis/appearance")
//				.param("episode_idx", "1"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
//	@Test
//	public void testAppeInsert() throws Exception{
//		log.info("인상착의 작성 ============> " + mockMvc.perform(MockMvcRequestBuilders
//				.post("/analysis/appearance")
//				.param("appe_top_type", "상의 종류")
//				.param("appe_top_color", "상의 색상")
//				.param("appe_bottom_type", "하의 종류")
//				.param("appe_bottom_color", "하의 색상")
//				.param("appe_stuff_type", "소지품 종류")
//				.param("appe_stuff_color", "소지품 색상")
//				.param("appe_gender", "M")
//				.param("appe_age", "12")
//				.param("appe_height", "123.2")
//				.param("appe_body", "체형")
//				.param("episode_idx", "1"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
//	@Test
//	public void testAppeInsert() throws Exception{
//		log.info("인상착의 수정 ============> " + mockMvc.perform(MockMvcRequestBuilders
//				.post("/analysis/appearance")
//				.param("appe_top_type", "수정된 상의 종류")
//				.param("appe_top_color", "수정된 상의 색상")
//				.param("appe_bottom_type", "수정된 하의 종류")
//				.param("appe_bottom_color", "수정된 하의 색상")
//				.param("appe_stuff_type", "수정된 소지품 종류")
//				.param("appe_stuff_color", "수정된 소지품 색상")
//				.param("appe_gender", "F")
//				.param("appe_age", "123")
//				.param("appe_height", "12.2")
//				.param("appe_body", "수정된 체형")
//				.param("episode_idx", "1"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	

}
