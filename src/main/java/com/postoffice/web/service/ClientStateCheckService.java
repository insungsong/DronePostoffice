package com.postoffice.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.StateDAO;
import com.postoffice.web.dto.StateDTO;

@Service
public class ClientStateCheckService {
	@Autowired
	private StateDAO stateDAO;
	
	public StateDTO stateCheck(String state_id) {
		StateDTO stateDTO=stateDAO.stateCheck(state_id);
		return stateDTO;
		
		
	}
	
}
