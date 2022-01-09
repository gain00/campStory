package com.campstory.service;

import java.util.List;

import com.campstory.bean.CampDTO;


public interface CampService {
	
	public int getCount();
	
	public List<CampDTO> getList(int startRow, int endRow);
	
	public CampDTO getContent(String contentid);

}
