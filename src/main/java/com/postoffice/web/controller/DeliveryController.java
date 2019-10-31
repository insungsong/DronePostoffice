package com.postoffice.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.postoffice.web.service.PackageService;

@Controller
public class DeliveryController {

	@Autowired
	private PackageService packageService;
	
	@RequestMapping("/delivery")
	public String delibery(Model model) {
		model.addAttribute("mailList",packageService.mailList());
		model.addAttribute("packageList",packageService.packageList());
		return "manager/delivery";
	}
}
