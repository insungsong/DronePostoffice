package com.postoffice.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.postoffice.web.dto.MailDTO;

@Component
public class ClientDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("clientMailDTO.selectTotalRowNum");
		return totalRowNum;
	} 
	//게시판 게시물 만들기해야함

	public List<MailDTO> selectList(int startRowNo, int endRowNo) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startRowNo",startRowNo);
		map.put("endRowNo",endRowNo);
		List<MailDTO> ClientboardList=sqlSessionTemplate.selectList("ClientboardList.selectList",map);
		return ClientboardList;
	}
	
//	public int mailSend() {
////		ClientMailDTO clientMailDTO = sqlSessionTemplate.insert("clientMailDTO.insert", clientMailDTO);
//	}
	
}
