package com.campstory.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CampTalkDTO {
	
	private int num_talk, contentid, good, num_talkqna, cnt;
	private String facltnm, donm, firstimageurl, writer, goodcheck , ano, sub, notifycheck;
	private double mapx,mapy;
	
	
	private String area, areaKor, areaEng, camp, content;
	private String addr1;
	
	@DateTimeFormat(pattern = "yy-MM-dd")
	private Date reg_time; 
}
