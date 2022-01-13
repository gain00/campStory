package com.campstory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.campstory.bean.CampTalkDTO;
import com.campstory.service.CampServiceTalk;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Controller
@RequestMapping("/campTalk/")
public class CapmTalkController {

	@Autowired
	private CampServiceTalk service;
	
	@RequestMapping("talkList")
	public String list(String area, CampTalkDTO dto, Model model) {
		log.info("List-------------- Area=========" + area);
		area="경기도";
		List<CampTalkDTO> list = service.getTalkList(area);
		model.addAttribute("list", list);
		model.addAttribute("area", area);
		return "campTalk/talkList";
	}
	
	@RequestMapping("areaSelect")
	public String areaSelect() {
		return "/campTalk/areaSelect";
	}
	
	@RequestMapping("talkWrite")
	public String write() {
		log.info("-----  talkWrite --------");
		return "/campTalk/talkWrite";
	}
	
	@RequestMapping("talkWritePro")
	public String writePro(CampTalkDTO dto) {
		log.info("C -----  writePro --------" + dto);
		service.talkWrite(dto);
		return "/campTalk/talkWritePro";
	}
	
	@RequestMapping("campSearch")
	public String search() {
		log.info("search---------------------------");
		return "/campTalk/campSearch";
	}
	
	@RequestMapping("campSearchList")
	public @ResponseBody List<String> searchList(String camp, String area) {
		log.info("searchList---------------------------"+camp);
		log.info("searchList---------------------------"+area);
		return service.searchList(camp, area);
	}
	
}
