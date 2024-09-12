package com.campstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campstory.bean.CampDTO;
import com.campstory.bean.KeywordDTO;
import com.campstory.mybatis.CampMapper;

import lombok.Setter;

@Service
public class CampServiceImpl implements CampService {
	
	@Setter(onMethod_=@Autowired)
	private CampMapper mapper;

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return mapper.getCount();
	}

	@Override
	public List<CampDTO> getList(int startRow, int endRow, String sorter) {
		// TODO Auto-generated method stub
		return mapper.getList(startRow, endRow, sorter);
	}

	@Override
	public CampDTO getContent(String contentid) {
		// TODO Auto-generated method stub
		return mapper.getContent(contentid);
	}

	@Override
	public int getDSearchCount(String sql) {
		// TODO Auto-generated method stub
		return mapper.getDSearchCount(sql);
	}

	@Override
	public List<CampDTO> getDSearchList(String sql) {
		// TODO Auto-generated method stub
		return mapper.getDSearchList(sql);
	}

	@Override
	public int getKSearchCount(String keyword) {
		// TODO Auto-generated method stub
		return mapper.getKSearchCount(keyword);
	}

	@Override
	public List<CampDTO> getKSearchList(String keyword, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return mapper.getKSearchList(keyword, startRow, endRow);
	}

	@Override
	public int readcountUp(String contentid) {
		// TODO Auto-generated method stub
		return mapper.readcountUp(contentid);
	}

	@Override
	public int goodCheck(String contentid, String id) {
		// TODO Auto-generated method stub
		return mapper.goodCheck(contentid, id);
	}

	@Override
	public int goodUp(String contentid) {
		// TODO Auto-generated method stub
		return mapper.goodUp(contentid);
	}

	@Override
	public int goodDown(String contentid) {
		// TODO Auto-generated method stub
		return mapper.goodDown(contentid);
	}

	@Override
	public int goodInsert(String contentid, String id) {
		// TODO Auto-generated method stub
		return mapper.goodInsert(contentid, id);
	}

	@Override
	public int goodDelete(String contentid, String id) {
		// TODO Auto-generated method stub
		return mapper.goodDelete(contentid, id);
	}

	@Override
	public int keywordCount(String keyword) {
		// TODO Auto-generated method stub
		return mapper.keywordCount(keyword);
	}

	@Override
	public int keywordInsert(String keyword) {
		// TODO Auto-generated method stub
		return mapper.keywordInsert(keyword);
	}

	@Override
	public int keywordUp(String keyword) {
		// TODO Auto-generated method stub
		return mapper.keywordUp(keyword);
	}

	@Override
	public List<KeywordDTO> getKeywordList() {
		// TODO Auto-generated method stub
		return mapper.getKeywordList();
	}

	@Override
	public List<CampDTO> getSigungunm() {
		// TODO Auto-generated method stub
		return mapper.getSigungunm();
	}

	
	@Override
	public int inputCamp_info1(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.inputCamp_info1(campDTO);
		
	}

	@Override
	public int inputCamp_info2(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.inputCamp_info2(campDTO);
	}

	@Override
	public int inputCamp_info3(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.inputCamp_info3(campDTO);
	}

	@Override
	public int keywordDateCount(String keyword) {
		// TODO Auto-generated method stub
		return mapper.keywordDateCount(keyword);
	}

	@Override
	public int keywordDateInsert(String keyword) {
		// TODO Auto-generated method stub
		return mapper.keywordDateInsert(keyword);
	}

	@Override
	public int keywordDateUp(String keyword) {
		// TODO Auto-generated method stub
		return mapper.keywordDateUp(keyword);
	}

	@Override
	public int readDateCount(String contentid) {
		// TODO Auto-generated method stub
		return mapper.readDateCount(contentid);
	}

	@Override
	public int readDateInsert(String contentid) {
		// TODO Auto-generated method stub
		return mapper.readDateInsert(contentid);
	}

	@Override
	public int readDateUp(String contentid) {
		// TODO Auto-generated method stub
		return mapper.readDateUp(contentid);
	}

	@Override
	public List<KeywordDTO> getKeywordDateList(String keyworddate) {
		// TODO Auto-generated method stub
		return mapper.getKeywordDateList(keyworddate);
	}

	@Override
	public int getKeywordDateCount(String keyworddate) {
		// TODO Auto-generated method stub
		return mapper.getKeywordDateCount(keyworddate);
	}

	@Override
	public List<CampDTO> getReadCountList() {
		// TODO Auto-generated method stub
		return mapper.getReadCountList();
	}

	@Override
	public List<CampDTO> getReadDateList(String readdate) {
		// TODO Auto-generated method stub
		return mapper.getReadDateList(readdate);
	}

	@Override
	public int getReadDateCount(String readdate) {
		// TODO Auto-generated method stub
		return mapper.getReadDateCount(readdate);
	}

	@Override
	public List<CampDTO> getGoodList() {
		// TODO Auto-generated method stub
		return mapper.getGoodList();
	}

	@Override
	public List<CampDTO> getNewCampList() {
		// TODO Auto-generated method stub
		return mapper.getNewCampList();
	}
	
	@Override
	public List<CampDTO> getUpdateCampList() {
		// TODO Auto-generated method stub
		return mapper.getUpdateCampList();
	}
	
	@Override
	public CampDTO getNewContent(String contentid) {
		// TODO Auto-generated method stub
		return mapper.getNewContent(contentid);
	}
	
	@Override
	public CampDTO getUpdateContent(String contentid) {
		// TODO Auto-generated method stub
		return mapper.getUpdateContent(contentid);
	}
	
	@Override
	public int final_inputCamp_info1(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.final_inputCamp_info1(campDTO);
	}

	@Override
	public int final_inputCamp_info2(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.final_inputCamp_info2(campDTO);
	}

	@Override
	public int final_inputCamp_info3(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.final_inputCamp_info3(campDTO);
	}

	@Override
	public int updateCamp_info1(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.updateCamp_info1(campDTO);
	}

	@Override
	public int updateCamp_info2(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.updateCamp_info2(campDTO);
	}

	@Override
	public int updateCamp_info3(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.updateCamp_info3(campDTO);
	}

	@Override
	public int final_updateCamp_info1(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.final_updateCamp_info1(campDTO);
	}

	@Override
	public int final_updateCamp_info2(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.final_updateCamp_info2(campDTO);
	}

	@Override
	public int final_updateCamp_info3(CampDTO campDTO) {
		// TODO Auto-generated method stub
		return mapper.final_updateCamp_info3(campDTO);
	}

	@Override
	public int getFacltnmCount(String keyword) {
		// TODO Auto-generated method stub
		return mapper.getFacltnmCount(keyword);
	}

	@Override
	public List<CampDTO> getFacltnmList(String keyword) {
		// TODO Auto-generated method stub
		return mapper.getFacltnmList(keyword);
	}

	@Override
	public List<CampDTO> getFacltnm() {
		// TODO Auto-generated method stub
		return mapper.getFacltnm();
	}

	@Override
	public int delete_camp1(String contentid) {
		// TODO Auto-generated method stub
		return mapper.delete_camp1(contentid);
	}

	@Override
	public int delete_camp2(String contentid) {
		// TODO Auto-generated method stub
		return mapper.delete_camp2(contentid);
	}

	@Override
	public int delete_camp3(String contentid) {
		// TODO Auto-generated method stub
		return mapper.delete_camp3(contentid);
	}

	@Override
	public int delete_temp_camp1(String contentid) {
		// TODO Auto-generated method stub
		return mapper.delete_temp_camp1(contentid);
	}

	@Override
	public int delete_temp_camp2(String contentid) {
		// TODO Auto-generated method stub
		return mapper.delete_temp_camp2(contentid);
	}

	@Override
	public int delete_temp_camp3(String contentid) {
		// TODO Auto-generated method stub
		return mapper.delete_temp_camp3(contentid);
	}

	@Override
	public int delete_update_camp1(String contentid) {
		// TODO Auto-generated method stub
		return mapper.delete_update_camp1(contentid);
	}

	@Override
	public int delete_update_camp2(String contentid) {
		// TODO Auto-generated method stub
		return mapper.delete_update_camp2(contentid);
	}

	@Override
	public int delete_update_camp3(String contentid) {
		// TODO Auto-generated method stub
		return mapper.delete_update_camp3(contentid);
	}

	@Override
	public int favCheck(String contentid, String id) {
		// TODO Auto-generated method stub
		return mapper.favCheck(contentid, id);
	}

	@Override
	public int favInsert(String contentid, String id) {
		// TODO Auto-generated method stub
		return mapper.favInsert(contentid, id);
	}

	@Override
	public int favDelete(String contentid, String id) {
		// TODO Auto-generated method stub
		return mapper.favDelete(contentid, id);
	}

	



}
