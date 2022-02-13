package com.campstory.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.campstory.bean.pageDTO;
import com.campstory.service.CampServiceTalk;

@Component
public class Page {

	@Autowired
	private CampServiceTalk service;

	public pageDTO talkPage(Integer pageNum, int rowSize, String area) {
		pageDTO dto = new pageDTO();

		dto.setTotalCount(service.getTotalCount(area));
		page(dto, pageNum, rowSize);

		return dto;
	}
	
	public pageDTO talkMyListPage(Integer pageNum, int rowSize, String id) {
		pageDTO dto = new pageDTO();

		dto.setTotalCount(service.getMyTalkCount(id));
		page(dto, pageNum, rowSize);

		return dto;
	}

	public pageDTO talkMyGoodPage(Integer pageNum, int rowSize, String id) {
		pageDTO dto = new pageDTO();

		dto.setTotalCount(service.getMyGoodCount(id));
		page(dto, pageNum, rowSize);

		return dto;
	}
	
	public pageDTO talkCampSearchPage(Integer pageNum, int rowSize, String area, String camp) {
		pageDTO dto = new pageDTO();
		
		dto.setTotalCount(service.getCampSearchCount(area, camp));
		page(dto, pageNum, rowSize);
		
		return dto;
	}
	
	public pageDTO talkWriteCampSearchPage(Integer pageNum, int rowSize, String area, String camp) {
		pageDTO dto = new pageDTO();
		
		dto.setTotalCount(service.campInfoSearchCount(area, camp));
		page(dto, pageNum, rowSize);
		
		return dto;
	}
	

	public pageDTO page(pageDTO dto, Integer pageNum, int rowSize) {
		dto.setPageNum(pageNum);
		dto.setPageSize(rowSize);

		dto.setPageCurrent(dto.getPageNum());
		dto.setRowStart((dto.getPageCurrent() - 1) * dto.getPageSize() + 1);
		dto.setRowEnd(dto.getPageCurrent() * dto.getPageSize());

		dto.setPageCount(
				dto.getTotalCount() / dto.getPageSize() + (dto.getTotalCount() % dto.getPageSize() == 0 ? 0 : 1));
		dto.setPageStart((int) ((dto.getPageCurrent() - 1) / 10) * 10 + 1);
		dto.setPageBlock(10);
		dto.setPageEnd(dto.getPageStart() + dto.getPageBlock() - 1);
		if (dto.getPageEnd() > dto.getPageCount()) {
			dto.setPageEnd(dto.getPageCount());
		}

		return dto;
	}

}
