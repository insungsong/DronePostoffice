package com.postoffice.web.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postoffice.web.dto.DeliveryDTO;
import com.postoffice.web.dto.DroneDTO;
import com.postoffice.web.dto.PackageDTO;
import com.postoffice.web.service.DroneManagementService;
import com.postoffice.web.service.GcsService;
import com.postoffice.web.service.PackageService;

@Controller
public class DeliveryController {

	@Autowired
	private PackageService packageService;
	@Autowired
	private DroneManagementService droneManagementService;
	@Autowired
	private GcsService gcsService;
	
	@RequestMapping("/delivery")
	public String delibery(Model model) {
		//model.addAttribute("mailList",packageService.mailList());
		model.addAttribute("packageList",packageService.packageList());
		return "manager/delivery";
	}
	
	@RequestMapping("/delivery_Ajax")
	public String delivery_Ajax(Model model, PackageDTO dto, @RequestParam String index) {
		
		model.addAttribute("package_id", dto.getPackage_id());
		model.addAttribute("index", index);
		model.addAttribute("droneInfo", droneManagementService.selectDroneList());
		return "manager/delivery_Ajax";
	}
	
	@RequestMapping("/delivery_Popup_Ajax")
	public String delivery_Popup_Ajax(Model model, DroneDTO dto) {
		
		model.addAttribute("droneLog", droneManagementService.selectDroneLog(dto));
		
		return "manager/delivery_Popup_Ajax";
	}
	
	@RequestMapping("/drone_delivery")
	public String drone_delivery(DeliveryDTO dto, @RequestParam String send_path) {
		System.out.println(send_path);
		System.out.println(dto.getDrone_id());
		gcsService.sendMessage(send_path);
		return "manager/delivery";
	}
}
