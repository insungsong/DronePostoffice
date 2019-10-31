package com.postoffice.web.controller;

import java.io.BufferedWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.postoffice.web.service.ClientCheckService;

@Controller
public class ClientCheckController {
	
	@Autowired
	private ClientCheckService checkService;
	
	@RequestMapping("/check")
	public ModelAndView selectAll(String state_id,Model model) {
		List checkList = checkService.selectAll(state_id);
		ModelAndView mav=new ModelAndView("client/requestCheck");
		model.addAttribute("CheckList",checkList);
		return mav;
	}
	
}


