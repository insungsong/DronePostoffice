package com.postoffice.web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.postoffice.web.service.LoginResult;
import com.postoffice.web.service.LoginService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/")
	public String login(Model model, HttpSession session) {
		String error = (String) session.getAttribute("error");
		if(error != null) {
			if(error.equals("fail_lid")) {
				model.addAttribute("lidError", "*아이디가 존재하지 않습니다.");
			} else if(error.equals("fail_lpassword")) {
				model.addAttribute("lpasswordError", "*비밀번호가 틀렸습니다.");
			}
			session.removeAttribute("error");
		}
		return "login";
	}
	
	@PostMapping("/login")
	public String loginConfirm(String lid, String lpassword, String mauthority, HttpSession session) {
		if(mauthority.equals("manager") || mauthority.equals("admin")) { //직원 또는 관리자가 로그인할 때 
			LoginResult result = loginService.mLogin(lid, lpassword);
			
			//로그인 실패했을 때 실행
			if(result == LoginResult.FAIL_LID) {
				session.setAttribute("error", "fail_lid");
				return "redirect:/";
			}else if(result == LoginResult.FAIL_LPASSWORD) {
				session.setAttribute("error", "fail_lpassword");
				return "redirect:/";
			}
			
			//로그인 성공했을 때 실행
			//session.setAttribute("lid", lid); //세션에 로그인 정보 저장
			//session.setAttribute("mauthority", mauthority);	//세션에 로그인 정보 저장
			if(mauthority.equals("manager")) {
				logger.debug("직원 로그인");
				return "redirect:/"; //직원이 로그인했을 때 이동하는 페이지
			} else {
				logger.debug("관리자 로그인");
				return "redirect:/"; //관리자가 로그인했을 때 이동하는 페이지
			}
			
		}else { //이장님이 로그인했을 때
			LoginResult result = loginService.cLogin(lid, lpassword);
			
			//로그인 실패했을 때 실행
			if(result == LoginResult.FAIL_LID) {
				return "redirect:/?error=fail_lid";
			}else if(result == LoginResult.FAIL_LPASSWORD) {
				return "redirect:/?error=fail_lpassword";
			}
			
			//로그인 성공했을 때 실행
			//session.setAttribute("lid", lid); //세션에 로그인 정보 저장
			//session.setAttribute("mauthority", mauthority);	//세션에 로그인 정보 저장
			logger.debug("이장님 로그인");	
			return "redirect:/"; //이장님이 로그인했을 때 이동하는 페이지
		} 
		
	}
	
	
	
}
