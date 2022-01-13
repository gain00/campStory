package com.campstory.service;

import com.campstory.bean.MemberDTO;

public interface MemberService {

	public int memberInsert(MemberDTO memberDTO);
	
	public int memberInsert_kakao(MemberDTO memberDTO);
	
	public int memberLoginCheck(MemberDTO memberDTO);
	
	public int memberIdCheck(String id);
	
	public int memberDelCheck(String id);
	
	public int memberDelete(String id);
	
	public MemberDTO memberUserInfo(String id);
	
	public int memberUpdate(MemberDTO memberDTO);
}
