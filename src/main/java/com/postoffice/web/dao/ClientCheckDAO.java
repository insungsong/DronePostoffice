package com.postoffice.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.dto.PackageDTO;
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
	
	public List beforeSelectAll() {
		return sqlSessionTemplate.selectList("board.beforeSelectAll");
	}

	public List packageSelect() {
		return sqlSessionTemplate.selectList("board.packageCheck");
		
	}

	public int cancel(int package_id) {
		return sqlSessionTemplate.delete("board.cancel",package_id);
	}
}

