package com.campstory.mybatis;

import java.util.List;

import com.campstory.bean.CampDTO;
import com.campstory.bean.MemberDTO;

public interface MemberMapper {
	
	public int input(MemberDTO memberDTO);
	
	public int input_kakao(MemberDTO memberDTO);

	public int loginCheck(MemberDTO memberDTO);
	
	public int adminCheck(MemberDTO memberDTO);
	
	public int idCheck(String id);
	
	public int delCheck(String id);
	
	public int delete(String id);
	
	public MemberDTO userInfo(String id);
	
	public int update(MemberDTO memberDTO);
	
	public List<CampDTO> getLikeList(String id);
	
	public CampDTO getLikeInfo(String contentid);
	
	public List<MemberDTO> getFavList(String id);
	
	public CampDTO getFavInfo(String contentid);
}
