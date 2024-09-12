package com.campstory.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberDTO {

	private String id;
	private String pw;
	private String phone;
	private String email;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private int warn;
	private String location;
	private Date reg_date;
	private String status;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ban_date;
	private String reason;
	
	private int num_favorite;
	private String camp;
	private String link;
}
