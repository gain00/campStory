package com.campstory.service;

import java.util.List;

import com.campstory.bean.CampDTO;
import com.campstory.bean.MemberDTO;

public interface MemberService {

	public int memberInsert(MemberDTO memberDTO);
	
	public int memberInsert_kakao(MemberDTO memberDTO);
	
	public int memberLoginCheck(MemberDTO memberDTO);
	
	public int memberAdminCheck(MemberDTO memberDTO);
	
	public int memberIdCheck(String id);
	
	public int memberWarnCheck(String id);
	
	public int memberBandateCheck(String id);
	
	public int memberDelCheck(String id);
	
	public int memberDelete(String id);
	
	public int memberDelete_kakao(String id);
	
	public MemberDTO memberUserInfo(String id);
	
	public int memberUpdate(MemberDTO memberDTO);
	
	public List<CampDTO> memberLikeList(String id);
	
	public CampDTO memberLikeInfo(String contentid);
	
	public List<MemberDTO> memberFavList(String id);
	
	public CampDTO memberFavInfo(String contentid);
	
	//관리자 기능
	public int memberAllCount();
	
	public List<MemberDTO> memberAdminList(int start, int end);
	
	public int memberStatus(MemberDTO memberDTO);
	
	public int memberBan(MemberDTO memberDTO);
	
}
