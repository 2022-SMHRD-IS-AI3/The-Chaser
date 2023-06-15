package com.wasp.chaser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wasp.chaser.domain.WantedDTO;
import com.wasp.chaser.service.IWantedService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/analysis")
@Log4j
public class WantedController {
	
	@Autowired private IWantedService service;
	
	// 후보 리스트 불러오기
	@RequestMapping(value="/getWanted", method = RequestMethod.GET)
	public void list(WantedDTO wanted, Model model) throws Exception{
		log.info("후보 리스트 불러오기");
		log.info(service.listAll(wanted).toString());
//		model.addAttribute("list", service.listAll(wanted));
		
	}
	// 후보 수정
	@RequestMapping(value="/analysis_modify", method = RequestMethod.GET)
	public void update(WantedDTO wanted, Model model) throws Exception{
		log.info("후보 수정");
		service.update(wanted);
	}
	
	// 후보 삭제
	@RequestMapping(value="/analysis_delete", method = RequestMethod.GET)
	public void delete(@RequestParam("w_idx") int w_idx,Model model) throws Exception{
		log.info("후보 삭제");
	}
	
}
