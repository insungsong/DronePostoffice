package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.ClientCheckDAO;


@Service
public class ClientCheckService {
	
	@Autowired
	private ClientCheckDAO checkDAO;

	
	public List selectAll() {
		return checkDAO.selectAll();
	}



	
}
