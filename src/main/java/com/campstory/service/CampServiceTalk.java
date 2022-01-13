package com.campstory.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampTalkDTO;

public interface CampServiceTalk {
	
	public List<CampTalkDTO> getTalkList(String area); 
	
	public int talkWrite(CampTalkDTO dto);
	
	public List<String> searchList(String facltnm, String area);
	
}
