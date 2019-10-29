package com.postoffice.web.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.postoffice.web.dao.LoginDAO;
import com.postoffice.web.dto.MemberDTO;

@Component
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired
	private LoginDAO loginDao;
	
	public LoginResult login(String mid, String mpassword) {
		MemberDTO member = loginDao.selectMember(mid);
		if(member == null) {
			return LoginResult.FAIL_MID;
		} else {
			if(mpassword.equals(member.getMpassword())) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_MPASSWORD;
			}
		}
	}
	
	
}
