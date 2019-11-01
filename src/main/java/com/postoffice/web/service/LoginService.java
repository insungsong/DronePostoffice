package com.postoffice.web.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.postoffice.web.dao.MemberDAO;
import com.postoffice.web.dao.VMemberDAO;
import com.postoffice.web.dto.MemberDTO;
import com.postoffice.web.dto.VMemberDTO;

@Component
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private VMemberDAO vmemberDao;
	
	public LoginResult mLogin(String lid, String lpassword) {
		MemberDTO member = memberDao.selectMember(lid);
		if(member == null) {
			return LoginResult.FAIL_LID;
		} else {
			if(lpassword.equals(member.getMpassword())) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_LPASSWORD;
			}
		}
	}

	public LoginResult cLogin(String lid, String lpassword) {
		VMemberDTO vmember = vmemberDao.selectMember(lid);
		if(vmember == null) {
			return LoginResult.FAIL_LID;
		} else {
			if(lpassword.equals(vmember.getVmpassword())) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_LPASSWORD;
			}
		}
	}

	public boolean mLidCheck(String lid) {
		MemberDTO member = memberDao.selectMember(lid);
		if(member == null) {
			return true;
		} else {
			return false;
		}	
	}

	public boolean cLidCheck(String lid) {
		VMemberDTO vmember = vmemberDao.selectMember(lid);
		if(vmember == null) {
			return true;
		} else {
			return false;
		}	
	}

	public void mJoin(MemberDTO member) {
		memberDao.insert(member);
	}

	public void cJoin(VMemberDTO vmember) {
		vmemberDao.insert(vmember);
	}

		
	
}
