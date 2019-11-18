package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.PackageDAO;
import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.dto.PackageDTO;

@Service
public class PackageService {

	@Autowired
	PackageDAO packageDAO;
	
	public List<MailDTO> mailList(String sort){
		
		return packageDAO.mailList(sort);
	}
	public List<PackageDTO> packageList(){
		return packageDAO.packageList();
	}
	
	public List<PackageDTO> mailPackaging(String totalWeight, List<String> mailIdList) {
		//총 무게 g 자르고 int 변환
		String rep = totalWeight.replace("g", "");
		int total = Integer.parseInt(rep);

		
		PackageDTO packageDTO = new PackageDTO();
		packageDTO.setPackage_weight(total);
		
		//패키지 insert
		packageDAO.mailPackaging(packageDTO);
		

		MailDTO mailDTO = new MailDTO();
		
		//우편 update
		for(int i = 0; i < mailIdList.size(); i++) {
			mailDTO.setMail_id(Integer.parseInt(mailIdList.get(i)));
			packageDAO.mailUpdate(mailDTO, packageDTO);
		}
		
		//패키지 목록 select
		return packageDAO.packageList();
	}
	
	public List<MailDTO> pack_mailList(PackageDTO dto){
		
		return packageDAO.pack_mailList(dto);
	}
	
}
