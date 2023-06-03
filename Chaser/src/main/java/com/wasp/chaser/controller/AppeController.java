package com.wasp.chaser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wasp.chaser.domain.AppeDTO;
import com.wasp.chaser.service.IAppeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/analysis")
@Log4j
public class AppeController {

	@Autowired private IAppeService service;
	
	// 인상착의 작성
	@RequestMapping(value="/appearance", method = RequestMethod.GET)
	public void insert(AppeDTO aDto, Model model) throws Exception{
		log.info("인상착의작성");
	}
	
	// 인상착의 불러오기
	@RequestMapping(value="/appearance2", method = RequestMethod.GET)
	public void read(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception{
		model.addAttribute("episode_idx", service.read(episode_idx));
		log.info("인상착의불러오기");
	}
	
	// 인상착의 수정
//	@RequestMapping(value="/appearanceUpdate", method = RequestMethod.POST)
//	public void update(@RequestParam("appe_idx") int appe_idx, Model model) throws Exception{
//		model.addAttribute("appe_idx", service.read(appe_idx));
//	}
	
	// 인상착의 삭제
//	public void delete(@RequestParam("appe_idx") int appe_idx, Model model) throws Exception{
//		log.info("인상착의삭제");
//	}
}
