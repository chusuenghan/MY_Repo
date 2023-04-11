package my.train.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.train.dao.TrainDAO;
import my.train.service.TrainService;

@Service
public class TrainServiceImpl implements TrainService{
	
	@Autowired
	TrainDAO trainDAO;
	
	@Override
	public String selectStationId(String stationName) {
		return trainDAO.selectStationId(stationName);
	}
}
