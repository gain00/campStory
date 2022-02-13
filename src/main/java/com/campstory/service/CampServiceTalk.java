package com.campstory.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampTalkDTO;

public interface CampServiceTalk {

	public List<CampTalkDTO> getTalkList(String area, int rowStart, int rowEnd);
	public int getTotalCount(String area);

	public List<CampTalkDTO> getMyTalkList(String area, String id, int rowStart, int rowEnd);
	public int getMyTalkCount(String id);
	
	public List<CampTalkDTO> getMyGoodList(String area, String id, int rowStart, int rowEnd);
	public int getMyGoodCount(String id);

	public List<CampTalkDTO> getCampSearch(String camp, String area, int rowStart, int rowEnd);
	public int getCampSearchCount(String area, String camp);
	
	
	public List<CampTalkDTO> campInfoSearch(String camp, String area, int rowStart, int rowEnd);
	public int campInfoSearchCount(String area, String camp);
	

	public int talkGoodUp(String id, int num_talk);
	public int talkGoodDown(String id, int num_talk);

	
	public List<CampTalkDTO> goodListAll();
	
	public int talkWrite(CampTalkDTO dto);

	public CampTalkDTO getTalk(int num_talk);
	public int talkUpdate(CampTalkDTO dto);
	
	public int talkDelete(int num_talk);
	
	public int talkWriteQnA(CampTalkDTO dto);
	public List<CampTalkDTO> getTalkQnA(int num_talk);
	public int qnaDel(int num_talkqna);
	
	public int getNotify(int num_tlak, String sid);
	public int inputNotify(int num_tlak, String sid);
	
	public List<CampTalkDTO> getNotifyList(String check, int count);
	
	public int setNotify(int num_talk);
	
}
