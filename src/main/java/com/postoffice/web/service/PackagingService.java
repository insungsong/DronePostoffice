package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.PackagingDAO;
import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.dto.PackageDTO;

@Service
public class PackagingService {

	@Autowired
	PackagingDAO dao;
	
	public List<MailDTO> mailList(){
		return dao.mailList();
	}
	public List<PackageDTO> packageList(){
		return dao.packageList();
	}
	
	public List<PackageDTO> mailPackaging(String totalWeight, List<String> mailIdList) {
		//총 무게 g 자르고 int 변환
		String rep = totalWeight.replace("g", "");
		int total = Integer.parseInt(rep);

		
		PackageDTO packageDTO = new PackageDTO();
		packageDTO.setPackage_weight(total);
		//패키지 insert
		dao.mailPackaging(packageDTO);
		

		MailDTO mailDTO = new MailDTO();
		
		//우편 update
		for(int i = 0; i < mailIdList.size(); i++) {
			mailDTO.setMail_id(Integer.parseInt(mailIdList.get(i)));
			dao.mailUpdate(mailDTO, packageDTO);
		}
		
		//패키지 목록 select
		return dao.packageList();
	}
}
