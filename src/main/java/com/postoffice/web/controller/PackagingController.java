package com.postoffice.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postoffice.web.dto.PackageDTO;
import com.postoffice.web.service.PackagingService;

@Controller
public class PackagingController {

	@Autowired
	private PackagingService service;
	
	@RequestMapping("/packagingList")
	public String packagingList(Model model) {
		model.addAttribute("mailList",service.mailList());
		model.addAttribute("packagingList",service.packageList());
		
		List<PackageDTO> list = service.packageList();
		for(int i = 0; i < list.size(); i++) {
			PackageDTO dto = list.get(i);
			System.out.println("------------------------------------------");
			System.out.println(dto.getPackage_id());
			System.out.println(dto.getPackage_weight());
			System.out.println("------------------------------------------");
		}
		return "manager/packaging";
	}
	
	@RequestMapping("/packaging")
	public void packaging(Model model, HttpServletResponse response,
			@RequestParam(value="mailIdList[]") List<String> mailIdList,
			@RequestParam(value="totalWeight") String totalWeight) throws IOException {
		
			response.setContentType("application/json; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			
			JSONObject json = new JSONObject();
			
			json.put("packagingList", service.mailPackaging(totalWeight, mailIdList));
			
			pw.print(json.toString());
			pw.flush();
			pw.close();
	}
	
}
