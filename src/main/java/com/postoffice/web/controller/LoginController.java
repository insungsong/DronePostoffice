package com.postoffice.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@GetMapping("/")
	public String login() {
		return "login";
	}
	
	@GetMapping("/loginManager")
	public String loginManager1() {
		return "loginManager";
	}
	
	@PostMapping("/loginManager")
	public String loginManager2() {
		return "";
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
