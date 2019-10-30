package com.postoffice.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postoffice.web.dto.BoardDTO;
import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.service.ClientRequestService;

@Controller
public class ClientRequestController {
	private static final Logger logger = LoggerFactory.getLogger(ClientRequestController.class);

	@Autowired
	private ClientRequestService requestService;

	@RequestMapping("/client_index")
	public String client_index() {

		return "client/index";
	}

	@RequestMapping("/requestBoarderList")
	public String requestBoarderList(Model model, @RequestParam(defaultValue = "1") int pageNo, HttpSession session){
		session.setAttribute("pageNo", pageNo);

		int rowsPerPage = 10;
		int pagesPerGroup = 5;

		int totalRowNum = requestService.getTotalRowNo();
		int totalPageNum = totalRowNum / rowsPerPage;
		if (totalRowNum % rowsPerPage != 0)
			totalPageNum++;
		// 전체 그룹 수
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if (totalPageNum % pagesPerGroup != 0)
			totalGroupNum++;

		// 현재 페이지의 그룹번호
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;
		// 현재 그룹의 시작 페이지 번호
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		// 현재 그룹의 마지막 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if (groupNo == totalGroupNum)
			endPageNo = totalPageNum;

		// 현재 페이지의 시작 행번호
		int startRowNo = (pageNo - 1) * rowsPerPage + 1;
		// 현재 페이지의 끝 행번호
		int endRowNo = pageNo * rowsPerPage;
		if (pageNo == totalPageNum)
			endRowNo = totalRowNum;

		List<BoardDTO> boardList = requestService.getBoardList(startRowNo, endRowNo);
		List<MailDTO> MailList = requestService.selectMailList(startRowNo, endRowNo);

		// JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup);// model의 경우 jsp페이지로 넘길때 해당 페이지가, PL표현식으로 넘겨질수 있기 떄문에 이 표현식을
															// 씀
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("MailList", MailList);
		return "client/requestBoarderList";
	}

	//req_next값 가져오기
	 @GetMapping("/requestWrite")
	 	public String mailadd1(Model model) { 
		 int originMailNum = requestService.getnum()+1;
		 model.addAttribute("originMailNum",originMailNum); 
		 return "client/requestWrite"; 
	}

	// 클라이언트 메일 요청
	@RequestMapping("/requestWrite")
	public String requestProcess(MailDTO maildto, @RequestParam(defaultValue = "1") int pageNo) {
		int requestmail = requestService.requestWrite(maildto);
		return "redirect:/requestBoarderList";
	}
	
	//요청 삭제
	@RequestMapping("/requestRemove")
	public String requestRemove(String mail_id) {
		requestService.requestRemove(mail_id);
		return "redirect:/requestBoarderList";
	}
	
	//내가 썻던 게시물 정보부터 가져오기
	@RequestMapping("/boardDetail")
	public String boardDetail(int mail_id, Model model) {
		MailDTO board = requestService.getBoard(mail_id);
		model.addAttribute("board",board);
		return "client/boardDetail";
	}
	
	//게시물 수정한것 저장하기
	@RequestMapping("/updateBoard")
	public String updateBoard(MailDTO board, HttpSession session) {
		requestService.update(board);
		
		int pageNo = (Integer)session.getAttribute("pageNo");
		return "redirect:/requestBoarderList?pageNo="+pageNo;
	}
	
}