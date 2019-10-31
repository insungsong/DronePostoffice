package com.postoffice.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientCheckDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List selectAll(String state_id) {
		return sqlSessionTemplate.selectList("board.selectAll",state_id);
	}
}
