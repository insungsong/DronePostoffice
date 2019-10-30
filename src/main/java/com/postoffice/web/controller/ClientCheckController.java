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

import com.postoffice.web.dto.StateDTO;
import com.postoffice.web.service.ClientCheckService;

@Controller
public class ClientCheckController {
	
	@Autowired
	private ClientCheckService checkService;
	
	@RequestMapping("/check")
	public ModelAndView selectAll(Model model) {
		List checkList = checkService.selectAll();
		ModelAndView mav=new ModelAndView("client/requestCheck");
		model.addAttribute("CheckList",checkList);
		return mav;
		
	}
	
	@RequestMapping("/stateCheck")
	@ResponseBody
		public String stateCheck(String state_id,Model model) {
		StateDTO state=checkService.stateCheck(state_id);
		//System.out.println("ㅋㅌㄹㄹ");
		ModelAndView mav=new ModelAndView("client/requestCheck");
		model.addAttribute("state",state);
		StringBuffer sb=new StringBuffer();
	    sb.append("{");
	    sb.append("\"state_id\":\"s001\",");
	    sb.append("\"state_name\":\"배송 준비중\"");
	    sb.append("}");
	  
	    return sb.toString();
		
		
	    
	}
	
}
