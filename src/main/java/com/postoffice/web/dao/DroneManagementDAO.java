package com.postoffice.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.postoffice.web.dto.DeliveryDTO;
import com.postoffice.web.dto.DroneDTO;

@Repository
public class DroneManagementDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<DroneDTO> selectDroneList(){
		return sqlSessionTemplate.selectList("drone.selectDroneList");
	}
	public List<DeliveryDTO> selectDroneLog(DroneDTO dto){
		return sqlSessionTemplate.selectList("drone.selectDroneLog", dto);
	}
}
