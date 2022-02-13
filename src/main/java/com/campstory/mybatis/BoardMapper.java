package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.BoardDTO;
import com.campstory.bean.BoardpageDTO;

public interface BoardMapper {
	
	public int getArticleCount();
	
	public int getSearchlistCount();
	
	public List<BoardDTO> getArticles(
				@Param("startRow") int startRow ,
				@Param("endRow") int endRow,
				@Param("searchType")String searchType,
				@Param("keyword")String keyword
			) throws Exception;
	
	
	public int maxNum();
	
	public BoardDTO getArticle(int num_tip);
	
	public BoardDTO camp_tip2(int num_tip);
	
	
	public void readcountUpdate(int num_tip);
	
	public int insert(BoardDTO boardDTO) throws Exception;
	
	public int update(BoardDTO boardDTO) throws Exception;
	
	
	public int delete(int num_tip) throws Exception;
	
	

}
