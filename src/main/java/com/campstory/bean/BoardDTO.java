package com.campstory.bean;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO{
	private int num_tip; 
    private String title;
    private String image;
    private String content;
    private Date reg_time;
    private String writer;
    private int good;
    private int readcount;
    
}