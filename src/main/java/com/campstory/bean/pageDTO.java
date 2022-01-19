package com.campstory.bean;

import lombok.Data;

@Data
public class pageDTO {
	
	private Integer pageNum;
	private int pageCurrent, pageStart, pageEnd;
	private int pageSize, pageCount, totalCount, pageBlock;
	private int rowStart, rowEnd;
}
