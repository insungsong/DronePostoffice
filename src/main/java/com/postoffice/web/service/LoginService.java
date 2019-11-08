package com.postoffice.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

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

	public String getDeptName(String lid) {
		String dept_name = memberDao.selectDeptName(lid);
		return dept_name;
	}

	public String getVname(String lid) {
		String vname = vmemberDao.selectVname(lid);
		return vname;
	}

	public String vmnrequest(String lid) {
		String vmname = vmemberDao.selectvmnSelect(lid);
		return vmname;
	}

	public List<VMemberDTO> vmemberList(String lid) {
		List<VMemberDTO> vmemberList = vmemberDao.selectvmemberList(lid);
		return vmemberList;
	}

	public int vmemAfter(VMemberDTO vmdto) {
		int vlist = vmemberDao.selectvmList(vmdto);
		return vlist;
	}

	public String vmnlid(String lid) {
		String vmn = vmemberDao.selectvmlid(lid);
		return vmn;
	}
	
	//파일 업로드
	public void chaneFile(VMemberDTO vmdto,String saveFileName) {
		System.out.println("service!!!)))))))))))))))))))))))))))");
		vmemberDao.updateFile(vmdto,saveFileName);
		
	}
	
	//사진 가져오기
	public List<VMemberDTO> vmphotofind(String vmlid) {
		List<VMemberDTO> vmphotofind = vmemberDao.selectphoto(vmlid);
		System.out.println(vmphotofind);
		return vmphotofind;
	}	
	
}
