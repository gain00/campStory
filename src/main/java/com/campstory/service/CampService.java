package com.campstory.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampDTO;
import com.campstory.bean.KeywordDTO;


public interface CampService {
	
	public int getCount();
	
	public List<CampDTO> getList(int startRow, int endRow , String sorter);
	
	public CampDTO getContent(String contentid);
	
	public int getDSearchCount(String sql);
	
	public List<CampDTO> getDSearchList(String sql);
	
	public int getKSearchCount(String keyword);
	
	public List<CampDTO> getKSearchList(String keyword, int startRow, int endRow);
	
	public int readcountUp(String contentid);
	
	public int goodCheck(String contentid , String id);
	
	public int favCheck(String contentid , String id);
	
	public int goodUp(String contentid);
	
	public int goodDown(String contentid);
	
	public int goodInsert(String contentid , String id);
	
	public int goodDelete(String contentid , String id);
	
	public int favInsert(String contentid , String id);
	
	public int favDelete(String contentid , String id);
	
	public int keywordCount(String keyword);
	
	public int keywordInsert(String keyword);
	
	public int keywordUp(String keyword);
	
	public List<KeywordDTO> getKeywordList();
	
	public List<CampDTO>getSigungunm();
	
	public int inputCamp_info1(CampDTO campDTO);
	
	public int inputCamp_info2(CampDTO campDTO);
	
	public int inputCamp_info3(CampDTO campDTO);
	
	public int keywordDateCount(String keyword);
	
	public int keywordDateInsert(String keyword);
	
	public int keywordDateUp(String keyword);
	
	public int readDateCount(String contentid);
	
	public int readDateInsert(String contentid);
	
	public int readDateUp(String contentid);
	
	public List<KeywordDTO> getKeywordDateList(String keyworddate);
	
	public int getKeywordDateCount(String keyworddate);
	
	public List<CampDTO> getReadCountList();
	
	public List<CampDTO> getReadDateList(String readdate);
	
	public int getReadDateCount(String readdate);
	
	public List<CampDTO> getGoodList();
	
	public List<CampDTO> getNewCampList();
	
	public List<CampDTO> getUpdateCampList();
	
	public CampDTO getNewContent(String contentid);
	
	public CampDTO getUpdateContent(String contentid);
	
	public int final_inputCamp_info1(CampDTO campDTO);
	
	public int final_inputCamp_info2(CampDTO campDTO);
	
	public int final_inputCamp_info3(CampDTO campDTO);
	
	public int updateCamp_info1(CampDTO campDTO);
	
	public int updateCamp_info2(CampDTO campDTO);
	
	public int updateCamp_info3(CampDTO campDTO);
	
	public int final_updateCamp_info1(CampDTO campDTO);
	
	public int final_updateCamp_info2(CampDTO campDTO);
	
	public int final_updateCamp_info3(CampDTO campDTO);
	
	public int getFacltnmCount(String keyword);
	
	public List<CampDTO> getFacltnmList(String keyword);
	
	public List<CampDTO>getFacltnm();
	
	public int delete_camp1(String contentid);
	
	public int delete_camp2(String contentid);
	
	public int delete_camp3(String contentid);
	
	public int delete_temp_camp1(String contentid);
	
	public int delete_temp_camp2(String contentid);
	
	public int delete_temp_camp3(String contentid);
	
	public int delete_update_camp1(String contentid);
	
	public int delete_update_camp2(String contentid);
	
	public int delete_update_camp3(String contentid);

}
