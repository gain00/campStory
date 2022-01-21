package com.campstory.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.campstory.bean.CampDTO;
import com.campstory.service.CampService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;


// RestAPI 데이터를 DB에 입력하였으므로 미사용 


//@Slf4j
//@Log4j
//@RestController
//@RequestMapping("/camp")
/*
public class ApiController {
	@Autowired
	private CampService service;
	
	@GetMapping("/list")
	public String api( String[] args, Model model,CampDTO dto){
    	StringBuffer result = new StringBuffer();
    	try {
        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
     //   urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=z1YDyD%2FOYBRBVV8Gn62JLD9GmpYJirV1G5qt3ujXkz6gGjZpZ1iGhKyuHPJo0Ol%2BzqCyxEt45UPmy24%2FUyhjbQ%3D%3D"); /*Service Key*/
     //   urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지번호*/
     //   urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
     //   urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
     //   urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
     //   URL url = new URL(urlBuilder.toString());
     //   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
     //   conn.setRequestMethod("GET");
     //   conn.setRequestProperty("Content-type", "application/json");
     //   System.out.println("Response code: " + conn.getResponseCode());
     //   BufferedReader rd;
     //  if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
     //       rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
     //   } else {
     //       rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
     //   }
        
      //  String line;
      //  while ((line = rd.readLine()) != null) {
      //      result.append(line + "\n");
      //  }
      //  rd.close();
      //  conn.disconnect();
        
        //1. 문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성.
      //  JSONParser parser = new JSONParser();
        // 2. 문자열을 JSON 형태로 JSONObject 객체에 저장. 	
     //   JSONObject obj = (JSONObject)parser.parse(result.toString());
        // 3. 필요한 리스트 데이터 부분만 가져와 JSONArray로 저장.
     //   JSONArray dataArr = (JSONArray) obj.get("data");
        // 4. model에 담아준다.
     //   model.addAttribute("data",dataArr); 
    //	}catch (Exception e) {
    //		e.printStackTrace();
    //	}	
       
        
        
        //return result + "/camp/list";
 //   }
//}


