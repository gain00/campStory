package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.BoardDTO;

public interface BoardMapper {
	
	public int getArticleCount();
	
	public List<BoardDTO> getArticles(
				@Param("startRow") int startRow ,
				@Param("endRow") int endRow);
	
	public int maxNum();
	
	public BoardDTO getArticle(int num_tip);
	
	

}
