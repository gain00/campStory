package com.campstory.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campstory.mybatis.CampMapper;

import lombok.Setter;

@Service
public class CampServiceImpl implements CampService {
	
	@Setter(onMethod_=@Autowired)
	private CampMapper mapper;

}
