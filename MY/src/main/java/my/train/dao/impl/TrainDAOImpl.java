package my.train.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import my.train.dao.TrainDAO;

@Repository
public class TrainDAOImpl extends EgovAbstractMapper implements TrainDAO{
	
	@Override
	public String selectStationId(String stationName) {
		return selectOne("Train.selectStationId", stationName);
	}
}
