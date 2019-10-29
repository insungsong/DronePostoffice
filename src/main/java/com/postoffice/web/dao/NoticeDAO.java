package com.postoffice.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.postoffice.web.dto.DeptDTO;
import com.postoffice.web.dto.MemberDTO;
import com.postoffice.web.dto.NoticeDTO;

@Component
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectTotalRowNum() {
		int totalRowNum = sqlSessionTemplate.selectOne("notice.selectTotalRowNum");
		
		return totalRowNum;
	}

	public List<NoticeDTO> selectList(int startRowNum, int endRowNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		
		for(String str : map.keySet()) {
			
			System.out.println("시작"+map.get("startRowNum"));
			System.out.println("끝"+map.get("endRowNum"));
		}
		
		List<NoticeDTO> list = sqlSessionTemplate.selectList("notice.noticeList", map);
		
		for(int i = 0; i <list.size(); i++) {
			NoticeDTO dto = list.get(i);
			
			System.out.println(dto.getNotice_id());
			System.out.println(dto.getNotice_title());
			System.out.println(dto.getNotice_content());
			System.out.println(dto.getMid());
			System.out.println(dto.getMemberList().size());
			for(int j = 0; j < dto.getMemberList().size(); j++) {
				MemberDTO memberDto = dto.getMemberList().get(i);
				System.out.println(memberDto.getMid());
				System.out.println(memberDto.getMname());
				System.out.println(memberDto.getMpassword());
			}
			System.out.println(dto.getMemberList());
		}
		
		MemberDTO dto = new MemberDTO();
		System.out.println(dto.getMname());
		return sqlSessionTemplate.selectList("notice.noticeList", map);
	}

	public int noticeinsert(NoticeDTO noticeDTO) {
		int rows = sqlSessionTemplate.insert("notice.noticeinsert", noticeDTO);
		return rows;
	}

	public NoticeDTO selectNotice(int notice_id) {
		NoticeDTO noticeDTO = sqlSessionTemplate.selectOne("notice.selectNotice", notice_id);
		return noticeDTO;
	}
	
}
