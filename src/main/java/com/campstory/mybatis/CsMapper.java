package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CsDTO;

public interface CsMapper {
	
	public int insertArticle(CsDTO csDTO);
	
	public int getArticleCount();
	
	public int getArticleCount_col(CsDTO csDTO);
	
	public int getCateCount(String cate);
	
	public int getCateCount_col(CsDTO csDTO);
	
	public List<CsDTO> getArticles(@Param("start") int start, @Param("end") int end);
	
	public List<CsDTO> getArticles_col(CsDTO csDTO);
	
	public List<CsDTO> getCate(CsDTO csDTO);
	
	public List<CsDTO> getCate_col(CsDTO csDTO);
	
	public CsDTO getUpdate(int num);
	
	public int updateArticle(CsDTO csDTO);
	
	public int updateArticleAdmin(CsDTO csDTO);
	
	public int deleteArticle(int num);
	
	//notice
	public int insertNotice(CsDTO csDTO);
	
	public int getNoticeCount();
	
	public List<CsDTO> getNotice(@Param("start") int start, @Param("end") int end);
	
	public int deleteNotice(int num);
}
