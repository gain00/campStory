package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	@DateTimeFormat (pattern ="yyyy-MM-dd")
	private Date birth;
	private Date regdate;
	private String img;
}
