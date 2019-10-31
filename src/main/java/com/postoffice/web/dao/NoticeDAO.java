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
		
		
		List<NoticeDTO> list = sqlSessionTemplate.selectList("notice.noticeList", map);
		
		//join 테스트
		for(int i = 0; i <list.size(); i++) {
			NoticeDTO dto = list.get(i);
			
			System.out.println("id : " + dto.getNotice_id());
			System.out.println("title : " + dto.getNotice_title());
			System.out.println("content : " + dto.getNotice_content());
			System.out.println("mid : " + dto.getMid());
			System.out.println("size : " + dto.getMemberList().size());
			
			MemberDTO memberDto = dto.getMemberList().get(0);
			System.out.println("dept_id : " + memberDto.getDept_id());
			System.out.println("membername : " + memberDto.getMname());
			
			DeptDTO deptDto = dto.getDeptList().get(0);
			System.out.println("deptname : " + deptDto.getDept_name());
			
		}
		
		return list;
	}

	public int noticeinsert(NoticeDTO noticeDTO) {
		int rows = sqlSessionTemplate.insert("notice.noticeinsert", noticeDTO);
		return rows;
	}

	public NoticeDTO selectNotice(int notice_id) {
		NoticeDTO noticeDTO = sqlSessionTemplate.selectOne("notice.selectNotice", notice_id);
		return noticeDTO;
	}
	
	//테스트 코드/
	public List<MemberDTO> testMember() {
		return sqlSessionTemplate.selectList("notice.testMember");
	}
	public List<NoticeDTO> testNotice(){
		return sqlSessionTemplate.selectList("notice.testNotice");
	}
	
}
