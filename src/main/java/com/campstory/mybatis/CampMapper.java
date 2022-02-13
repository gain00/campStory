package com.campstory.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.campstory.bean.CampDTO;
import com.campstory.bean.KeywordDTO;




public interface CampMapper {
	
	public List<CampDTO> getList(@Param("startRow") int startRow, @Param("endRow")int endRow , @Param("sorter") String sorter);
	
	public CampDTO getContent(@Param("contentid") String contentid);
	
	public int getCount();
	
	public int getDSearchCount(@Param("sql") String sql);
	
	public List<CampDTO> getDSearchList(@Param("sql") String sql);
	
	public int getKSearchCount(@Param("keyword") String keyword);
	
	public List<CampDTO> getKSearchList(@Param("keyword") String keyword, @Param("startRow") int startRow, @Param("endRow")int endRow);
	
	public int readcountUp(@Param("contentid") String contentid);
	
	public int goodCheck(@Param("contentid") String contentid , @Param("id") String id);
	
	public int goodUp(@Param("contentid") String contentid);
	
	public int goodDown(@Param("contentid") String contentid);
	
	public int goodInsert(@Param("contentid") String contentid , @Param("id") String id);
	
	public int goodDelete(@Param("contentid") String contentid , @Param("id") String id);
	
	public int keywordCount(@Param("keyword") String keyword);
	
	public int keywordInsert(@Param("keyword") String keyword);
	
	public int keywordUp(@Param("keyword") String keyword);
	
	public List<KeywordDTO> getKeywordList();
	
	public List<CampDTO>getSigungunm();
	
	public int inputCamp_info1(CampDTO campDTO);
	
	public int inputCamp_info2(CampDTO campDTO);
	
	public int inputCamp_info3(CampDTO campDTO);
	
	public int keywordDateCount(@Param("keyword") String keyword);
	
	public int keywordDateInsert(@Param("keyword") String keyword);
	
	public int keywordDateUp(@Param("keyword") String keyword);
	
	public int readDateCount(@Param("contentid") String contentid);
	
	public int readDateInsert(@Param("contentid") String contentid);
	
	public int readDateUp(@Param("contentid") String contentid);
	
	public List<KeywordDTO> getKeywordDateList(@Param("keyworddate") String keyworddate);
	
	public int getKeywordDateCount(@Param("keyworddate") String keyworddate);
	
	public List<CampDTO> getReadCountList();
	
	public List<CampDTO> getReadDateList(@Param("readdate") String readdate);
	
	public int getReadDateCount(@Param("readdate") String readdate);
	
	public List<CampDTO> getGoodList();
	
	public List<CampDTO> getNewCampList();
	
	public List<CampDTO> getUpdateCampList();
	
	public CampDTO getNewContent(@Param("contentid") String contentid);
	
	public CampDTO getUpdateContent(@Param("contentid") String contentid);
	
	public int final_inputCamp_info1(CampDTO campDTO);
	
	public int final_inputCamp_info2(CampDTO campDTO);
	
	public int final_inputCamp_info3(CampDTO campDTO);
	
	public int updateCamp_info1(CampDTO campDTO);
	
	public int updateCamp_info2(CampDTO campDTO);
	
	public int updateCamp_info3(CampDTO campDTO);
	
	public int final_updateCamp_info1(CampDTO campDTO);
	
	public int final_updateCamp_info2(CampDTO campDTO);
	
	public int final_updateCamp_info3(CampDTO campDTO);
	
	public int getFacltnmCount(@Param("keyword") String keyword);
	
	public List<CampDTO> getFacltnmList(@Param("keyword") String keyword);
	
	public List<CampDTO>getFacltnm();
	
	public int delete_camp1(@Param("contentid") String contentid);
	
	public int delete_camp2(@Param("contentid") String contentid);
	
	public int delete_camp3(@Param("contentid") String contentid);
	
	public int delete_temp_camp1(@Param("contentid") String contentid);
	
	public int delete_temp_camp2(@Param("contentid") String contentid);
	
	public int delete_temp_camp3(@Param("contentid") String contentid);
	
	public int delete_update_camp1(@Param("contentid") String contentid);
	
	public int delete_update_camp2(@Param("contentid") String contentid);
	
	public int delete_update_camp3(@Param("contentid") String contentid);
	
}
