package com.campstory.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campstory.bean.MemberDTO;
import com.campstory.mybatis.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;

	@Override
	public int memberInsert(MemberDTO memberDTO) {
		return mapper.input(memberDTO);
	}
	
	@Override
	public int memberInsert_kakao(MemberDTO memberDTO) {
		return mapper.input_kakao(memberDTO);
	}

	@Override
	public int memberLoginCheck(MemberDTO memberDTO) {
		return mapper.loginCheck(memberDTO);
	}
	
	@Override
	public int memberAdminCheck(MemberDTO memberDTO) {
		return mapper.adminCheck(memberDTO);
	}
	
	@Override
	public int memberIdCheck(String id) {
		return mapper.idCheck(id);
	}

	@Override
	public int memberDelCheck(String id) {
		return mapper.delCheck(id);
	}

	@Override
	public int memberDelete(String id) {
		return mapper.delete(id);
	}

	@Override
	public MemberDTO memberUserInfo(String id) {
		return mapper.userInfo(id);
	}

	@Override
	public int memberUpdate(MemberDTO memberDTO) {
		return mapper.update(memberDTO);
	}

}
