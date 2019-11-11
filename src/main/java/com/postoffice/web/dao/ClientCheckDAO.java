package com.postoffice.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.postoffice.web.dto.MailDTO;

@Repository
public class ClientCheckDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List selectAll(String vid) {
		return sqlSessionTemplate.selectList("board.selectAll",vid);
	}
	
	public int updateStateProc(MailDTO mailDTO) {
		return sqlSessionTemplate.update("board.updateStateProc", mailDTO);
	}
}
