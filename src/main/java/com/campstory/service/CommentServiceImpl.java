package com.campstory.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campstory.bean.BoardDTO;
import com.campstory.bean.CommentDTO;
import com.campstory.mybatis.CommentMapper;



@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentMapper mapper;
	
	
	@Override
	public  List<CommentDTO> getComment(int num_tip)  throws Exception{
		return mapper.getComment(num_tip) ;
	}
	
	@Override
	public void insertComment(CommentDTO dto) {
		mapper.insertComment(dto);
	}
	
	@Override
	public void updateComment(CommentDTO dto) {
		mapper.updateComment(dto);
	}
	
	@Override
	public void deleteComment(CommentDTO dto) {
		mapper.deleteComment(dto);
	}
	
	@Override
	public CommentDTO selectComment(int cno) throws Exception {
		return mapper.selectComment(cno);
	}
}
