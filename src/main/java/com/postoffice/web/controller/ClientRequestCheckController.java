package com.postoffice.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClientRequestCheckController {
	
	@RequestMapping("/requestCheck")
	public String requestCheck() {
		return "client/requestCheck";
	}
}

