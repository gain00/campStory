package com.campstory.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CsDTO {

	private int start;
	private int end;
	
	private String colum;
	private String search;
	
	private int num_question;
	private String title;
	private String content;
	private Date reg_time;
	private String category;
	private String writer;
	private String re_comment;
	private int secret;
	
	private int num_notice;
}
