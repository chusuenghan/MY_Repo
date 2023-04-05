package my.trade.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import my.trade.dao.TradeDAO;
import my.trade.vo.TradeVO;

@Repository
public class TradeDAOImpl extends EgovAbstractMapper implements TradeDAO{
	
	@Override
	public int insertTrade(TradeVO trade) {
		return insert("Trade.insertTrade", trade);
	}

	@Override
	public List<TradeVO> selectTradeList(){
		return selectList("Trade.selectTradeList");
	}

	@Override
	public TradeVO selectTrade(int tradeId) {
		return selectOne("Trade.selectTrade", tradeId);
	}
}
