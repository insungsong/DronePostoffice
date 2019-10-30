package com.postoffice.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StateDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void select() {
		sqlSessionTemplate.selectOne("");
	}

}
