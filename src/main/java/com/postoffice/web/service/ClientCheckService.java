package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.ClientCheckDAO;
import com.postoffice.web.dao.StateDAO;
import com.postoffice.web.dto.StateDTO;

@Service
public class ClientCheckService {
	
	@Autowired
	private ClientCheckDAO checkDAO;
	@Autowired
	private StateDAO stateDAO;
	
	public List selectAll() {
		return checkDAO.selectAll();
	}

	public StateDTO stateCheck(String state_id) {
		System.out.println("ㅅㅂㅅ");
		StateDTO state= stateDAO.stateCheck(state_id);
		return state;
	}
	
	
}
