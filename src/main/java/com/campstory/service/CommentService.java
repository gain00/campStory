package com.campstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.campstory.bean.CommentDTO;
import com.campstory.mybatis.BoardMapper;
import com.campstory.mybatis.CommentMapper;


public interface CommentService {
	
	
	
	
	public List<CommentDTO> getComment(int num_tip)  throws Exception;
	
	public void insertComment(CommentDTO dto) ;
	
	//댓글 수정
	public void updateComment(CommentDTO dto);
		
	//댓글 삭제
	public void deleteComment(CommentDTO dto);
		
	//특정 댓글 조회
	public CommentDTO selectComment(int cno) throws Exception;
	
}
