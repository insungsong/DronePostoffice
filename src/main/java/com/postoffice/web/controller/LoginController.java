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

import com.postoffice.web.service.LoginResult;
import com.postoffice.web.service.LoginService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService service;
	
	@GetMapping("/")
	public String login() {
		return "login";
	}
	
	@GetMapping("/loginManager")
	public String loginManager1(String error, Model model) {
		if(error!=null) {
			if(error.equals("fail_mid")) {
				model.addAttribute("midError", "*아이디가 존재하지 않습니다.");
			} else if(error.equals("fail_mpassword")) {
				model.addAttribute("mpasswordError", "*비밀번호가 틀렸습니다.");
			}
		}
		return "loginManager";
	}
	
	@PostMapping("/loginManager")
	public String loginManager2(String mid, String mpassword, HttpSession session, Model model) throws Exception {
		LoginResult result = service.login(mid, mpassword);
		if(result == LoginResult.FAIL_MID) {
			model.addAttribute("midError", "*아이디가 존재하지 않습니다.");
			return "redirect:/loginManager";
		}else if(result == LoginResult.FAIL_MPASSWORD) {
			return "redirect:/loginManager?error=fail_mpassword";
		}else {
			return "redirect:/index";
		}
		
	}
	
	@GetMapping("/loginClient")
	public String loginClient1() {
		return "loginClient";
	}
	
	@PostMapping("/loginClient")
	public String loginClient2() {
		return "";
	}
	
	@GetMapping("/loginAdmin")
	public String loginAdmin1() {
		return "loginAdmin";
	}
	
	@PostMapping("/loginAdmin")
	public String loginAdmin2() {
		
		return "";
	}
	
}
