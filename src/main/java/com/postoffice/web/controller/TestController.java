package com.postoffice.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.postoffice.web.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	private TestService testService;
	
	@RequestMapping("/test")
	public String test() {
		return "Test";
	}
	
	@RequestMapping("/sendMqtt")
	public String sendMqtt(String path) {
		testService.sendMessage(path);
		return "Test";
	}
}
