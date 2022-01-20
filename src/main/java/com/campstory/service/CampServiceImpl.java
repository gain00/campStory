package com.campstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campstory.bean.CampDTO;
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
	public List<CampDTO> getList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return mapper.getList(startRow, endRow);
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

}
