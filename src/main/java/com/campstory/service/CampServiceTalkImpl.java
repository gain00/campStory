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
	public List<CampTalkDTO> getTalkList(String area) {
		return mapper.getTalkList(area);
	}

	@Override
	public int talkWrite(CampTalkDTO dto) {
		return mapper.talkWrite(dto);
	}

	@Override
	public List<String> searchList(String facltnm, String area) {
		return mapper.searchList(facltnm, area);
	}
	
}
