package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampTalkDTO;

public interface CampTalkMapper {
	
	public List<CampTalkDTO> getTalkList(@Param("area") String area, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	public int getTotalCount(String area);
	
	
	public List<CampTalkDTO> getMyTalkList(@Param("area") String area, @Param("id") String id, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	public int getMyTalkCount(String id);
	
	
	public List<CampTalkDTO> getMyGoodList(@Param("area") String area, @Param("id") String id, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	public int getMyGoodCount(String id);
	
	public List<CampTalkDTO> getCampSearch( @Param("area") String area, @Param("camp") String camp, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	public int getCampSearchCount(@Param("area") String area, @Param("camp") String camp);
	
	
	public List<CampTalkDTO> campInfoSearch(@Param("camp") String camp, @Param("area") String area, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	public int campInfoSearchCount(@Param("area") String area, @Param("camp") String camp);
	
	
	
	public int talkGoodUp(int num_talk);
	public int goodListInput(@Param("id") String id, @Param("num_talk") int num_talk);
	public int talkGoodDown(int num_talk);
	public int goodListDel(@Param("id") String id, @Param("num_talk") int num_talk);
	
	
	public List<CampTalkDTO> goodListAll();
	
	public int talkWrite(CampTalkDTO dto);
	
	public CampTalkDTO getTalk(int num_talk);
	public int talkUpdate(CampTalkDTO dto);
	
	public int talkDelete(int num_talk);

	public int talkWriteQnA(CampTalkDTO dto);
	public List<CampTalkDTO> getTalkQnA(int num_talk);
	
	public int qnaDel(int num_talkqna);

	public int getNotify(@Param("num_talk") int num_talk, @Param("sid") String sid);
	public int inputNotify(@Param("num_talk") int num_talk, @Param("sid") String sid);
	
	public List<CampTalkDTO> getNotifyList(@Param ("check")String check, @Param ("count")int count);
	
	public int setNotify(int num_talk);
	
	
	
	
	public int aa(String date);
}	
