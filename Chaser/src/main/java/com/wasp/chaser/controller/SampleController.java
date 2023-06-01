package com.wasp.chaser.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wasp.chaser.domain.EpisodeDTO;
import com.wasp.chaser.domain.TestDTO;
import com.wasp.chaser.domain.TestDTOList;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample")
@Log4j

public class SampleController {
	
	@RequestMapping(value="/test01", method = RequestMethod.GET)
	public void test01(int a) {
		log.info("값=========>" + a);
	}
	
	@RequestMapping(value="/test02", method = RequestMethod.GET)
	public void test02(TestDTO test) {
		log.info("객체----------->" + test.toString());
	}
	
	@RequestMapping(value="/test03", method = RequestMethod.GET)
	public void test03(TestDTOList testList) {
		log.info("List------------>" + testList);
	}

	
}
