package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampDTO;




public interface CampMapper {
	
	public List<CampDTO> getList(@Param("startRow") int startRow, @Param("endRow")int endRow);
	
	public CampDTO getContent(@Param("contentid") String contentid);
	
	public int getCount();
	
	public int getDSearchCount(@Param("sql") String sql);
	
	public List<CampDTO> getDSearchList(@Param("sql") String sql);
	
	public int getKSearchCount(@Param("keyword") String keyword);
	
	public List<CampDTO> getKSearchList(@Param("keyword") String keyword, @Param("startRow") int startRow, @Param("endRow")int endRow);
	
	public int readcountUp(@Param("contentid") String contentid);
	
	public int goodCheck(@Param("contentid") String contentid , @Param("id") String id);
	
	public int goodUp(@Param("contentid") String contentid);
	
	public int goodDown(@Param("contentid") String contentid);
	
	public int goodInsert(@Param("contentid") String contentid , @Param("id") String id);
	
	public int goodDelete(@Param("contentid") String contentid , @Param("id") String id);
}
