package com.campstory.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.campstory.bean.CsDTO;
import com.campstory.service.CsService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Controller
@RequestMapping("/cs/")
public class CsController {
	
	@Autowired
	private CsService service;
	
	@Autowired
	private CsDTO autoDTO;
	
	@RequestMapping("qna")
	public String qna(String pageNum, String cate, String col, String colum, String search, Model model) {
		
		if (pageNum == null) {
	        pageNum = "1";
	    }
	    model.addAttribute("pageNum", pageNum);
	    if (cate == null) {
	    	cate = "전체";
	    }
	    model.addAttribute("cate", cate);
	    if (col == null) {
	    	col = "0";
	    }
	    model.addAttribute("col", col);
	    model.addAttribute("colum", colum);
	    model.addAttribute("search", search);
	    
	    int pageSize = 5;
	    model.addAttribute("pageSize", pageSize);
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number=0;
	    
	    if(cate.equals("전체")) {
	    	if(col.equals("1")) {
	    		autoDTO.setColum(colum);
	    		autoDTO.setSearch(search);
	    		autoDTO.setStart(startRow);
				autoDTO.setEnd(endRow);
	    		count = service.qnaAllCount_col(autoDTO);
	    		model.addAttribute("count", count);
				if (count > 0) {
					List<CsDTO> list = service.csList_col(autoDTO);
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
	    	}else {
	    		count = service.qnaAllCount();
			    model.addAttribute("count", count);
				if (count > 0) {
					List<CsDTO> list = service.csList(startRow, endRow);
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
			}
	    }else{
	    	if(col.equals("1")) {
	    		autoDTO.setCategory(cate);
	    		autoDTO.setColum(colum);
	    		autoDTO.setSearch(search);
	    		autoDTO.setStart(startRow);
				autoDTO.setEnd(endRow);
	    		count = service.qnaCateCount_col(autoDTO);
			    model.addAttribute("count", count);
				if (count > 0) {
					List<CsDTO> list = service.cateList_col(autoDTO);
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
	    	}else {
	    		count = service.qnaCateCount(cate);
			    model.addAttribute("count", count);
				if (count > 0) {
					autoDTO.setCategory(cate);
					autoDTO.setStart(startRow);
					autoDTO.setEnd(endRow);
					List<CsDTO> list = service.cateList(autoDTO);
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
	    	}
	    }
	    
		return "cs/qna";
	}
	
	@RequestMapping("qnaWritePro")
	public @ResponseBody int qnaWritePro(String category, String title, String content, String writer, int secret) {
		autoDTO.setCategory(category);
		autoDTO.setTitle(title);
		autoDTO.setContent(content);
		autoDTO.setWriter(writer);
		autoDTO.setSecret(secret);
		return service.qnaInsert(autoDTO);
	}
	
	@RequestMapping("qnaAdminPro")
	public @ResponseBody int qnaAdminPro(String re_comment, int num_question) {
		log.info("============="+re_comment);
		log.info("============="+num_question);
		autoDTO.setRe_comment(re_comment);
		autoDTO.setNum_question(num_question);
		
		return service.csUpdateAdmin(autoDTO);
	}
	
	@RequestMapping("qnaUpdate")
	public String qnaUpdate(int num, Model model) {
		model.addAttribute("csDTO", service.csGetupdate(num));
		
		return "cs/qnaUpdate";
	}
	
	@RequestMapping("qnaUpdatePro")
	public @ResponseBody int qnaUpdatePro(String category, String title, String content, int num_question, int secret) {
		autoDTO.setCategory(category);
		autoDTO.setTitle(title);
		autoDTO.setContent(content);
		autoDTO.setNum_question(num_question);
		autoDTO.setSecret(secret);
		return service.csUpdate(autoDTO);
	}
	
	@RequestMapping("qnaDeletePro")
	public String qnaDeletePro(int num) {
		service.csDelete(num);
		return "redirect:/cs/qna";
	}

	//notice Code
	
	@RequestMapping("notice")
	public String notice(String pageNum, Model model) {
		
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
	    
	    count = service.noticeAllCount();
	    model.addAttribute("count", count);
		if (count > 0) {
			List<CsDTO> list = service.noticeList(startRow, endRow);
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
	    
		return "cs/notice";
	}
	
	@RequestMapping("noticeWritePro")
	public @ResponseBody int noticeWritePro(String title, String content) {
		autoDTO.setTitle(title);
		autoDTO.setContent(content);
		return service.noticeInsert(autoDTO);
	}
	
	@RequestMapping("noticeDeletePro")
	public String noticeDeletePro(int num) {
		service.noticeDelete(num);
		return "redirect:/cs/notice";
	}
}
