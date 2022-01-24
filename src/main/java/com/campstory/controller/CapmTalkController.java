package com.campstory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.campstory.bean.CampTalkDTO;
import com.campstory.bean.pageDTO;
import com.campstory.command.AreaChange;
import com.campstory.command.Page;
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
	
	@Autowired
	private AreaChange areaKor;
	
	@Autowired
	private Page pageInfo;
	
	@RequestMapping("talkList")
	public String list(String areaEng, CampTalkDTO dto, Model model, Integer pageNum) {
		String id = "testid";
		if(pageNum==null) {
			pageNum=1;
		}
		String areaChageKor = areaKor.change(areaEng);
		
		pageDTO page = pageInfo.talkPage(pageNum, 5, areaChageKor);
		List<CampTalkDTO> list = service.getTalkList(areaChageKor, page.getRowStart(), page.getRowEnd());
		List<CampTalkDTO> goodList = service.goodListAll();
		model.addAttribute("list", list);
		model.addAttribute("goodList", goodList);
		model.addAttribute("areaKor", areaChageKor);
		model.addAttribute("areaEng", areaEng);
		model.addAttribute("page", page);
		
		log.info("List--------------List >> Area=========" + list);
		
		return "camptalk/talkList";
	}
	
	@RequestMapping("areaSelect")
	public String areaSelect() {
		return "/camptalk/areaSelect";
	}
	
	@RequestMapping("talkWrite")
	public String write() {
		log.info("-----  talkWrite --------");
		return "/camptalk/talkWrite";
	}
	
	@RequestMapping("talkWritePro")
	public String writePro(CampTalkDTO dto) {
		service.talkWrite(dto);
		return "/camptalk/talkWritePro";
	}
	
	@RequestMapping("campSearch")
	public String search() {
		return "/camptalk/campSearch";
	}
	
	@RequestMapping("campSearchList")
	public String searchList(String camp, String areaEng, Integer pageNum, Model model) {
		if(pageNum==null) {
			pageNum=1;
		}
		if(camp==null) {
			camp="";
		}
		String areaChageKor = areaKor.change(areaEng);
		pageDTO page = pageInfo.talkCampSearchPage(pageNum, 10, areaChageKor, camp);
		List<CampTalkDTO> list = service.getCampSearchList(camp, areaChageKor, page.getRowStart(), page.getRowEnd());
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("camp", camp);
		model.addAttribute("area", areaEng);
		return "/camptalk/campSearch";
	}
	
	@RequestMapping("goodUp")
	public String goodUp(int num_talk){
		String id = "testid1";
		service.talkGoodUp(num_talk);
		service.goodListInput(id, num_talk);
		return "redirect:/camptalk/talkList";
	}
	
	@RequestMapping("goodDown")
	public String goodDown(int num_talk){
		String id = "testid1";
		service.talkGoodDown(num_talk);
		service.goodListDel(id, num_talk);
		return "redirect:/camptalk/talkList";
	}
	
}
