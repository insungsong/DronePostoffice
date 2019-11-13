package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.ClientCheckDAO;
import com.postoffice.web.dto.MailDTO;


@Service
public class ClientCheckService {
	
	@Autowired
	private ClientCheckDAO checkDAO;

	
	public List selectAll( ) {
		return checkDAO.selectAll();
	}

	public int updateStateProc(MailDTO mailDTO) {
		return checkDAO.updateStateProc(mailDTO);
	}

	
}
