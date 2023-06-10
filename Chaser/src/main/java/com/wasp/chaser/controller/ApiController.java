package com.wasp.chaser.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.view.RedirectView;

import com.wasp.chaser.domain.TestDTO;
import com.wasp.chaser.domain.TestDTOList;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j

public class ApiController {
	

	@RequestMapping(value = "/apiTest", method = RequestMethod.POST)
	public void apiTest(@RequestParam("num") int num, @RequestParam("name") String name ,Model model) {
		
		log.info("플라스크로 갑니다............................");
		
		RestTemplate restTemplate = new RestTemplate();
		
		restTemplate.postForEntity(null, restTemplate, null);

		
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
