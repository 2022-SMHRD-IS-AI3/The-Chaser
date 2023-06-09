package com.wasp.chaser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wasp.chaser.domain.Criteria;
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
	@RequestMapping(value={"/episode_desc", "/episode_modify"}, method = RequestMethod.GET)
	public void read(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception{
		model.addAttribute("episode", service.read(episode_idx));
	}
 
	// 사건 수정
	@RequestMapping(value="/episode_modify", method = RequestMethod.POST)
	public void update(EpisodeDTO eDto, Model model) throws Exception{
		model.addAttribute("episode", service.update(eDto));
	}
	
	// 사건 삭제
	@RequestMapping(value="/episode_delete", method = RequestMethod.GET)
	public void delete(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception{
		service.delete(episode_idx);
	}
	
	// 사건 리스트
	@RequestMapping(value="/episode_list", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) throws Exception{
		log.info("사건 목록");
		model.addAttribute("list", service.listAll(cri));
	}
	
	// 사건 종결
	@RequestMapping(value="/episode_end", method = RequestMethod.POST)
	public void episode_end(EpisodeDTO eDto, Model model) throws Exception{
		service.updateEnd(eDto);
	}

}
