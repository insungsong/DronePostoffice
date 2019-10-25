package com.postoffice.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping("/client_index")
	public String index2(){
		return "client/index";
	}
}
