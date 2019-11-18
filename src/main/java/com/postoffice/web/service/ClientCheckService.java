package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.ClientCheckDAO;
import com.postoffice.web.dao.PackageDAO;
import com.postoffice.web.dto.MailDTO;
import com.postoffice.web.dto.PackageDTO;


@Service
public class ClientCheckService {
	
	@Autowired
	private ClientCheckDAO checkDAO;
	@Autowired
	private PackageDAO packageDAO;

	
	public List selectAll() {
		return checkDAO.selectAll();
	}
	public List packageSelect() {
		return checkDAO.packageSelect();
	}
	public int updateStateProc(MailDTO mailDTO) {
		return checkDAO.updateStateProc(mailDTO);
	}
	public List beforeSelectAll() {
		return checkDAO.beforeSelectAll();
	}
	public int cancel(int package_id) {
		return checkDAO.cancel(package_id);	
	}
	public PackageDTO packageDetail(int package_id) {
		return checkDAO.packageDetail(package_id);
	}
}
