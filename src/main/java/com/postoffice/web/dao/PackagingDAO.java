package com.postoffice.web.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.dto.PackageDTO;

@Repository
public class PackagingDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//우편 목록
	public List<MailDTO> mailList(){
		return sqlSessionTemplate.selectList("packaging.selectMailList");
	}

	//우편 패키징
	public int mailPackaging(PackageDTO dto) {
		int pack_num = sqlSessionTemplate.insert("packaging.insertMailPackaging",dto);
		return pack_num;
	}
	
	//패키징된 우편 업데이트(상태,패키징 번호)
	public int mailUpdate(MailDTO mailDTO, PackageDTO packageDTO) {
		
		Map<String, Integer> map = new HashMap<>();
		map.put("mail_id", mailDTO.getMail_id());
		map.put("package_id", packageDTO.getPackage_id());
		
		return sqlSessionTemplate.update("packaging.updateMail", map);
	}
	
	//패키징된 우편 목록
	public List<PackageDTO> packageList(){
		
		return sqlSessionTemplate.selectList("packaging.selectPackagingList");
	}
}
