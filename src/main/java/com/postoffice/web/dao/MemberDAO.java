package com.postoffice.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.postoffice.web.dto.MemberDTO;

@Component
public class MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDTO selectMember(String lid) {
		MemberDTO member = sqlSessionTemplate.selectOne("member.selectMemberByLid", lid);
		return member;
	}
	
	
}
