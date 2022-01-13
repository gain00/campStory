package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampDTO;




public interface CampMapper {
	
	public List<CampDTO> getList(@Param("startRow") int startRow, @Param("endRow")int endRow);
	
	public CampDTO getContent(@Param("contentid") String contentid);
	
	public int getCount();
}
