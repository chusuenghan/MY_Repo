package my.trade.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.trade.dao.TradeDAO;
import my.trade.service.TradeService;
import my.trade.vo.TradeVO;




@Service
public class TradeServiceImpl implements TradeService{

	@Autowired
	TradeDAO tradeDAO;
	
	@Override
	public int insertTrade(TradeVO trade) {
		return tradeDAO.insertTrade(trade);
	}

	@Override
	public List<TradeVO> selectTradeList() {
		return tradeDAO.selectTradeList();
	}

	@Override
	public TradeVO selectTrade(int tradeId) {
		return tradeDAO.selectTrade(tradeId);
	}
	
}
