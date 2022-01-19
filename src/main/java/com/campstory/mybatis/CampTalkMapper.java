package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampTalkDTO;

public interface CampTalkMapper {
	
	public List<CampTalkDTO> getTalkList(@Param("area") String area, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	
	public int talkWrite(CampTalkDTO dto);
	
	public List<CampTalkDTO> getCampSearchList(@Param("camp") String camp, @Param("area") String area, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	
	public int getTotalCount(String area);
	
	public int talkGoodUp(int num_talk);
	
	public int goodListInput(@Param("id") String id, @Param("num_talk") int num_talk);
	
	public int talkGoodDown(int num_talk);
	
	public int goodListDel(@Param("id") String id, @Param("num_talk") int num_talk);
	
	public List<CampTalkDTO> goodListAll();
	
	public int getTotalCampCount(@Param("area") String area, @Param("camp") String camp);
}	
