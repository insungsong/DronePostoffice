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


	public List<BoardDTO> selectAll() {
		List<BoardDTO> boardList=clientdao.selectAll();
		return boardList;
	}
	
	public List<MailDTO> selectMailList(int startRowNo, int endRowNo){
		List<MailDTO> ClientboardList = clientdao.selectMailList(startRowNo,endRowNo);
		return ClientboardList;
	}


	public int getnum() {
		int mailMap = clientdao.selectnum();
		return mailMap;
	}

	public int requestWrite(MailDTO maildto) {
		int mailDto = clientdao.insertMaildto(maildto);
		return mailDto;
	}


	public int requestRemove(String mail_id) {
		int requestRemove = clientdao.removedto(mail_id);
		return requestRemove;
	}

	
	//게시판 글 수정하기
	public MailDTO getBoard(int mail_id) {
		MailDTO board = clientdao.selectBoard(mail_id);
		return board;
	}


	//게시글 작성한것 수정한 정보 보내기
	public void update(MailDTO board) {
		clientdao.update(board);
	}


	public List<MailDTO> fromsearch(String from_name, String to_name, String keyword) {

		List<MailDTO> listdto = clientdao.fromSearch(from_name,to_name,keyword);
		
		return listdto;
	}



}
