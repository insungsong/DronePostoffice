package com.postoffice.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.service.LoginService;

@Repository
public class ClientCheckDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	public List selectAll( ) {
		
		return sqlSessionTemplate.selectList("board.selectAll");
	}
	
	public int updateStateProc(MailDTO mailDTO) {
		return sqlSessionTemplate.update("board.updateStateProc", mailDTO);
	}
}
