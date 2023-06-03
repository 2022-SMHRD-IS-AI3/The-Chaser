package com.wasp.chaser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wasp.chaser.domain.EpisodeDTO;
import com.wasp.chaser.service.IEpisodeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/episode")
@Log4j
public class EpisodeController {
	
	@Autowired private IEpisodeService service;
	
	// 사건 작성
	@RequestMapping(value="/episode_register", method = RequestMethod.GET)
	public void insert(EpisodeDTO eDto, Model model) throws Exception{
		log.info("사건작성");
	}
	
	// 사건 열기
	
 
	// 사건 수정
	
	// 사건 삭제
	
	// 사건 리스트
	@RequestMapping(value="/episode_list", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
		log.info("사건 목록");
		model.addAttribute("list", service.listAll());
	}

}
