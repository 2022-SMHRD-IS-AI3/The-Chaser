package com.wasp.chaser.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ApiController {
	
	@RequestMapping(value = "/apiTest", method = RequestMethod.GET)
	public String apiTest(Model model) {
		
		log.info("apicon................");
		
		return "apiTest";
		
	}
	@RequestMapping(value = "/apiTest", method = RequestMethod.POST)
	public String apiTest(@RequestParam("num") int num, @RequestParam("name") String name ,Model model) {
		
		log.info(num+name);
		
		return "apiTest";
		
	}

	
}
