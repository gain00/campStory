package com.campstory.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampTalkDTO;

public interface CampServiceTalk {

	public List<CampTalkDTO> getTalkList(String area, int rowStart, int rowEnd);

	public int talkWrite(CampTalkDTO dto);

	public List<CampTalkDTO> getCampSearchList(String camp, String area, int rowStart, int rowEnd);

	public int getTotalCount(String area);

	public int talkGoodUp(int num_talk);

	public int goodListInput(String id, int num_talk);

	public int talkGoodDown(int num_talk);

	public int goodListDel(String id, int num_talk);
	
	public List<CampTalkDTO> goodListAll();

	public int getTotalCampCount(String area, String camp);
}
