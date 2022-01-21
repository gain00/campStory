package com.campstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campstory.bean.CampTalkDTO;
import com.campstory.mybatis.CampTalkMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Service
public class CampServiceTalkImpl implements CampServiceTalk {

	@Setter(onMethod_=@Autowired)
	private CampTalkMapper mapper;

	@Override
	public List<CampTalkDTO> getTalkList(String area, int rowStart, int rowEnd) {
		return mapper.getTalkList(area, rowStart, rowEnd);
	}

	@Override
	public int talkWrite(CampTalkDTO dto) {
		return mapper.talkWrite(dto);
	}

	@Override
	public List<CampTalkDTO> getCampSearchList(String camp, String area, int rowStart, int rowEnd) {
		return mapper.getCampSearchList(camp, area, rowStart, rowEnd);
	}

	@Override
	public int getTotalCount(String area) {
		return mapper.getTotalCount(area);
	}

	@Override
	public int goodListInput(String id, int num_talk) {
		return mapper.goodListInput(id, num_talk);
	}

	@Override
	public int talkGoodUp(int num_talk) {
		return mapper.talkGoodUp(num_talk);
	}

	@Override
	public int talkGoodDown(int num_talk) {
		return mapper.talkGoodDown(num_talk);
	}

	@Override
	public int goodListDel(String id, int num_talk) {
		return mapper.goodListDel(id, num_talk);
	}

	@Override
	public List<CampTalkDTO> goodListAll() {
		return mapper.goodListAll();
	}

	@Override
	public int getTotalCampCount(String area, String camp) {
		return mapper.getTotalCampCount(area, camp);
	}
	
}
