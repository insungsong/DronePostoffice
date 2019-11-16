package com.postoffice.web.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestController {

	
	@RequestMapping("/maps")
	public String maps() {
		return "maps";
	}
	
	@RequestMapping("/maps2")
	public String maps2(Model model) {
		
		return "maps2";
	}
	@RequestMapping("/marker")
	public String marker(Model model,@RequestParam List<Object> items) {
		System.out.println(items);
		JSONArray jsonArray = new JSONArray(items);
		JSONObject jsonObject = new JSONObject();
		JSONArray x = null;
		JSONArray y = null;
		for(int i = 0; i < jsonArray.length(); i++) {
			JSONObject sp = jsonArray.getJSONObject(i);
			x.put(sp.get("x"));
			y.put(sp.get("y"));
		}
		System.out.println(x);
		System.out.println(y);
		model.addAttribute("x", x);
		model.addAttribute("y",y);
		
		return "maps2";
	}
}
