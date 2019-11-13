package com.postoffice.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@Resource(name="dataSource")
	private DataSource dataSource;
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/connTest")
	public void connTest(HttpServletResponse response)  {
		boolean result = false;
		
		try {
			//커넥션 풀에서 연결된 커넥션 대여
			Connection conn = dataSource.getConnection();
			if(conn != null) result = true;
			System.out.println(result+"연결완료!");
			
			//커넥션 풀로 컨넥션을 반납
			conn.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
}
