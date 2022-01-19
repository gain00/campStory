package com.campstory.command;

import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Component
public class AreaChange {

	public String change(String area) {
		String areaChange="";
		if(area==null || area.equals("all")) {
			areaChange="";
		} else if(area.equals("Seoul")) {
			areaChange= "서울시";
		} else if(area.equals("Gyeonggi")) {
			areaChange= "경기도";
		} else if(area.equals("Incheon")) {
			areaChange= "인천시";
		} else if(area.equals("Gangwon")) {
			areaChange= "강원도";
		} else if(area.equals("Chungcheongnam")) {
			areaChange= "충청남도";
		} else if(area.equals("Daejeon")) {
			areaChange= "대전시";
		} else if(area.equals("Chungbuk")) {
			areaChange= "충청북도";
		} else if(area.equals("Sejong")) {
			areaChange= "세종시";
		} else if(area.equals("Busan")) {
			areaChange= "부산시";
		} else if(area.equals("Ulsan")) {
			areaChange= "울산시";
		} else if(area.equals("Deagu")) {
			areaChange= "대구시";
		} else if(area.equals("Gyeongbuk")) {
			areaChange= "경상북도";
		} else if(area.equals("Gyeongsangnam")) {
			areaChange= "경상남도";
		} else if(area.equals("Jeonnam")) {
			areaChange= "전라남도";
		} else if(area.equals("Gwangju")) {
			areaChange= "광주시";
		} else if(area.equals("Jeonbuk")) {
			areaChange= "전라북도";
		} else if(area.equals("Jeju")) {
				areaChange= "제주시";
		}
		return areaChange;
	}
	
	
	
}
