package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.NoticeDAO;
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
	
}
