package com.wasp.chaser.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wasp.chaser.domain.AppeDTO;
import com.wasp.chaser.domain.EpisodeDTO;
import com.wasp.chaser.service.IAppeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/analysis")
@Log4j
public class AppeController {

	@Autowired private IAppeService service;
	
	// 인상착의 불러오기
	@RequestMapping(value="/appearance", method = RequestMethod.GET)
	public void read(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception{
		AppeDTO appeDto = service.read(episode_idx);
		if(appeDto != null) {
			model.addAttribute("appe", appeDto);	
		}
		model.addAttribute("episode_idx", episode_idx);
		
		log.info("인상착의불러오기");
		log.info("get...................");
	}
	
	// 인상착의 작성
	@RequestMapping(value="/appearance", method = RequestMethod.POST)
	public String insert(AppeDTO aDto, EpisodeDTO eDto,Model model) throws Exception{
		
		log.info("인상착의작성");
		log.info("post...................");
		
		aDto.setEpisode_idx(eDto.getEpisode_idx());
		service.insert(aDto);
		
		return "redirect:image_list?episode_idx="+aDto.getEpisode_idx().toString();
	}
	
	// 인상착의 삭제
	//	public void delete(@RequestParam("appe_idx") int appe_idx, Model model) throws Exception{
	//		log.info("인상착의삭제");
	//	}
}
