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
		dto.setPageNum(pageNum);
		dto.setPageSize(rowSize);
		
		dto.setPageCurrent(dto.getPageNum());
		dto.setRowStart((dto.getPageCurrent()-1)*dto.getPageSize()+1);
		dto.setRowEnd(dto.getPageCurrent()*dto.getPageSize());
		dto.setTotalCount(service.getTotalCount(area));
		dto.setPageCount(dto.getTotalCount() / dto.getPageSize() + ( dto.getTotalCount() % dto.getPageSize() == 0 ? 0 : 1) );
		dto.setPageStart( (int)((dto.getPageCurrent()-1)/10)*10+1);
		dto.setPageBlock(10);
		dto.setPageEnd(dto.getPageStart() + dto.getPageBlock()-1);
		if(dto.getPageEnd() > dto.getPageCount()){
			dto.setPageEnd(dto.getPageCount());
		}
		
		return dto;
	}
	
	public pageDTO talkCampSearchPage(Integer pageNum, int rowSize, String area, String camp) {
		pageDTO dto = new pageDTO();
		dto.setPageNum(pageNum);
		dto.setPageSize(rowSize);
		
		dto.setPageCurrent(dto.getPageNum());
		dto.setRowStart((dto.getPageCurrent()-1)*dto.getPageSize()+1);
		dto.setRowEnd(dto.getPageCurrent()*dto.getPageSize());
		dto.setTotalCount(service.getTotalCampCount(area, camp));
		dto.setPageCount(dto.getTotalCount() / dto.getPageSize() + ( dto.getTotalCount() % dto.getPageSize() == 0 ? 0 : 1) );
		dto.setPageStart( (int)((dto.getPageCurrent()-1)/10)*10+1);
		dto.setPageBlock(10);
		dto.setPageEnd(dto.getPageStart() + dto.getPageBlock()-1);
		if(dto.getPageEnd() > dto.getPageCount()){
			dto.setPageEnd(dto.getPageCount());
		}
		
		return dto;
	}
}
