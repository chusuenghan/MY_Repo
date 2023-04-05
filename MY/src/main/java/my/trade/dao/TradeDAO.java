package my.trade.dao;

import java.util.List;

import my.trade.vo.TradeVO;

public interface TradeDAO {
	public int insertTrade(TradeVO trade);
	public List<TradeVO> selectTradeList();
	public TradeVO selectTrade(int tradeId);
}
