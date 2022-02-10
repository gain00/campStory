package com.campstory.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	String id = null;
	@RequestMapping("talkList")
	public String list(Integer listType, String areaEng, String campS, Model model, Integer pageNum, HttpSession session) {
		if(listType==null) { listType=0; }
		if(pageNum==null) { pageNum=1; }
		
		id = (String)session.getAttribute("memId");
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
		
		Map<Long,List<CampTalkDTO>> map = new HashMap<Long,List<CampTalkDTO>>();
		
		for(int i = 0; i < list.size(); i++) {
			map.put(Long.valueOf(list.get(i).getNum_talk()), service.getTalkQnA(list.get(i).getNum_talk()));
		}
		
		List<CampTalkDTO> goodList = service.goodListAll();
		model.addAttribute("list", list);
		model.addAttribute("goodList", goodList);
		model.addAttribute("areaKor", areaChageKor);
		model.addAttribute("areaEng", areaEng);
		model.addAttribute("page", page);
		model.addAttribute("listType", listType);
		model.addAttribute("campS", campS);
		model.addAttribute("map", map);
		
		return "camptalk/talkList";
	}
	
	@RequestMapping("areaSelect")
	public String areaSelect(String listType, String campS, Model model) {
		if(campS == null) { campS=""; }
		model.addAttribute("listType", listType);
		model.addAttribute("campS", campS);
		return "/camptalk/areaSelect";
	}
	
	@RequestMapping("talkWrite")
	public String write(Model model, String areaEng) {
		model.addAttribute("areaEng", areaEng);
		return "/camptalk/talkWrite";
	}
	
	@RequestMapping("talkWritePro")
	public String writePro(CampTalkDTO dto, String ano, String sub, String qeArea, HttpSession session) {
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
		return "/camptalk/talkWritePro";
	}
	
	@RequestMapping("campSearch")
	public String search(String areaEng, Model model) {
		model.addAttribute("area", areaEng);
		return "/camptalk/campSearch";
	}
	
	@RequestMapping("campSearchList")
	public String searchList(String camp, String areaEng, Integer pageNum, Model model) {
		if(pageNum==null) {	pageNum=1; }
		if(camp==null) { camp=""; }
		
		String areaChageKor = areaKor.change(areaEng);
		pageDTO page = pageInfo.talkWriteCampSearchPage(pageNum, 10, areaChageKor, camp);
		List<CampTalkDTO> list = service.campInfoSearch(camp, areaChageKor, page.getRowStart(), page.getRowEnd());
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("camp", camp);
		model.addAttribute("area", areaEng);
		
		return "/camptalk/campSearch";
	}
	
	@RequestMapping("goodUp")
	public void goodUp(int num_talk){
		service.talkGoodUp(id, num_talk);
	}
	
	@RequestMapping("goodDown")
	public void goodDown(int num_talk){
		service.talkGoodDown(id, num_talk);
	}
	
	@RequestMapping("talkUpdate")
	public String talkUpdate(int num_talk, Model model) {
		CampTalkDTO dto = service.getTalk(num_talk);
		model.addAttribute("dto", dto);
		return "/camptalk/talkUpdate";
	}
	
	@RequestMapping("talkUpdatePro")
	public String talkUpdatePro(CampTalkDTO dto, Model model) {
		if(dto.getAno()==null || !dto.getAno().equals("ano")) {
			dto.setAno("id");
		} else {
			dto.setAno("anonymity");
		}
		service.talkUpdate(dto);
		return "redirect:/campTalk/talkList";
	}
	
	@RequestMapping("talkDelete")
	public String talkDelete(int num_talk) {
		service.talkDelete(num_talk);
		return "redirect:/campTalk/talkList";
	}
	
	@RequestMapping("qnaInput")
	public @ResponseBody String qnaInput(CampTalkDTO dto) {
		if(dto.getAno()==null) {
			dto.setAno("id");
		} else {
			dto.setAno("anonymity");
		}
		
		service.talkWriteQnA(dto);
		return "1";
	}
	
	@RequestMapping("qnaDel")
	public @ResponseBody String qnaDel(int num_talkqna) {
		service.qnaDel(num_talkqna);
		return "1";
	}
	
	@RequestMapping("notify")
	public @ResponseBody String notify(CampTalkDTO dto, int num_talk, String sid) {
		if (service.getNotify(num_talk, sid) == 0) {
			service.inputNotify(num_talk, sid);
			return "notify";
		} else {
			return "already";
		}
		
	}
	
	
}
