package com.campstory.service;
import java.util.List;
import com.campstory.bean.BoardDTO;
import com.campstory.bean.BoardpageDTO;



public interface BoardService {

	
	public int count();
	
	public int getSearchlistCount();
	
	public List<BoardDTO> getList(int startRow , int endRow,String searchType,String keyword) throws Exception;
	
	public int maxNum();
	
	public BoardDTO getArticle(int num_tip);
	
	public BoardDTO camp_tip2(int num_tip);
	
	public void readcountUpdate(int num_tip);
	
	public int insert(BoardDTO boardDTO) throws Exception;
	
	public int update(BoardDTO boardDTO) throws Exception;
	
	
	public int delete(int num_tip) throws Exception;
	
}
