package com.campstory.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import com.campstory.bean.BoardDTO;
import com.campstory.bean.CommentDTO;

import com.campstory.service.BoardService;
import com.campstory.service.CommentService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private CommentService Cservice;
	
	@RequestMapping("list")
	public String list(String pageNum , Model model, 
			@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			   @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception {
		int pageSize = 4;
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		if (pageNum == null) {
	        pageNum = "1";
	    }

	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number= 0;
	    
	    count = service.count();  
	    List articleList = null;
	    if (count > 0) {
	    	articleList = service.getList(startRow, endRow, searchType, keyword);
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
	public String content(CommentDTO commentDTO,int num_tip , String pageNum , Model model) throws Exception {
		service.readcountUpdate(num_tip);
		
	
		
		
		model.addAttribute("tip2", service.camp_tip2(num_tip));
		model.addAttribute("article", service.getArticle(num_tip));//1대신 투입됨 = service.getArticle(num)
		model.addAttribute("pageNum", pageNum);
		
		
		List<CommentDTO>  commentList  = Cservice.getComment(num_tip);
		model.addAttribute("commentList",commentList);
		
		return "board/content";
		
		
	}
	
	
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/board/insertView", method = RequestMethod.GET)
		public void insertView() throws Exception{
			
			
		}
		
		// 게시판 글 작성
	@RequestMapping(value = "/board/insert", method = RequestMethod.POST)
	public String insert(BoardDTO boardDTO) throws Exception{
	
	service.insert(boardDTO);
	
	return "redirect:/board/list";
}
	
	@RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
	public String updateView(BoardDTO boardDTO, Model model) throws Exception{
		
		
		model.addAttribute("update", service.getArticle(boardDTO.getNum_tip()));
		
		return "board/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(BoardDTO boardDTO) throws Exception{
		
		
		service.update(boardDTO);
		
		return "redirect:/board/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/board/delete", method = RequestMethod.POST)
	public String delete(BoardDTO boardDTO) throws Exception{
		
		
		service.delete(boardDTO.getNum_tip());
		
		return "redirect:/board/list";
	}
	
	
	
	
	
	@RequestMapping(value="/commentInsert", method = RequestMethod.POST)
	public String commentInsert(CommentDTO commentDTO,int num_tip,RedirectAttributes rttr) throws Exception {
		
		
		Cservice.insertComment(commentDTO);
		
		rttr.addAttribute("num_tip",commentDTO.getNum_tip());
		
		return "redirect:/board/content";
		
		
	}
	
	//댓글 수정 GET
	@RequestMapping(value="/commentUpdateView", method = RequestMethod.GET)
	public String commentUpdateView(CommentDTO commentDTO, Model model) throws Exception {
			
			
		model.addAttribute("commentUpdate", Cservice.selectComment(commentDTO.getCno()));
		
			
		return "board/commentUpdateView";
	}
	
	//댓글 수정 POST
	@RequestMapping(value="/commentUpdate", method = RequestMethod.POST)
	public String commentUpdate(CommentDTO commentDTO, RedirectAttributes rttr) throws Exception {
			
			
		Cservice.updateComment(commentDTO);
			
		rttr.addAttribute("num_tip", commentDTO.getNum_tip());
			
		return "redirect:/board/selfclose";
	}

	//댓글 삭제 GET
	@RequestMapping(value="/commentDeleteView", method = RequestMethod.GET)
	public String commentDeleteView(CommentDTO commentDTO, Model model) throws Exception {
			
			
		model.addAttribute("commentDelete", Cservice.selectComment(commentDTO.getCno()));
		
			

		return "board/commentDeleteView";
	}
		
	//댓글 삭제
	@RequestMapping(value="/commentDelete", method = RequestMethod.POST)
	public String commentDelete(CommentDTO commentDTO,  RedirectAttributes rttr) throws Exception {
			
			
		Cservice.deleteComment(commentDTO);
			
		rttr.addAttribute("num_tip", commentDTO.getNum_tip());
			
		return "redirect:/board/selfclose";
	}

	@RequestMapping(value="/selfclose")
	public String selfclose() {
		
		return "/board/selfclose";
	}
}
