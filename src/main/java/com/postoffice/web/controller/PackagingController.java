package com.postoffice.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postoffice.web.service.PackagingService;

@Controller
public class PackagingController {

	@Autowired
	private PackagingService service;
	
	@RequestMapping("/packagingList")
	public String packagingList(Model model) {
		model.addAttribute("mailList",service.mailList());

		return "manager/process/packaging";
	}
	
	@RequestMapping("/packaging")
	public String packaging(@RequestParam(value="mailIdList[]") List<String> mailIdList, Model model) {
		for(int i = 0; i < mailIdList.size(); i++) {
			System.out.println(mailIdList.get(i));
		}
		
		return "manager/process/packaging";
	}
	
}
