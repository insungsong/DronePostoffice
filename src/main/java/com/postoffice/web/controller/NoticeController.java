package com.postoffice.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postoffice.web.dto.DeptDTO;
import com.postoffice.web.dto.MemberDTO;
import com.postoffice.web.dto.NoticeDTO;
import com.postoffice.web.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/noticeList")
	public String noticeList(Model model, @RequestParam(defaultValue = "1") int pageNum, HttpSession session) {	
		//테스트 코드
		noticeService.testMember();
		
		session.setAttribute("pageNum", pageNum);
		
		//페이지당 행 수
		int rowsPerPage = 10;
		//이전, 다음을 클릭했을 때 나오는 페이지 수
		int pagesPerGroup = 5;
		//전체 게시물 수
		int totalRowNum = noticeService.getTotalRowNum();
		//전체 페이지 수
		int totalPageNum=totalRowNum / rowsPerPage;
		if(totalRowNum % rowsPerPage !=0) totalPageNum++;
		//전체 그룹 수
		int totalGroupNum = totalPageNum/pagesPerGroup;
		if(totalPageNum % pagesPerGroup != 0) totalGroupNum++;
		//현재 페이지의 그룹번호
		int groupNum = (pageNum-1)/pagesPerGroup +1;
		//현재 그룹의 시작 페이지 번호
		int startPageNum = (groupNum-1)*pagesPerGroup+1;
		//현재 그룹의 마지막 페이지 번호
		int endPageNum =startPageNum + pagesPerGroup -1;
		if(groupNum == totalGroupNum) endPageNum = totalPageNum;
		//현재 페이지의 시작 행번호
		int startRowNum = (pageNum-1)*rowsPerPage +1; 
		//현재 페이지의 끝 행번호
		int endRowNum = pageNum * rowsPerPage;
		if(pageNum == totalPageNum) endRowNum = totalRowNum;
	 

	 List<NoticeDTO>noticeList =noticeService.getNoticeList(startRowNum,endRowNum);
	 model.addAttribute("pagesPerGroup", pagesPerGroup);
	 model.addAttribute("totalPageNum", totalPageNum);
	 model.addAttribute("totalGroupNum", totalGroupNum);
	 model.addAttribute("groupNum", groupNum); 
	 model.addAttribute("startPageNum",startPageNum);
	 model.addAttribute("endPageNum", endPageNum);
	 model.addAttribute("pageNum", pageNum); 
	 model.addAttribute("noticeList",noticeList);		 

	return "manager/noticeList";
	}

	// 공지사항 작성 폼
	@GetMapping("/noticeWrite")
	public String noticeWriteForm(Model model) {
		//session 임시
		MemberDTO dto = new MemberDTO();
		dto.setMid("1");
		
		model.addAttribute("memberInfo",noticeService.showMember(dto));
		return "manager/noticeWrite";
	}

	// 공지사항 작성 처리
	@PostMapping("/noticeWrite")
	public String noticeWrite(NoticeDTO noticeDTO, HttpSession session) {
		//noticeDTO.setMid((String) session.getAttribute("mid"));
		
		noticeService.noticeWrite(noticeDTO);
		return "redirect:/noticeList";
	}
	
	@RequestMapping("/noticeDetail")
	public String noticeDetailForm(int notice_id, Model model) {
		NoticeDTO notice = noticeService.getnotice(notice_id);
		MemberDTO member = noticeService.selectMember(notice);
		DeptDTO dept = noticeService.selectDept(member);
		model.addAttribute("member",member);
		model.addAttribute("notice", notice);
		model.addAttribute("dept", dept);
		return "manager/noticeDetail";
	}
	
	@GetMapping("/noticeUpdate")
	public String noticeUpdateForm(Model model) {
		//임시로 mid값 set
		MemberDTO dto = new MemberDTO();
		dto.setMid("1");
		
		model.addAttribute("memberInfo",noticeService.showMember(dto));
		return "manager/noticeUpdate";
	}
	
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(NoticeDTO noticeDTO, HttpSession session) {
		noticeService.noticeupdate(noticeDTO);	
		MemberDTO dto = new MemberDTO();
		dto.setMid("1");
		int noticeid = noticeDTO.getNotice_id();
		return "redirect:/noticeDetail?notice_id"+noticeid;
	}
	
	
	
	

}
