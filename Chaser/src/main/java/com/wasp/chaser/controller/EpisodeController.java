package com.wasp.chaser.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	public void insertGET(EpisodeDTO eDto, Model model) throws Exception{
		log.info("사건작성");
		
		log.info("register GET ...................");
		
	}
	
	@RequestMapping(value="/episode_register", method = RequestMethod.POST)
	public String insertPOST(EpisodeDTO eDto, Model model) throws Exception{
		String strDate = eDto.getTime_string();
		strDate = strDate.replace("-", "/");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		Date dateStr = formatter.parse(strDate);
		
		eDto.setEpisode_time(dateStr);
		
		
		log.info("사건작성");
		log.info("register POST...........");
		eDto.setEpisode_flag('0');
		service.insert(eDto);
		
		
		return "redirect:/analysis/appearance?episode_idx="+eDto.getEpisode_idx().toString();
	}
	
	// 사건 열기 and 상세보기에서 수정
	@RequestMapping(value={"/episode_desc", "/episode_modify"}, method = RequestMethod.GET)
	public void read(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception{
		model.addAttribute("episode", service.read(episode_idx));
	}
 
	// 사건 수정
	@RequestMapping(value="/episode_modify", method = RequestMethod.POST)
	public String update(EpisodeDTO eDto, Model model) throws Exception{
		log.info("사건수정");
		log.info("episode_modify POST...........");
		log.info(eDto.getEpisode_time());
		String strDate = eDto.getTime_string();
		strDate = strDate.replace("-", "/");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		Date dateStr = formatter.parse(strDate);
		
		eDto.setEpisode_time(dateStr);
		service.update(eDto);
		
		model.addAttribute("result", eDto.getEpisode_idx());
		return "redirect:/episode/episode_list";
	}
	
	// 사건 삭제
	@RequestMapping(value="/episode_delete", method = RequestMethod.GET)
	public String delete(@RequestParam("episode_idx") int episode_idx, Model model) throws Exception{
		service.delete(episode_idx);
		return "redirect:/episode/episode_list";
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
