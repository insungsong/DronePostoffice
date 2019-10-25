package com.postoffice.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PackagingController {

	@RequestMapping("/packaging")
	public String packaging() {
		
		return "manager/process/packaging";
	}
}
