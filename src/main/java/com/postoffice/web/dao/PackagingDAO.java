package com.postoffice.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.postoffice.web.dto.MailDTO;

@Repository
public class PackagingDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<MailDTO> mailList(){
		return sqlSessionTemplate.selectList("packaging.selectMailList");
	}
}
