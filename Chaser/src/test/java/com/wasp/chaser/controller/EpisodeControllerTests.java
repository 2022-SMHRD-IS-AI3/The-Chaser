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
public class EpisodeControllerTests {

	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testEpisodeList() throws Exception {
		log.info("사건 목록 페이지 =======================>"+mockMvc.perform(MockMvcRequestBuilders
				.get("/episode/episode_list")
				.param("pageNum", "2"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}

//	@Test
//	public void testEpiRead() throws Exception{
//		log.info("사건 상세보기 ========================> " + mockMvc.perform(MockMvcRequestBuilders
//				.get("/episode/episode_modify")
//				.param("episode_idx", "1"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}

//	@Test
//	public void testEpiInsert() throws Exception{
//		log.info("사건 작성하기 ====================> " + mockMvc.perform(MockMvcRequestBuilders
//				.get("/episode/episode_register")
//				.param("episode_type", "사건 유형")
//				.param("episode_title", "사건 제목")
//				.param("episode_content", "사건 내용")
//				.param("episode_loc", "사건 위치")
//				.param("episode_flag", "1"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}

//	@Test
//	public void testEpiUpdate() throws Exception {
//		log.info("사건 수정하기 ==================> " + mockMvc
//				.perform(MockMvcRequestBuilders.get("/episode/episode_register").param("episode_idx", "1")
//						.param("episode_type", "사건 유형").param("episode_title", "사건 제목")
//						.param("episode_content", "사건 내용").param("episode_loc", "사건 위치"))
//				.andReturn().getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testEpiDelete() throws Exception{
//		log.info("사건 삭제하기 ==================> " + mockMvc.perform(MockMvcRequestBuilders
//				.get("/episode/episode_delete")
//				.param("episode_idx", "17"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
	@Test
	public void testUpdateEnd() throws Exception{
		log.info("사건 종결하기 =============> " + mockMvc.perform(MockMvcRequestBuilders
				.post("/episode/episode_end")
				.param("episode_idx", "2")
				.param("episode_flag", "9"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
		);
	}
	
	
}
