package com.campstory.controller;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpSession;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.campstory.bean.CampDTO;
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
@Controller
@RequestMapping("/admin/")
@AllArgsConstructor

public class AdminController {
	@Autowired
	private CampService campservice;
	@Autowired
	private CampServiceTalk campservicetalk;
	@Autowired
	private CsService csservice;
	@Autowired
	private MemberService memberservice;
  @Autowired
  private MemberDTO memDTO;
	
	@RequestMapping("main")
	public String admin(Model model,HttpServletRequest req,
			@RequestParam(value ="keyworddate",required=false,defaultValue="") String keyworddate,
			@RequestParam(value ="readdate",required=false,defaultValue="") String readdate
			){
		System.out.println("=====keyworddate1=="+keyworddate);
		Calendar today = Calendar.getInstance();
		String format = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String todaystr = sdf.format(today.getTime());
		System.out.println(todaystr);
		keyworddate = req.getParameter("keyworddate");
		if (keyworddate == null) {
			keyworddate = todaystr;
		}
		readdate = req.getParameter("readdate");
		if (readdate == null) {
			readdate = todaystr;
		}
		
		List<KeywordDTO> keyworddatelist = null;
		if (keyworddate == null ) {
			keyworddatelist = campservice.getKeywordDateList(todaystr);
		}else {
			
			keyworddatelist = campservice.getKeywordDateList(keyworddate);
		}
		List<CampDTO> readdatelist = null;
		if (readdate == null ) {
			readdatelist = campservice.getReadDateList(todaystr);
		}else {
			
			readdatelist = campservice.getReadDateList(readdate);
		}
		
		System.out.println("=====keyworddate2="+keyworddate);
		log.info(keyworddate);
		List<KeywordDTO> keywordlist = campservice.getKeywordList();
		List<CampDTO> readcountlist = campservice.getReadCountList();
		int kdcount = campservice.getKeywordDateCount(keyworddate);
		int rdcount = campservice.getReadDateCount(readdate);
		model.addAttribute("keywordlist", keywordlist);
		model.addAttribute("keyworddate", keyworddate);
		model.addAttribute("kdcount", kdcount);
		model.addAttribute("keyworddatelist", keyworddatelist);
		model.addAttribute("readcountlist", readcountlist);
		model.addAttribute("readdate", readdate);
		model.addAttribute("rdcount", rdcount);
		model.addAttribute("readdatelist", readdatelist);
		model.addAttribute("goodlist", campservice.getGoodList());
		return "admin/main";
	}
	
	
	@RequestMapping("camp")
	public String admin_camp(Model model,HttpServletRequest req,
			@RequestParam(value ="keyword",required=false,defaultValue="") String keyword){
		model.addAttribute("newCamplist", campservice.getNewCampList());
		model.addAttribute("updateCamplist", campservice.getUpdateCampList());
		model.addAttribute("facltnmData", campservice.getFacltnm());
		if(keyword == null) {
			model.addAttribute("facltnmlist", null);
		}
		if (keyword != null ) {
			model.addAttribute("facltnmlist", campservice.getFacltnmList(keyword));
		}
		
		model.addAttribute("keyword", keyword);
		log.info("====keyword===="+keyword);
		
		return "admin/camp";
	}
	
	@RequestMapping("camp/newcamp")
	public String admin_newcamp(Model model, HttpServletRequest req, CampDTO campDTO ,String contentid){
		model.addAttribute("campDTO", campservice.getNewContent(contentid));
		model.addAttribute("contentid",contentid);
		
		return "admin/newCamp";
	}
	
	@RequestMapping("camp/newcampPro")
	public String input(HttpServletRequest req, Model model,CampDTO campDTO,
			@RequestParam(value ="contentid",required=false,defaultValue="") String contentid) {
		
		System.out.println("contentid ===========" +contentid);
		campDTO = campservice.getNewContent(contentid);
		
		System.out.println("campDTO ===========" +campDTO);
		
		model.addAttribute("result1" , campservice.final_inputCamp_info1(campDTO));
		model.addAttribute("result2" , campservice.final_inputCamp_info2(campDTO));
		model.addAttribute("result3" , campservice.final_inputCamp_info3(campDTO));
		campservice.delete_temp_camp1(contentid);
		campservice.delete_temp_camp2(contentid);
		campservice.delete_temp_camp3(contentid);
		return "admin/newCampPro";
	}
	@RequestMapping("camp/updatecamp")
	public String admin_updatecamp(Model model, HttpServletRequest req, CampDTO campDTO ,String contentid){
		model.addAttribute("campDTO", campservice.getUpdateContent(contentid));
		model.addAttribute("contentid",contentid);
		
		return "admin/updateCamp";
	}
	
	@RequestMapping("camp/updatecampPro")
	public String admin_updatecampPro(HttpServletRequest req, Model model,CampDTO campDTO,
			@RequestParam(value ="contentid",required=false,defaultValue="") String contentid) {
		
		System.out.println("contentid ===========" +contentid);
		campDTO = campservice.getNewContent(contentid);
		
		System.out.println("campDTO ===========" +campDTO);
		
		model.addAttribute("result1" , campservice.final_updateCamp_info1(campDTO));
		model.addAttribute("result2" , campservice.final_updateCamp_info2(campDTO));
		model.addAttribute("result3" , campservice.final_updateCamp_info3(campDTO));
		campservice.delete_update_camp1(contentid);
		campservice.delete_update_camp2(contentid);
		campservice.delete_update_camp3(contentid);
		return "admin/updateCampPro";
	}
	
	@RequestMapping("campDelete")
	public String campDelete(Model model, HttpServletRequest req, 
			@RequestParam(value ="contentid",required=false,defaultValue="") String contentid){
		campservice.delete_camp1(contentid);
		campservice.delete_camp2(contentid);
		campservice.delete_camp3(contentid);
		model.addAttribute("contentid",contentid);
		
		return "admin/campDelete";
	}
	@RequestMapping("newcampDelete")
	public String newcampDelete(Model model, HttpServletRequest req, 
			@RequestParam(value ="contentid",required=false,defaultValue="") String contentid){
		campservice.delete_temp_camp1(contentid);
		campservice.delete_temp_camp2(contentid);
		campservice.delete_temp_camp3(contentid);
		model.addAttribute("contentid",contentid);
		
		return "admin/newCampDelete";
	}
	@RequestMapping("updatecampDelete")
	public String updatecampDelete(Model model, HttpServletRequest req, 
			@RequestParam(value ="contentid",required=false,defaultValue="") String contentid){
		campservice.delete_update_camp1(contentid);
		campservice.delete_update_camp2(contentid);
		campservice.delete_update_camp3(contentid);
		model.addAttribute("contentid",contentid);
		
		return "admin/updateCampDelete";
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
