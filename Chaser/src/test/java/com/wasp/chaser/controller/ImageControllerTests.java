package com.wasp.chaser.controller;

import static org.junit.Assert.*;

import java.util.Date;

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
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class ImageControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

//	@Test
//	public void testUploadList() throws Exception {
//		log.info("원본 영상 리스트" + mockMvc.perform(MockMvcRequestBuilders
//				.get("/analysis/image_list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
//	@Test
//	public void testUploadInsert() throws Exception{
//		log.info("원본 영상을 DB에 넣는 작업" );
//	}
//	
//	@Test
//	public void testImageList() throws Exception{
//		log.info("프레임 드랍된 영상 리스트" + mockMvc.perform(MockMvcRequestBuilders
//				.get("/analysis/analysis_result")
//				.param("episode_idx", "1"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
//	@Test
//	public void testImageDelete() throws Exception{
//		log.info("프레임 드랍된 영상 삭제" + mockMvc.perform(MockMvcRequestBuilders
//				.get("/analysis/image_delete")
//				.param("img_idx", "1")
//				.param("episode_idx", "1"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
//	
//	@Test
//	public void testImageUpdate() throws Exception{
//		log.info("프레임 드랍된 영상 업데이트 " + mockMvc.perform(MockMvcRequestBuilders
//				.get("/analysis/image_update")
//				.param("imageDTOList[0].img_idx", "21")
//				.param("imageDTOList[0].img_src", "드랍 경로")
//				.param("imageDTOList[0].img_length", "212312")
//				.param("imageDTOList[0].img_time", "2038248204823"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	@Test
	public void testImageUpdate() throws Exception{
		log.info("프레임 드랍된 영상 업데이트 " + mockMvc.perform(MockMvcRequestBuilders
				.get("/analysis//visualize_result")
				.param("imageDTOList[0].img_idx", "21")
				.param("imageDTOList[0].img_nm", "드랍 경로")
				.param("imageDTOList[0].img_xy", "212312,43434343")
				)
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}	
	

}
