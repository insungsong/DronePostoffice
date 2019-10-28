package com.postoffice.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postoffice.web.dto.BoardDTO;
import com.postoffice.web.service.ClientRequestService;
@Controller
public class ClientRequestController {
	private static final Logger logger =LoggerFactory.getLogger(ClientRequestController.class);
	
	@Autowired
	private ClientRequestService requestService;
	
	@RequestMapping("/client_index")
	public String client_index(){
	
		return "client/index";
	}
	
	@RequestMapping("/requestBoarderList")
	public String requestBoarderList(Model model, @RequestParam(defaultValue = "1")int pageNo,HttpSession session) {
		session.setAttribute("pageNo", pageNo);
		
		int rowsPerPage=10;
		int pagesPerGroup=5;
		
		int totalRowNum=requestService.getTotalRowNo();
		int totalPageNum = totalRowNum / rowsPerPage;
		if(totalRowNum % rowsPerPage != 0) totalPageNum++;
		//전체 그룹 수
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if(totalPageNum % pagesPerGroup != 0) totalGroupNum++;
		
		//현재 페이지의 그룹번호
		int groupNo = (pageNo-1)/pagesPerGroup + 1;
		//현재 그룹의 시작 페이지 번호
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		//현재 그룹의 마지막 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNum) endPageNo = totalPageNum;
		
		//현재 페이지의 시작 행번호
		int startRowNo = (pageNo-1)*rowsPerPage + 1;
		//현재 페이지의 끝 행번호
		int endRowNo = pageNo*rowsPerPage;
		if(pageNo == totalPageNum) endRowNo = totalRowNum;
		
		List<BoardDTO> boardList = requestService.getBoardList(startRowNo, endRowNo);
		//JSP로 페이지 정보 넘기기
		model.addAttribute("pagesPerGroup", pagesPerGroup);//model의 경우 jsp페이지로 넘길때 해당 페이지가, PL표현식으로 넘겨질수 있기 떄문에 이 표현식을 씀 
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("totalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("boardList", boardList);
		
		

		return "client/requestBoarderList";
	}
	
	@RequestMapping("/writeBoard")
	public String writeBoard() {
		return "client/writeBoard";
	}
	
	@RequestMapping("/mailAdd")
		public String mailadd() {
			return "client/mailAdd";
		}
				
	
	
	
/*
 * @RequestMapping("/mailSend") public String mailSend(ClientMailDTO
 * clientMailDTO) { requestService.mailSend(clientMailDTO); return
 * "client/mailAdd"; } }
 */
}