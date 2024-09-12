package com.campstory.service;

import java.util.List;

import com.campstory.bean.CsDTO;

public interface CsService {

	public int qnaInsert(CsDTO csDTO);
	
	public int qnaAllCount();
	
	public int qnaAllCount_col(CsDTO csDTO);
	
	public int qnaCateCount(String cate);
	
	public int qnaCateCount_col(CsDTO csDTO);
	
	public List<CsDTO> csList(int start, int end);
	
	public List<CsDTO> csList_col(CsDTO csDTO);
	
	public List<CsDTO> cateList(CsDTO csDTO);
	
	public List<CsDTO> cateList_col(CsDTO csDTO);
	
	public CsDTO csGetupdate(int num);
	
	public int csUpdate(CsDTO csDTO);
	
	public int csUpdateAdmin(CsDTO csDTO);
	
	public int csDelete(int num);
	
	// notice
	public int noticeInsert(CsDTO csDTO);
	
	public int noticeAllCount();
	
	public List<CsDTO> noticeList(int start, int end);
	
	public int noticeDelete(int num);
	
}
