package com.postoffice.web.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.postoffice.web.dto.StateDTO;

@Repository
public class StateDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public StateDTO stateCheck(String state_id) {
		StateDTO state=sqlSessionTemplate.selectOne("state.stateCheck",state_id);
		System.out.println("ㄷㅇㅇ");
		return state;
	}

	


}
