package com.wasp.chaser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wasp.chaser.service.IEpisodeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/episode")
@Log4j
public class EpisodeController {
	
	@Autowired private IEpisodeService service;
	
	// 사건 목록
	@RequestMapping(value="/episode_list", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
		log.info("사건 목록");
		model.addAttribute("list", service.listAll());
	}
	

}
