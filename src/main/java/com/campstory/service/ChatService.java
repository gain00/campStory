package com.campstory.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampTalkDTO;

public interface ChatService {
	
	public int insert(String username, String msg);
	
	public List getChat();
	
	public int delChat();
	
	public int getCountChat();
}
