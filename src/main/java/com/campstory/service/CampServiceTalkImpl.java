package com.campstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int getTotalCount(String area) {
		return mapper.getTotalCount(area);
	}

	@Override
	public List<CampTalkDTO> getMyTalkList(String area, String id, int rowStart, int rowEnd) {
		return mapper.getMyTalkList(area, id, rowStart, rowEnd);
	}

	@Override
	public int getMyTalkCount(String id) {
		return mapper.getMyTalkCount(id);
	}
	
	@Override
	public List<CampTalkDTO> getMyGoodList(String area, String id, int rowStart, int rowEnd) {
		return mapper.getMyGoodList(area, id, rowStart, rowEnd);
	}
	
	@Override
	public int getMyGoodCount(String id) {
		return mapper.getMyGoodCount(id);
	}
	
	@Override
	public List<CampTalkDTO> getCampSearch(String camp, String area, int rowStart, int rowEnd) {
		return mapper.getCampSearch(area, camp, rowStart, rowEnd);
	}
	
	@Override
	public int getCampSearchCount(String area, String camp) {
		return mapper.getCampSearchCount(area, camp);
	}

	@Override
	public List<CampTalkDTO> campInfoSearch(String camp, String area, int rowStart, int rowEnd) {
		return mapper.campInfoSearch(camp, area, rowStart, rowEnd);
	}
	
	@Override
	public int campInfoSearchCount(String area, String camp) {
		return mapper.campInfoSearchCount(area, camp);
	}
	
	/* @Transactional(transactionManager="transacitonManager") */
	@Override
	public int talkGoodUp(String id, int num_talk) {
		mapper.talkGoodUp(num_talk);
		mapper.goodListInput(id, num_talk);
		return 1;
	}
	
	/* @Transactional(transactionManager="transacitonManager") */
	@Override
	public int talkGoodDown(String id, int num_talk) {
		mapper.talkGoodDown(num_talk);
		mapper.goodListDel(id, num_talk);
		return 1;
	}
	
	@Override
	public List<CampTalkDTO> goodListAll() {
		return mapper.goodListAll();
	}
	
	@Override
	public int talkWrite(CampTalkDTO dto) {
		return mapper.talkWrite(dto);
	}

	@Override
	public CampTalkDTO getTalk(int num_talk) {
		return mapper.getTalk(num_talk);
	}

	@Override
	public int talkUpdate(CampTalkDTO dto) {
		return mapper.talkUpdate(dto);
	}

	@Override
	public int talkDelete(int num_talk) {
		return mapper.talkDelete(num_talk);
	}

	@Override
	public int talkWriteQnA(CampTalkDTO dto) {
		return mapper.talkWriteQnA(dto);
	}

	@Override
	public List<CampTalkDTO> getTalkQnA(int num_talk) {
		return mapper.getTalkQnA(num_talk);
	}

	@Override
	public int qnaDel(int num_talkqna) {
		return mapper.qnaDel(num_talkqna);
	}

	@Override
	public int inputNotify(int num_tlak, String sid) {
		return mapper.inputNotify(num_tlak, sid);
	}

	@Override
	public int getNotify(int num_tlak, String sid) {
		return mapper.getNotify(num_tlak, sid);
	}

	@Override
	public List<CampTalkDTO> getNotifyList(String check, int count) {
		return mapper.getNotifyList(check, count);
	}

	@Override
	public int aa(String date) {
		return mapper.aa(date);
	}

	@Override
	public int setNotify(int num_talk) {
		return mapper.setNotify(num_talk);
	}
	
}
