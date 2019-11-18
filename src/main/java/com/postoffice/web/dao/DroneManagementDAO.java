package com.postoffice.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.postoffice.web.dto.DeliveryDTO;
import com.postoffice.web.dto.DroneDTO;
import com.postoffice.web.dto.VillageDTO;

@Repository
public class DroneManagementDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<DroneDTO> selectDroneList(){
		return sqlSessionTemplate.selectList("drone.selectDroneList");
	}
	public DroneDTO selectDroneInfo(DroneDTO dto){
		return sqlSessionTemplate.selectOne("drone.selectDroneInfo",dto);
	}
	public List<DeliveryDTO> selectDroneLog(DroneDTO dto){
		return sqlSessionTemplate.selectList("drone.selectDroneLog", dto);
	}
	
	public VillageDTO selectDroneDeliveryState(DroneDTO dto) {
		return sqlSessionTemplate.selectOne("drone.selectDroneDeliveryState", dto);
	}
	
	public void updateDroneState(DeliveryDTO dto) {
		sqlSessionTemplate.update("drone.updateDroneState",dto);
	}
	
}
