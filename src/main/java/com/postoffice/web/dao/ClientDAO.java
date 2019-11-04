package com.postoffice.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.postoffice.web.dto.BoardDTO;
import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.dto.StateDTO;

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
		
		for(int i = 0; i <MailboardList.size(); i++) {
			MailDTO dto = MailboardList.get(i);
			
			System.out.println("id : " + dto.getMail_id());
			System.out.println("title : " + dto.getFrom_name());
			System.out.println("content : " + dto.getFrom_address());
			System.out.println("mid : " + dto.getMail_weight());
			System.out.println("size : " + dto.getTo_address());
			
			StateDTO statedto = dto.getStateList().get(0);
			
			System.out.println("state상태: "+statedto.getState_name());
		}
		
		
		return MailboardList;
	}

	public int selectnum() {
		int selectNum = sqlSessionTemplate.selectOne("ClientBoard.selectnum");
		return selectNum;
	}
	public MailDTO getstatejoin() {
		MailDTO listdto = sqlSessionTemplate.selectOne("ClientBoard.getstatename");
		return listdto;
	}
	public MailDTO getvillagejoin() {
		MailDTO listdto = sqlSessionTemplate.selectOne("ClientBoard.getvillagename");
		return listdto;
	}

	public int insertMaildto() {
		int insertMaildto = sqlSessionTemplate.insert("ClientBoard.insertBoard");
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

		if(searchType.equals("from_name")) {
			List<MailDTO> listdto = sqlSessionTemplate.selectList("ClientBoard.selectsearch", map);
			return listdto;
		}
		
		List<MailDTO> listdto = sqlSessionTemplate.selectList("ClientBoard.toselectsearch", map);
		return listdto;
	}


	public int requestwrite(MailDTO maildto) {
		int maildto2 = sqlSessionTemplate.insert("ClientBoard.answerdto",maildto);
		return maildto2;
	}

	public String requestvname(String vmid) {
		String vname = sqlSessionTemplate.selectOne("vmember.selectvname",vmid);
		return vname;
	}

	

	
}
