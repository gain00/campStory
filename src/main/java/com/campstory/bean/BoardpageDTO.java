package com.campstory.bean;

import java.util.Date;

import lombok.Data;

@Data
public class BoardpageDTO extends BoardDTO {
	private int num_tip; 
    private String youtube;
    private String content;
}