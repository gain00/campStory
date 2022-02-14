package com.campstory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campstory.mybatis.ChatMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Service
public class ChatServiceImpl implements ChatService {
	
	@Setter(onMethod_=@Autowired)
	private ChatMapper mapper;
	
	@Override
	public int insert(String username, String msg) {
		return mapper.insert(username, msg);
	}
	
	@Override
	public List getChat() {
		return mapper.getChat();
	}

	@Override
	public int delChat() {
		return mapper.delChat();
	}

	@Override
	public int getCountChat() {
		return mapper.getCountChat();
	}


	
}
