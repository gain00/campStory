package com.campstory.mybatis;

import java.util.List;


import com.campstory.bean.CommentDTO;

public interface CommentMapper {
	
	
	//댓글 조회
	public  List<CommentDTO> getComment(int num_tip)  throws Exception;
	
	//댓글 작성
	public void insertComment(CommentDTO dto);
	
	//댓글 수정
	public void updateComment(CommentDTO dto);
	
	//댓글 삭제
	public void deleteComment(CommentDTO dto);
	
	//특정 댓글 조회
	public CommentDTO selectComment(int cno) throws Exception;
	
	

}
