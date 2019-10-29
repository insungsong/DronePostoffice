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
	public String login(String error, Model model) {
		if(error != null) {
			if(error.equals("fail_lid")) {
				model.addAttribute("lidError", "*아이디가 존재하지 않습니다.");
			} else if(error.equals("fail_lpassword")) {
				model.addAttribute("lpasswordError", "*비밀번호가 틀렸습니다.");
			}
		}
		return "login";
	}
	
	@PostMapping("/login")
	public String loginConfirm(String lid, String lpassword, HttpSession session) {
		LoginResult result = service.login(lid, lpassword);
		if(result == LoginResult.FAIL_MID) {
			return "redirect:/?error=fail_lid";
		}else if(result == LoginResult.FAIL_MPASSWORD) {
			return "redirect:/?error=fail_lpassword";
		}
		return "redirect:/";
	}
	
	
	
}
