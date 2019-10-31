package com.postoffice.web.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
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
		String lauthority = (String) session.getAttribute("lauthority");
		
		//아이디 또는 비밀번호 틀렸을 때 실행 
		if(error != null) {
			if(error.equals("fail_lid")) {
				model.addAttribute("lidError", "*아이디가 존재하지 않습니다.");
			} else if(error.equals("fail_lpassword")) {
				model.addAttribute("lpasswordError", "*비밀번호가 틀렸습니다.");
			} else if(error.equals("lauthorityError")){
				model.addAttribute("lauthorityError", "*권한이 없습니다.");
			}
			session.removeAttribute("error");
		}
		
		//이미 로그인 상태일 때 로그인 페이지로 돌아갈 수 없도록 실행
		if(lauthority != null) {
			if(lauthority.equals("manager")) {
				return "redirect:/";
			} else if(lauthority.equals("admin")) {
				return "redirect:/";
			} else {
				return "redirect:/client_index";
			}
		}
		
		//error, mauthority 둘다 null이면 실행 
		return "login";
	}
	
	@PostMapping("/login")
	public String loginConfirm(String lid, String lpassword, String lauthority, HttpSession session) {
		if(lauthority.equals("manager") || lauthority.equals("admin")) { //직원 또는 관리자가 로그인할 때 
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
			session.setAttribute("lid", lid); //세션에 로그인 정보 저장
			session.setAttribute("lauthority", lauthority);	//세션에 로그인 정보 저장
			if(lauthority.equals("manager")) {
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
				session.setAttribute("error", "fail_lid");
				return "redirect:/";
			}else if(result == LoginResult.FAIL_LPASSWORD) {
				session.setAttribute("error", "fail_lpassword");
				return "redirect:/";
			}
			
			//로그인 성공했을 때 실행
			session.setAttribute("lid", lid); //세션에 로그인 정보 저장
			session.setAttribute("lauthority", lauthority);	//세션에 로그인 정보 저장
			logger.debug("이장님 로그인");	
			return "redirect:/client_index"; //이장님이 로그인했을 때 이동하는 페이지
		} 
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("lid");
		session.removeAttribute("mauthority");
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String joinForm() {
		return "joinForm";
	}
	
	@PostMapping("/join") 
	public String join() {
		return "redirect:/";
	}
	
	@RequestMapping("/lidCheck")
	public void lidCheck(String lid, String lauthority, HttpServletResponse response) throws Exception{
		logger.debug(lid);
		logger.debug(lauthority);
		if(lauthority.equals("manager") || lauthority.equals("admin")) {
			boolean result = loginService.mLidCheck(lid);
			response.setContentType("application/json; charset=UTF-8"); 
			PrintWriter pw = response.getWriter(); 
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", result); 
			pw.print(jsonObject.toString());
			pw.flush(); 
			pw.close();
		} else {
			boolean result = loginService.cLidCheck(lid);
			response.setContentType("application/json; charset=UTF-8"); 
			PrintWriter pw = response.getWriter(); 
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", result); 
			pw.print(jsonObject.toString());
			pw.flush(); 
			pw.close();
		}
		 
	}
	
}
