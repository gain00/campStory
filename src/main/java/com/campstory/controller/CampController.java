package com.campstory.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campstory.bean.CampDTO;
import com.campstory.service.CampService;


import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Controller
@RequestMapping("/camp/")
public class CampController {
	@Autowired
	private CampService service;
	
	@RequestMapping("list")
	public String list(String pageNum, Model model, HttpServletRequest req) {
		pageNum = req.getParameter("pageNum");
		if(pageNum == null ) {
			pageNum = "1";
		}
		
		int pageSize=10;		
		int count = service.getCount();
		int currentPage = Integer.parseInt(pageNum);
		int startPage=(int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int startRow = (currentPage -1) *pageSize+1;
		int endRow = currentPage * pageSize;
		
		log.info("====start==="+startRow);
		log.info("====end==="+endRow);
		
		
		List<CampDTO> list = service.getList (startRow, endRow);
		
		log.info(" ===========list" +list);
		 // View 데이터 전달.
		model.addAttribute("count", service.getCount());
		model.addAttribute("number",count-(currentPage-1)*pageSize);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",pageNum);
		model.addAttribute("pageCount", count / pageSize + ( count % pageSize == 0 ? 0 : 1));
		model.addAttribute("startPage", (int)(currentPage/10)*10+1);
		model.addAttribute("pageBlock", 10);
		model.addAttribute("endPage",startPage + pageBlock-1);
		model.addAttribute("list",list);
		
		return "camp/list";
	}
	@RequestMapping("info")
	public String content(String contentid ,Model model,int pageNum, CampDTO dto) {
		
		
		model.addAttribute("campDTO", service.getContent(contentid));
		model.addAttribute("contentid", contentid);
		model.addAttribute("pageNum", pageNum);
		
			
			
			
		log.info("=========/camp/info?contentid="+contentid);
		log.info("======캠핑장명===="+dto.getFacltnm());
		return"camp/info";
	}
}
