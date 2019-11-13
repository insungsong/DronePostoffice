package com.postoffice.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.postoffice.web.service.DroneManagementService;

@Controller
public class DroneManagementController {

	@Autowired
	DroneManagementService droneManagementService;
	
	@RequestMapping("/droneManagement")
	public String droneManagement(Model model) {
		
		model.addAttribute("droneList", droneManagementService.selectDroneList());
		
		return "manager/droneManagement";
	}
	
}
