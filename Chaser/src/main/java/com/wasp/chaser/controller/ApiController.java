package com.wasp.chaser.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wasp.chaser.domain.ImageDTO;
import com.wasp.chaser.domain.ImageDTOList;
import com.wasp.chaser.domain.TestDTO;
import com.wasp.chaser.domain.TestDTOList;
import com.wasp.chaser.service.IImageService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class ApiController {
	
	@Autowired
	private IImageService service;
	
	@RequestMapping(value = "/flaskStart", method = RequestMethod.POST)
	public String flaskStart(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception{
		// 보낼 데이터 리스트 불러오기
		log.info("데이터 가져오기..............");
		List<ImageDTO> imgList =  service.beforeListAll(episode_idx);
		log.info("데이터 가져오기 완료..............");
		ImageDTOList imgDTOList = new ImageDTOList();
		imgDTOList.setImageDTOList(imgList);
		
		
		// 데이터 담을 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		String url = "http://localhost:9091/";
		
		// 객체 Header 
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
		
		// 객체 body
		MultiValueMap<String, List<ImageDTO>> body = new LinkedMultiValueMap<String, List<ImageDTO>>();
		body.add("imgDTOList", imgDTOList.getImageDTOList());
		
		// 보낼 Message
		HttpEntity<?> requestMessage = new HttpEntity<>(body, httpHeaders);
		
		// Request
		HttpEntity<String> response = restTemplate.postForEntity(url, requestMessage, String.class);
		
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_ARRAY_AS_NULL_OBJECT, true);
		
		TestDTO dto = objectMapper.readValue(response.getBody(), TestDTO.class);
		
		log.info(dto);
		
		
		return dto.toString();
				
	}
	

	@RequestMapping(value = "/apiTest", method = RequestMethod.POST)
	public String apiTest(@RequestParam("num") int num, @RequestParam("name") String name ,Model model) throws Exception {
		
		log.info("플라스크로 갑니다............................");
		
		RestTemplate restTemplate = new RestTemplate();
		
		String url = "http://localhost:9091/";
		
		// Header
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		// Body
		MultiValueMap<String, TestDTO> body = new LinkedMultiValueMap<String, TestDTO>();
		TestDTO testDTO = new TestDTO();
		testDTO.setTestInt("1");
		testDTO.setTestStr("str");
		body.add("testDTO", testDTO);
		
		// 보낼 Message
		HttpEntity<?> requestMessage = new HttpEntity<>(body, httpHeaders);
		
		// Request
		HttpEntity<String> response = restTemplate.postForEntity(url, requestMessage, String.class);

		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
		
		TestDTO dto = objectMapper.readValue(response.getBody(), TestDTO.class);
		
		log.info(dto);
		
		return dto.toString();
		
//		RedirectView redirectView = new RedirectView();
//		redirectView.setUrl("http://localhost:9091/");
//		redirectView.addStaticAttribute("testInt", num);
//		redirectView.addStaticAttribute("testStr", name);
//		TestDTO testDTO = new TestDTO();
//		testDTO.setTestInt("1");
//		testDTO.setTestStr("str");
//		redirectView.addStaticAttribute("testDTO", testDTO);
		
		
	}
	
	@RequestMapping(value = "/apiTest2", method = RequestMethod.POST)
	public @ResponseBody TestDTO apiTest2(@RequestBody String data, Model model) {
		log.info(data);
		
//		model.addAttribute("data", data);
		
		TestDTO test = new TestDTO();
		test.setTestInt("1");
		test.setTestStr("안녕");
		
		return test;
		
	}
	
	@RequestMapping(value = "/apiTest2", method = RequestMethod.GET)
	public String apiTest2(Model model) {
		log.info("aaaaaaaaaaaaaaaaaf---------------------");
//		model.addAttribute("data", data);
		
		
		return "apiTest2";
	}

	
}
