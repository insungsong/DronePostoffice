package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.NoticeDAO;
import com.postoffice.web.dto.MemberDTO;
import com.postoffice.web.dto.NoticeDTO;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	public int getTotalRowNum() {
		int totalRowNum = noticeDAO.selectTotalRowNum();
		return totalRowNum;
	}

	public List<NoticeDTO> getNoticeList(int startRowNum, int endRowNum) {
		List <NoticeDTO> noticeList = noticeDAO.selectList(startRowNum, endRowNum);
		return noticeList;
	}

	public void noticeWrite(NoticeDTO noticeDTO) {
		noticeDAO.noticeinsert(noticeDTO);
		
	}
	
	public NoticeDTO getnotice(int notice_id) {
		NoticeDTO noticeDTO = noticeDAO.selectNotice(notice_id);
		return noticeDTO;
	}
	
	//테스트 코드
	public List<MemberDTO> testMember(){
		List<MemberDTO> list = noticeDAO.testMember();
		
		System.out.println("--------------------------------------------");
		for(int i = 0; i < list.size(); i++) {
			MemberDTO dto = list.get(i);
			System.out.println("dept id : " + dto.getDept_id());
			System.out.println("id : " + dto.getMid());
			System.out.println("name : " + dto.getMname());
		}
		System.out.println("--------------------------------------------");

		
		
		return list;
	}
	
}
