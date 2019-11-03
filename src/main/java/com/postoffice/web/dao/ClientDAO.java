package com.postoffice.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.postoffice.web.dto.BoardDTO;
import com.postoffice.web.dto.MailDTO;

@Component
public class ClientDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectTotalRowNo() {
		int totalRowNum = sqlSessionTemplate.selectOne("ClientBoard.selectTotalRowNum");
		return totalRowNum;
	} 
	//게시판 게시물 만들기해야함

	public List<BoardDTO> selectList(int startRowNo, int endRowNo) {
		Map<String,Integer> map = new HashMap<>();
		map.put("startRowNo",startRowNo);
		map.put("endRowNo",endRowNo);
		
		System.out.println("전송");
		List<BoardDTO> ClientboardList=sqlSessionTemplate.selectList("ClientBoard.selectList",map);
		System.out.println("도착");
		
		
		return ClientboardList;
	}



	public List<BoardDTO> selectAll() {
		List<BoardDTO> boardList=sqlSessionTemplate.selectList("board.selectAll");
		return boardList;
	}
	
	public List<MailDTO> selectMailList(int startRowNo, int endRowNo) {
		Map<String,Integer> map = new HashMap<>();
		map.put("startRowNo",startRowNo);
		map.put("endRowNo",endRowNo);
		List<MailDTO> MailboardList=sqlSessionTemplate.selectList("ClientBoard.selectMailList",map);
		
		return MailboardList;
	}

	public int selectnum() {
		int selectNum = sqlSessionTemplate.selectOne("ClientBoard.selectnum");
		return selectNum;
	}

	public int insertMaildto(MailDTO maildto) {
		int insertMaildto = sqlSessionTemplate.insert("ClientBoard.insertBoard",maildto);
		return insertMaildto;
	}
	public int removedto(String mail_id) {
		int removesql = sqlSessionTemplate.delete("ClientBoard.removeRequest",mail_id);
		return removesql;
	}

	public MailDTO selectBoard(int mail_id) {
		MailDTO maildto = sqlSessionTemplate.selectOne("ClientBoard.selectOne",mail_id);
		return maildto;
	}

	public int update(MailDTO board) {
		int rows=sqlSessionTemplate.update("ClientBoard.updateOne",board);
		return rows;
	}

	public List<MailDTO> fromSearch(String searchType, String keyword,int startRowNo, int endRowNo) {
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("searchType",searchType );
		map.put("keyword", keyword);
		map.put("startRowNo",startRowNo);
		map.put("endRowNo",endRowNo);
		
		//
		if(searchType.equals("from_name")) {
			List<MailDTO> listdto = sqlSessionTemplate.selectList("ClientBoard.selectsearch", map);
			return listdto;
		}
		
		List<MailDTO> listdto = sqlSessionTemplate.selectList("ClientBoard.toselectsearch", map);
		return listdto;
	}

}
