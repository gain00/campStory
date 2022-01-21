package com.campstory.service;
import java.util.List;
import com.campstory.bean.BoardDTO;



public interface BoardService {

	
	public int count();
	
	public List<BoardDTO> getList(int startRow , int endRow);
	
	public int maxNum();
	
	public BoardDTO getArticle(int num_tip);
	
	
}
