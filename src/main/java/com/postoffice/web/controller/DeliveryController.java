package com.postoffice.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.postoffice.web.dto.DroneDTO;
import com.postoffice.web.service.DroneManagementService;
import com.postoffice.web.service.PackageService;

@Controller
public class DeliveryController {

	@Autowired
	private PackageService packageService;
	@Autowired
	private DroneManagementService droneManagementService;
	
	@RequestMapping("/delivery")
	public String delibery(Model model) {
		//model.addAttribute("mailList",packageService.mailList());
		model.addAttribute("packageList",packageService.packageList());
		return "manager/delivery";
	}
	
	@RequestMapping("/delivery_Popup")
	public String delivery_Popup(Model model) {
		
		model.addAttribute("droneInfo", droneManagementService.selectDroneList());
		return "manager/delivery_Popup";
	}
	
	@RequestMapping("/delivery_Popup_Ajax")
	public String delivery_Popup_Ajax(Model model, DroneDTO dto) {
		
		model.addAttribute("droneLog", droneManagementService.selectDroneLog(dto));
		
		return "manager/delivery_Popup_Ajax";
	}
}
