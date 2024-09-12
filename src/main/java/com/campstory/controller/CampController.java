package com.campstory.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.campstory.bean.CampDTO;
import com.campstory.bean.KeywordDTO;
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
	public String list(String pageNum, String sorter ,Model model, HttpServletRequest req) {
		pageNum = req.getParameter("pageNum");
		if(pageNum == null ) {
			pageNum = "1";
		}
		sorter = req.getParameter("sorter");
		if(sorter == null) {
			sorter = "name";
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
		
		
		List<CampDTO> list = service.getList (startRow, endRow, sorter);
		
		List<KeywordDTO> mainkeywordlist = service.getKeywordList();
		
		model.addAttribute("keywordlist",mainkeywordlist);	
		log.info(" ===========list" +list);
		 // View 데이터 전달.
		model.addAttribute("count", service.getCount());
		model.addAttribute("number",count-(currentPage-1)*pageSize);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("sorter",sorter);
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
	public String content(String contentid ,Model model,String pageNum, CampDTO dto,HttpServletRequest req,
			HttpSession session,String id) {
		pageNum = req.getParameter("pageNum");
		if(pageNum == null ) {
			pageNum = "1";
		}
		
		Date today = new Date();
		
		Calendar cal = Calendar.getInstance();
		String format = "MM/dd (E)";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String today1 = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1); //날짜를 하루 더한다.
		String day1 = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1); //날짜를 하루 더한다.
		String day2 = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1); //날짜를 하루 더한다.
		String day3 = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1); //날짜를 하루 더한다.
		String day4 = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1); //날짜를 하루 더한다.
		String day5 = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1); //날짜를 하루 더한다.
		String day6 = sdf.format(cal.getTime());
		
		int count = 0;
		int fcount = 0;
		if(session.getAttribute("kakaoId") == null) {
			id = (String)session.getAttribute("memId");
		}else {
			id = (String)session.getAttribute("kakaoId");
		}
		if (id != null) {
			count = service.goodCheck(contentid, id);
			fcount = service.favCheck(contentid, id);
		}
		 
		model.addAttribute("day0" ,today1);
		model.addAttribute("day1", day1 );
		model.addAttribute("day2", day2 );
		model.addAttribute("day3", day3 );
		model.addAttribute("day4", day4 );
		model.addAttribute("day5", day5 );
		model.addAttribute("day6", day6 );
		
		model.addAttribute("campDTO", service.getContent(contentid));
		model.addAttribute("contentid", contentid);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("goodCount", count);
		model.addAttribute("favCount", fcount);
			
			
			
		log.info("=========/camp/info?contentid="+contentid);
		log.info("======캠핑장명===="+dto.getFacltnm());
		return"camp/info";
	}
	@RequestMapping("slist")
	public String slist(String pageNum, Model model, HttpServletRequest req,
			@RequestParam(value ="donm",required=false,defaultValue="")String donm,
			@RequestParam(value ="themaenvrncl",required=false,defaultValue="") String themaenvrncl,
			@RequestParam(value ="lctcl",required=false,defaultValue="") String lctcl
		
			) {
		pageNum = req.getParameter("pageNum");
		if(pageNum == null ) {
			pageNum = "1";
		}
		donm = req.getParameter("donm");
		themaenvrncl = req.getParameter("themaenvrncl");
		lctcl = req.getParameter("lctcl");
		
		String donmStr[] = req.getParameterValues("donm");
		
		String themaStr[] = req.getParameterValues("themaenvrncl");
		
		String lctclStr[] = req.getParameterValues("lctcl");
		
		String donmSql = Arrays.toString(donmStr).replaceAll(",", " ").replaceAll("\\[", "").replaceAll("\\]", "");
		if(donmStr == null) {
			donmSql = "donm like '%%'";
		}
		String themaSql = Arrays.toString(themaStr).replaceAll(",", " ").replaceAll("\\[", "").replaceAll("\\]", "");;
		if(themaStr == null) {
			themaSql = "and themaenvrncl like '%%'";
		}
		String lctclSql = Arrays.toString(lctclStr).replaceAll(",", " ").replaceAll("\\[", "").replaceAll("\\]", "");;
		if(lctclStr == null) {
			lctclSql = "and lctcl like '%%'";
		}
		log.info(donmSql);
		log.info(themaSql);
		log.info(lctclSql);
		String sql = " ";
		String readysql = donmSql + themaSql + lctclSql;
		if (readysql.startsWith("and")) {
			sql = readysql.substring(4, readysql.length());
			
		}else {
			sql = readysql;
		}
		
		System.out.println(sql +"=======sql=====");
		
		
		
		int count = service.getDSearchCount(sql);
		List<KeywordDTO> mainkeywordlist = service.getKeywordList();
		
		model.addAttribute("keywordlist",mainkeywordlist);	
		
		
		List<CampDTO> searchlist = service.getDSearchList(sql);
		
		log.info(" ===========list" +searchlist);
		 // View 데이터 전달.
		model.addAttribute("searchcount", service.getDSearchCount(sql));
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("currentPage",pageNum);
		model.addAttribute("searchlist",searchlist);
		model.addAttribute("donm",donm);
		model.addAttribute("themaenvrncl",themaenvrncl);
		model.addAttribute("lctcl",lctcl);
		

		
		return "camp/slist";
	}
	
	@RequestMapping("klist")
	public String klist(String pageNum, Model model, HttpServletRequest req,
			@RequestParam(value ="keyword",required=false,defaultValue="") String keyword
			
			) {
		pageNum = req.getParameter("pageNum");
		if(pageNum == null ) {
			pageNum = "1";
		}
		keyword = req.getParameter("keyword");
		
		log.info("======keyword===="+keyword);
		
		String[] arrayKey = keyword.split(" ");
		log.info("======arrayKey===="+arrayKey);
		
		String keySql = null;
		if(arrayKey.length > 1) {
			keySql = keyword.replace(" ", "%");
			log.info("======keySql===="+keySql);
		}else {
			keySql = keyword;
		}
		
		int pageSize=10;		
		int count = service.getKSearchCount(keySql);
		int currentPage = Integer.parseInt(pageNum);
		int startPage=(int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int startRow = (currentPage -1) *pageSize+1;
		int endRow = currentPage * pageSize;
		
		log.info("====start==="+startRow);
		log.info("====end==="+endRow);
		
		
		List<CampDTO> searchlist = service.getKSearchList(keySql, startRow, endRow);
		
		for(int i=0 ; i < arrayKey.length; i++) {
			int keyCount = service.keywordCount(arrayKey[i]);
			int keyDateCount = service.keywordDateCount(arrayKey[i]);
			log.info("======arrayKey[i]===="+arrayKey[i]);
			if(keyword !=null) {
				if (keyCount == 0) {
					service.keywordInsert(arrayKey[i]);
				}else {
					service.keywordUp(arrayKey[i]);
				}
				if (keyDateCount ==0) {
					service.keywordDateInsert(arrayKey[i]);
				}else {
					service.keywordDateUp(arrayKey[i]);
				}
			}
		}
		
		List<KeywordDTO> keywordlist = service.getKeywordList();
		
		log.info(" ===========list" +searchlist);
		 // View 데이터 전달.
		model.addAttribute("searchcount", service.getKSearchCount(keySql));
		model.addAttribute("number",count-(currentPage-1)*pageSize);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",pageNum);
		model.addAttribute("pageCount", count / pageSize + ( count % pageSize == 0 ? 0 : 1));
		model.addAttribute("startPage", (int)(currentPage/10)*10+1);
		model.addAttribute("pageBlock", 10);
		model.addAttribute("endPage",startPage + pageBlock-1);
		model.addAttribute("searchlist",searchlist);
		model.addAttribute("keyword", keyword);
		model.addAttribute("keywordlist",keywordlist);

		
		return "camp/klist";
	}
	
	@RequestMapping("readcount")
	public String readcount(String contentid,String pageNum, RedirectAttributes rttr,HttpServletRequest req) {
		pageNum = req.getParameter("pageNum");
		if(pageNum == null ) {
			pageNum = "1";
		}
		service.readcountUp(contentid);
		int datecount = service.readDateCount(contentid);
		if(datecount == 0) {
			service.readDateInsert(contentid);
		}else {
			service.readDateUp(contentid);
		}
		rttr.addAttribute("contentid", contentid);
		return "redirect:/camp/info";
	}
	
	@RequestMapping("good")
	public String good( String id ,HttpServletRequest req, Model model,HttpSession session,
			@RequestParam(value ="contentid",required=false,defaultValue="") String contentid) {
	
		
		
		if(session.getAttribute("kakaoId") == null) {
			id = (String)session.getAttribute("memId");
		}else {
			id = (String)session.getAttribute("kakaoId");
		}
		log.info(id);
		log.info(contentid);
		if (id != null ) {
			int count = service.goodCheck(contentid, id);
			if (count == 0){
				service.goodUp(contentid);
				service.goodInsert(contentid, id);
			}else {
				service.goodDown(contentid);
				service.goodDelete(contentid, id);
			}
			
			
			
			model.addAttribute("goodCount", count);
			model.addAttribute("contentid", contentid);
		}
		
		
		
		
		
		return "camp/good";
	}
	@RequestMapping("favorite")
	public String favorite( String id ,HttpServletRequest req, Model model,HttpSession session,
			@RequestParam(value ="contentid",required=false,defaultValue="") String contentid) {
	
		
		
		if(session.getAttribute("kakaoId") == null) {
			id = (String)session.getAttribute("memId");
		}else {
			id = (String)session.getAttribute("kakaoId");
		}
		log.info(id);
		log.info(contentid);
		if (id != null ) {
			int fcount = service.favCheck(contentid, id);
			if (fcount == 0){
				service.favInsert(contentid, id);
			}else {
				service.favDelete(contentid, id);
			}
			
			
			
			model.addAttribute("favCount", fcount);
			model.addAttribute("contentid", contentid);
		}
		
		
		
		
		
		return "camp/favorite";
	}
	
	@RequestMapping("input")
	public String input(HttpServletRequest req, Model model) {
		List<CampDTO> sigungulist = service.getSigungunm();
		model.addAttribute("sigungulist", sigungulist);
		return "camp/input";
	}
	
	@RequestMapping("inputPro")
	public String input(HttpServletRequest req, Model model,CampDTO campDTO) {
		
		model.addAttribute("result1" , service.inputCamp_info1(campDTO));
		model.addAttribute("result2" , service.inputCamp_info2(campDTO));
		model.addAttribute("result3" , service.inputCamp_info3(campDTO));
		return "camp/inputPro";
	}
	@RequestMapping("update")
	public String update(HttpServletRequest req, Model model,String contentid, CampDTO campDTO) {
		model.addAttribute("campDTO", service.getContent(contentid));
		model.addAttribute("contentid",contentid);
		
		List<CampDTO> sigungulist = service.getSigungunm();
		model.addAttribute("sigungulist", sigungulist);
		return "camp/update";
	}
	
	@RequestMapping("updatePro")
	public String updatePro(HttpServletRequest req, Model model,CampDTO campDTO) {
		
		model.addAttribute("result1" , service.updateCamp_info1(campDTO));
		model.addAttribute("result2" , service.updateCamp_info2(campDTO));
		model.addAttribute("result3" , service.updateCamp_info3(campDTO));
		return "camp/updatePro";
	}
}
