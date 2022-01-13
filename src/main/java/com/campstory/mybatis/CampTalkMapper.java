package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampTalkDTO;

public interface CampTalkMapper {
	
	public List<CampTalkDTO> getTalkList(String area);
	
	public int talkWrite(CampTalkDTO dto);
	
	public List<String> searchList(@Param("facltnm") String name, @Param("area") String area);
	
}	
