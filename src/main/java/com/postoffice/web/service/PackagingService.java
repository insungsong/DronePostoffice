package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.PackagingDAO;
import com.postoffice.web.dto.MailDTO;

@Service
public class PackagingService {

	@Autowired
	PackagingDAO dao;
	
	public List<MailDTO> mailList(){
		return dao.mailList();
	}
}
