package com.campstory.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.campstory.command.CustomSpringConfigurator;
import com.campstory.service.ChatService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

// WebSocket 호스트 설정
@Slf4j
@Log4j
@ServerEndpoint(value = "/broadsocket", configurator = CustomSpringConfigurator.class)
@Component
public class BroadSocket {

	@Autowired
	private ChatService service;
	
	
	// 접속 된 클라이언트 WebSocket session 관리 리스트
	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
	// 메시지에서 유저 명을 취득하기 위한 정규식 표현
	private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");

	// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen(Session userSession) {
		// 클라이언트가 접속하면 WebSocket세션을 리스트에 저장한다.
		sessionUsers.add(userSession);
		// 콘솔에 접속 로그를 출력한다.
		System.out.println("client is now connected...");
		List list = service.getChat();
		for(int i = 0 ;i<list.size();i++) {
			Map m = (Map)list.get(i);
			try {
				userSession.getBasicRemote().sendText(m.get("USERNAME") + " => " + m.get("MSG"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// WebSocket으로 메시지가 오면 요청되는 함수
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		// 메시지 내용을 콘솔에 출력한다.
		System.out.println(message);
		// 초기 유저 명
		String name = "anonymous";
		// 메시지로 유저 명을 추출한다.
		Matcher matcher = pattern.matcher(message);
		// 메시지 예: {{유저명}}메시지
		if (matcher.find()) {
			name = matcher.group();
		}
		// 클로져를 위해 변수의 상수화
		final String msg = message.replaceAll(pattern.pattern(), "");
		final String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
		if(!msg.equals("welcom")) {
			if(service.getCountChat() >= 20) {
				service.delChat();
			}
			service.insert(username, msg);
		}
		// session관리 리스트에서 Session을 취득한다.
		sessionUsers.forEach(session -> {
			if (session == userSession) {
				return;
			}
			try 
			{
				if(!msg.equals("welcom")) {
					// 리스트에 있는 모든 세션(메시지 보낸 유저 제외)에 메시지를 보낸다. (형식: 유저명 => 메시지)
					session.getBasicRemote().sendText(username + " => " + msg);
				}else {
				}
			} catch (IOException e) {
				// 에러가 발생하면 콘솔에 표시한다.
				e.printStackTrace();
			}
		});
	}

	// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose(Session userSession) {
		// session 리스트로 접속 끊은 세션을 제거한다.
		sessionUsers.remove(userSession);
		// 콘솔에 접속 끊김 로그를 출력한다.
		System.out.println("client is now disconnected...");
	}

}
