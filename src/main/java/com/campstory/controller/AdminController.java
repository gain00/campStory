package com.campstory.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.campstory.bean.KeywordDTO;
import com.campstory.bean.MemberDTO;
import com.campstory.service.CampService;
import com.campstory.service.CampServiceTalk;
import com.campstory.service.CsService;
import com.campstory.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
    private CampService campservice;
    private CampServiceTalk campservicetalk;
    private CsService csservice;
    private MemberService memberservice;
    private MemberDTO memDTO;
	
	@RequestMapping("main")
	public String main() {
		
		return "admin/main";
	}
	
	@RequestMapping("member")
	public String member(String pageNum, Model model) {
		
		if (pageNum == null) {
	        pageNum = "1";
	    }
	    model.addAttribute("pageNum", pageNum);
	    
	    int pageSize = 5;
	    model.addAttribute("pageSize", pageSize);
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number=0;
	    
	    count = memberservice.memberAllCount();
	    model.addAttribute("count", count);
		if (count > 0) {
			List<MemberDTO> list = memberservice.memberAdminList(startRow, endRow);
		    model.addAttribute("list", list);
			number=count-(currentPage-1)*pageSize;
			model.addAttribute("number", number);
			
	        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
	        int pageBlock= 3;
	        int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;
	        int endPage = startPage + pageBlock-1;
	        if (endPage > pageCount) endPage = pageCount;
	        model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "admin/member";
	}
	
	@RequestMapping("memberStatusPro")
	public @ResponseBody int memberStatusPro(String status, String id) {
		memDTO.setStatus(status);
		memDTO.setId(id);
		return memberservice.memberStatus(memDTO);
	}
	
	@RequestMapping("memberBanPro")
	public @ResponseBody int memberBanPro(
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date ban_date, int warn, String id) {
		memDTO.setBan_date(ban_date);
		memDTO.setWarn(warn);
		memDTO.setId(id);
		return memberservice.memberBan(memDTO);
	}

}
