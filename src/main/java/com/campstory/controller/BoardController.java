package com.campstory.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import com.campstory.bean.BoardDTO;
import com.campstory.service.BoardService;


@Controller
@RequestMapping("/campstoryBoard1/")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	@RequestMapping("list")
	public String list(String pageNum , Model model) {
		int pageSize = 4;
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		if (pageNum == null) {
	        pageNum = "1";
	    }

	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number=0;
	    
	    count = service.count();
	    List articleList = null;
	    if (count > 0) {
	    	articleList = service.getList(startRow, endRow);
	    }
	    number=count-(currentPage-1)*pageSize;
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", pageNum);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("articleList", articleList);
	    
		return "board/list";
	}
	
	
	@RequestMapping("content")
	public String content(int num_tip , String pageNum , Model model) {
		
		
		model.addAttribute("article", service.getArticle(num_tip));//1대신 투입됨 = service.getArticle(num)
		model.addAttribute("pageNum", pageNum);
		
		return "board/content";
	}
	

	
}
