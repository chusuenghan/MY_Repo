package my.trade.service;

import java.util.List;

import my.trade.vo.TradeVO;

public interface TradeService {
	public int insertTrade(TradeVO trade);
	public List<TradeVO> selectTradeList();
	public TradeVO selectTrade(int tradeId);
}
