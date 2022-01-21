package com.campstory.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.campstory.bean.MemberDTO;
import com.campstory.service.MemberService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MemberDTO memDTO;

	@RequestMapping("input")
	public String list() {
		return "member/input";
	}
	
	@RequestMapping("idCheck")
	public @ResponseBody int idCheck(String id) {
		log.info("==========="+id+"===========");
		return service.memberIdCheck(id);
	}
	
	@RequestMapping("inputPro")
	public String inputPro(MemberDTO dto, Model model) {
		log.info("======/member/inputPro"+dto);
		model.addAttribute("result", service.memberInsert(dto));
		
		return "member/inputPro";
	}
	
	@RequestMapping("login")
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping("loginPro")
	public String loginPro(MemberDTO dto, HttpSession session, Model model) {
		if(service.memberLoginCheck(dto) == 1) {
           if(service.memberAdminCheck(dto) == 1) {
				session.setAttribute("adminId", dto.getId());
			}
			session.setAttribute("memId", dto.getId());
			model.addAttribute("result", 1);
			session.setAttribute("status", service.memberUserInfo(dto.getId()).getStatus());
		}else {
			if(service.memberDelCheck(dto.getId()) == 1) {
				model.addAttribute("result", 2);
			}else {
				model.addAttribute("result", 0);
			}
		}
		return "member/loginPro";
	}
	
	@RequestMapping("loginPro_kakao")
	public String loginPro_kakao(String kakao_id, String kakao_email, String kakao_nickname, HttpSession session, Model model) {
		if(service.memberDelCheck(kakao_id) == 1) {
			model.addAttribute("result", 2);
		}else {
			if(service.memberIdCheck(kakao_id) == 1) {
				session.setAttribute("memId", kakao_nickname);
				session.setAttribute("kakaoId", kakao_id);
				model.addAttribute("result", 1);
				session.setAttribute("status", service.memberUserInfo(kakao_id).getStatus());
			}else {
				if(kakao_email.equals("no_check_email")) {
					memDTO.setId(kakao_id);
					service.memberInsert_kakao(memDTO);
					session.setAttribute("memId", kakao_nickname);
					session.setAttribute("kakaoId", kakao_id);
					session.setAttribute("status", service.memberUserInfo(kakao_id).getStatus());
				}else {
					memDTO.setId(kakao_id);
					memDTO.setEmail(kakao_email);
					service.memberInsert_kakao(memDTO);
					session.setAttribute("memId", kakao_nickname);
					session.setAttribute("kakaoId", kakao_id);
					session.setAttribute("status", service.memberUserInfo(kakao_id).getStatus());
				}
				model.addAttribute("result", 0);
			}
		}
		
		return "member/loginPro_kakao";
	}
	
	@RequestMapping("logout")
	public String memCheck_logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}
	
	@RequestMapping("delete")
	public String memCheck_delete(int kakao, Model model) {
		model.addAttribute("kakao", kakao);
		return "member/delete";
	}
	
	@RequestMapping("deletePro")
	public String memCheck_deletePro(int kakao, MemberDTO dto, Model model, HttpSession session) {
		if(kakao == 1) {
			model.addAttribute("result", 1);
			session.invalidate();
			service.memberDelete(dto.getId());
		}else {
			model.addAttribute("result", service.memberLoginCheck(dto));
			if(service.memberLoginCheck(dto) == 1) {
				session.invalidate();
				service.memberDelete(dto.getId());
			}
		}
		
		return "member/deletePro";
	}
	
	@RequestMapping("userInfo")
	public String memCheck_userInfo(HttpSession session, Model model) {
		String id = null;
		if(session.getAttribute("kakaoId") == null) {
			id = (String)session.getAttribute("memId");
		}else {
			id = (String)session.getAttribute("kakaoId");
		}
		model.addAttribute("memberDTO", service.memberUserInfo(id));
		
		return "member/userInfo";
	}
	
	@RequestMapping("update")
	public String memCheck_update(HttpSession session, MemberDTO dto, Model model) {
		model.addAttribute("result", service.memberLoginCheck(dto));
		
		String id = (String)session.getAttribute("memId");
		model.addAttribute("memberDTO", service.memberUserInfo(id));
		
		return "member/update";
	}
	
	@RequestMapping("update_kakao")
	public String memCheck_update_kakao(HttpSession session, Model model) {
		String id = (String)session.getAttribute("kakaoId");
		model.addAttribute("memberDTO", service.memberUserInfo(id));
		
		return "member/update_kakao";
	}
	
	@RequestMapping("updatePro")
	public String memCheck_updatePro(MemberDTO dto) {
		service.memberUpdate(dto);
		
		return "member/updatePro";
	}

}
