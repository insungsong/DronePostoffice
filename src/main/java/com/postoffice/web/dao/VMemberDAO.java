package com.postoffice.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.postoffice.web.dto.VMemberDTO;

@Component
public class VMemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public VMemberDTO selectMember(String lid) {
		VMemberDTO vmember = sqlSessionTemplate.selectOne("vmember.selectVmemberByLid", lid);
		return vmember;
	}

	public int insert(VMemberDTO vmember) {
		int rows = sqlSessionTemplate.insert("vmember.insert", vmember);
		return rows;
	}
	
}
