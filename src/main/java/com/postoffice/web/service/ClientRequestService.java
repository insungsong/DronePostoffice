package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.ClientDAO;
import com.postoffice.web.dto.BoardDTO;
import com.postoffice.web.dto.MailDTO;


@Service
public class ClientRequestService {
	@Autowired
	private ClientDAO clientdao;
	
	
	//총 토탈 게시물 row행만큼 가지고 오기
	public int getTotalRowNo() {
		int totalRowNum = clientdao.selectTotalRowNo();
		return totalRowNum;
	}

	
	public List<BoardDTO> getBoardList(int startRowNo, int endRowNo) {
		List<BoardDTO> ClientboardList = clientdao.selectList(startRowNo,endRowNo);
		
		return ClientboardList;
	}


	public void requestCheck() {
	
		
	}


	public List<BoardDTO> selectAll() {
		List<BoardDTO> boardList=clientdao.selectAll();
		return boardList;
	}
	
	
	/*
	 * public void mailSend(ClientMailDTO clientMailDTO) {
	 * clientdao.mailSend(clientMailDTO); }
	 */
	
}
