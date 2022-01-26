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
	
	String id = "testid";
	@RequestMapping("talkList")
	public String list(Integer listType, String areaEng, String campS, Model model, Integer pageNum) {
		log.info("List--------------camp =========111111111" + campS);
		if(listType==null) { listType=0; }
		if(pageNum==null) { pageNum=1; }
		pageDTO page = null;
		List<CampTalkDTO> list = null; 
		String areaChageKor = areaKor.change(areaEng);
		
		if(listType == 0) { //조건 지역별
			page = pageInfo.talkPage(pageNum, 5, areaChageKor);
			list = service.getTalkList(areaChageKor, page.getRowStart(), page.getRowEnd());
		} else if(listType == 1) { //campSearch 조건 -> 캠프명 검색+지역
			if(campS == null ) { campS=""; }
			page = pageInfo.talkCampSearchPage(pageNum, 5, areaChageKor, campS);
			list = service.getCampSearch(campS, areaChageKor, page.getRowStart(), page.getRowEnd());
		} else if(listType == 2) { //MyList 조건 -> id별 글+지역
			page = pageInfo.talkMyListPage(pageNum, 5, id);
			list = service.getMyTalkList(areaChageKor, id, page.getRowStart(), page.getRowEnd());
		} else if(listType == 3) { //Mygood 조건 -> id별 good+지역
			page = pageInfo.talkMyGoodPage(pageNum, 5, id);
			list = service.getMyGoodList(areaChageKor, id, page.getRowStart(), page.getRowEnd());
		}
		
		List<CampTalkDTO> goodList = service.goodListAll();
		List<CampTalkDTO> qnaList = service.getTalkQnA();
		model.addAttribute("list", list);
		model.addAttribute("goodList", goodList);
		model.addAttribute("areaKor", areaChageKor);
		model.addAttribute("areaEng", areaEng);
		model.addAttribute("page", page);
		model.addAttribute("listType", listType);
		model.addAttribute("campS", campS);
		model.addAttribute("qnaList", qnaList);
		
		model.addAttribute("id", id);
		
		return "campTalk/talkList";
	}
	
	@RequestMapping("areaSelect")
	public String areaSelect(String listType, String campS, Model model) {
		if(campS == null) { campS=""; }
		model.addAttribute("listType", listType);
		model.addAttribute("campS", campS);
		return "/campTalk/areaSelect";
	}
	
	@RequestMapping("talkWrite")
	public String write(Model model) {
		model.addAttribute("id", id);
		log.info("wwwwwwwwwwwwwwwwwwwwwwwwwwww");
		return "/campTalk/talkWrite";
	}
	
	@RequestMapping("talkWritePro")
	public String writePro(CampTalkDTO dto, String ano, String sub) {
		if(ano == null || !ano.equals("ano")) {
			dto.setAno("id");
		} else if(ano.equals("ano")) {
			dto.setAno("anonymity");
		} 
		
		
		if(sub.equals("talk")){
			service.talkWrite(dto);
		} else if(sub.equals("qe")) {
			dto.setSub("qe");
			service.talkWrite(dto);
		}
		return "/campTalk/talkWritePro";
	}
	
	@RequestMapping("campSearch")
	public String search() {
		return "/campTalk/campSearch";
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
		pageDTO page = pageInfo.talkWriteCampSearchPage(pageNum, 10, areaChageKor, camp);
		List<CampTalkDTO> list = service.campInfoSearch(camp, areaChageKor, page.getRowStart(), page.getRowEnd());
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("camp", camp);
		model.addAttribute("area", areaEng);
		
		return "/campTalk/campSearch";
	}
	
	@RequestMapping("goodUp")
	public String goodUp(int num_talk){
		service.talkGoodUp(id, num_talk);
		return "redirect:/campTalk/talkList";
	}
	
	@RequestMapping("goodDown")
	public String goodDown(int num_talk){
		service.talkGoodDown(id, num_talk);
		return "redirect:/campTalk/talkList";
	}
	
	@RequestMapping("talkUpdate")
	public String talkUpdate(int num_talk, Model model) {
		CampTalkDTO dto = service.getTalk(num_talk);
		model.addAttribute("dto", dto);
		log.info("-----------------------------"+dto.getAno());
		return "/campTalk/talkUpdate";
	}
	
	@RequestMapping("talkUpdatePro")
	public String talkUpdatePro(CampTalkDTO dto, Model model) {
		log.info("sadgsagdsagdsagsdg    " +dto.getAno() );
		if(dto.getAno().equals("ano")) {
			dto.setAno("anonymity");
		} else {
			dto.setAno("id");
		}
		log.info("=========================    " +dto.getAno() );
		service.talkUpdate(dto);
		return "redirect:/campTalk/talkList";
	}
	
	@RequestMapping("talkDelete")
	public String talkDelete(int num_talk) {
		service.talkDelete(num_talk);
		return "redirect:/campTalk/talkList";
	}
	
	@RequestMapping("qna")
	public @ResponseBody String qna(CampTalkDTO dto) {
		log.info("zzzzzzzzzzzzzzzzzzzz" + dto.getNum_talk());
		log.info("zzzzzzzzzzzzzzzzzzzz" + dto.getContent());
		log.info("zzzzzzzzzzzzzzzzzzzz" + dto.getAno());
		if(dto.getAno()==null) {
			dto.setAno("id");
		} else {
			dto.setAno("anonymity");
		}
		
		service.talkWriteQnA(dto);
		
		return "1";
	}
	
	
	
}
