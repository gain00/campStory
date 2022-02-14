package com.campstory.bean;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	private int num_tip;
	private int cno;
	private String content;
	private String writer;
	private Date regdate;
}
