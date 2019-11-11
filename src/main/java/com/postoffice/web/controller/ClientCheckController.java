package com.postoffice.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.service.ClientCheckService;
import com.postoffice.web.service.ClientStateCheckService;
import com.postoffice.web.service.LoginService;

@Controller
public class ClientCheckController {
	
	@Autowired
	private ClientCheckService checkService;
	@Autowired
	private ClientStateCheckService clientStateCheckService;
	@Autowired
	private LoginService loginService;
	
	
	@RequestMapping("/check")
	public ModelAndView selectAll(Model model,HttpSession session) {
		String vid=(String)session.getAttribute("vid");
		
		System.out.println(vid);
		List checkList = checkService.selectAll();
		List stateList = clientStateCheckService.selectList();
		ModelAndView mav=new ModelAndView("client/requestCheck");
		
		
		model.addAttribute("CheckList",checkList);
		model.addAttribute("stateList", stateList);
		return mav;
	}
		
	@RequestMapping("/stateCheck")
	public String stateCheck(Model model, HttpServletRequest request) {
		MailDTO mailDTO=new MailDTO();
		mailDTO.setMail_id(Integer.parseInt(request.getParameter("mail_id")));
		mailDTO.setState_id(request.getParameter("state_id"));
		
		int result = checkService.updateStateProc(mailDTO);
		
		return "redirect:/check";
	}
}


