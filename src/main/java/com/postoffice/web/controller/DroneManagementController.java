package com.postoffice.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DroneManagementController {

	@RequestMapping("/droneManagement")
	public String droneManagement() {
		return "manager/droneManagement";
	}
}
