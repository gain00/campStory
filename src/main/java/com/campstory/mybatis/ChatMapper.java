package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ChatMapper {
	
	public int insert(@Param("username") String username, @Param("msg") String msg);
	
	public List getChat();
	
	public int delChat();
	
	public int getCountChat();
}

