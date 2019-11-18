package com.postoffice.web.service;

import javax.annotation.PreDestroy;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postoffice.web.dao.DroneManagementDAO;
import com.postoffice.web.dto.DeliveryDTO;

@Service
public class GcsService {

	private final static Logger logger = LoggerFactory.getLogger(GcsService.class);
	
	@Autowired
	private DroneManagementDAO droneManagementDAO;
	
	private MqttClient client;
	
	public GcsService() {
		//객체가 생성될때 생성자를 통해 연결을 시키기 위해
		mqttConnect();
	}
	
	private void mqttConnect() {
		try {
			client = new MqttClient("tcp://localhost:1883", MqttClient.generateClientId(), null);
			client.connect();
			logger.debug("MQTT Broker에 연결 성공: tcp://localhost:1883");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void mqttDisconnect() {
		try {
			client.disconnectForcibly(1);
			client.close(true);
			logger.debug("MQTT Brokect에 연결 끊기 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//해당 객체가 없어지기 전에 실행
	@PreDestroy
	public void destroy() {
		mqttDisconnect();
		logger.debug("나 죽내~~");
	}
	
	
	
	public void sendMessage(DeliveryDTO dto, String state_id, String path) {
		String topic = "/drone/web/pub";
		JSONArray jsonArray = new JSONArray(path);
		JSONObject jsonObject = new JSONObject();
		
		
		jsonObject.put("msgid", "path");
		jsonObject.put("path", jsonArray);
		//jsonObject.put("msgid", "MAVJSON_MSG_ID_MISSION_ITEMS");
		String message = jsonObject.toString();
		try {
			client.publish(topic, message.getBytes(), 0, false);
			droneManagementDAO.insertDroneDelivery(dto);
			droneManagementDAO.updatePackageDelivery(dto);
			droneManagementDAO.updateDroneState(dto, state_id);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	public void sendMessageToGcs(String string) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msgid", string);
		String message = jsonObject.toString();
		logger.debug("실행");
		try {
			client.publish("/drone/web/pub", message.getBytes(), 0, false);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
