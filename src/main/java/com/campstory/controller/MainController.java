package com.campstory.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.campstory.bean.MemberDTO;
import com.campstory.service.MemberService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Controller
public class MainController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("main")
	public String main(HttpSession session, MemberDTO dto, Model model) {
		String id = null;
		if(session.getAttribute("kakaoId") == null) {
			id = (String)session.getAttribute("memId");
		}else {
			id = (String)session.getAttribute("kakaoId");
		}
		
		if(id != null) {
			model.addAttribute("memberDTO", service.memberUserInfo(id));
		}
		return "main";
	}

}
