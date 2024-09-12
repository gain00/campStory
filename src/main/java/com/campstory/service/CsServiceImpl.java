package com.campstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campstory.bean.CsDTO;
import com.campstory.mybatis.CsMapper;

import lombok.Setter;

@Service
public class CsServiceImpl implements CsService {
	
	@Setter(onMethod_=@Autowired)
	private CsMapper mapper;

	@Override
	public int qnaInsert(CsDTO csDTO) {
		return mapper.insertArticle(csDTO);
	}

	@Override
	public int qnaAllCount() {
		return mapper.getArticleCount();
	}
	
	@Override
	public int qnaAllCount_col(CsDTO csDTO) {
		return mapper.getArticleCount_col(csDTO);
	}
	
	@Override
	public int qnaCateCount(String cate) {
		return mapper.getCateCount(cate);
	}

	@Override
	public int qnaCateCount_col(CsDTO csDTO) {
		return mapper.getCateCount_col(csDTO);
	}
	
	@Override
	public List<CsDTO> csList(int start, int end) {
		return mapper.getArticles(start, end);
	}
	
	@Override
	public List<CsDTO> csList_col(CsDTO csDTO) {
		return mapper.getArticles_col(csDTO);
	}

	@Override
	public List<CsDTO> cateList(CsDTO csDTO) {
		return mapper.getCate(csDTO);
	}

	@Override
	public List<CsDTO> cateList_col(CsDTO csDTO) {
		return mapper.getCate_col(csDTO);
	}
	
	@Override
	public CsDTO csGetupdate(int num) {
		return mapper.getUpdate(num);
	}
	
	@Override
	public int csUpdate(CsDTO csDTO) {
		return mapper.updateArticle(csDTO);
	}

	@Override
	public int csUpdateAdmin(CsDTO csDTO) {
		return mapper.updateArticleAdmin(csDTO);
	}
	
	@Override
	public int csDelete(int num) {
		return mapper.deleteArticle(num);
	}

	//notice
	@Override
	public int noticeInsert(CsDTO csDTO) {
		return mapper.insertNotice(csDTO);
	}
	
	@Override
	public int noticeAllCount() {
		return mapper.getNoticeCount();
	}

	@Override
	public List<CsDTO> noticeList(int start, int end) {
		return mapper.getNotice(start, end);
	}

	@Override
	public int noticeDelete(int num) {
		return mapper.deleteNotice(num);
	}

}
