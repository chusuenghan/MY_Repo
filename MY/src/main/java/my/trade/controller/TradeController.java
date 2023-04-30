package my.trade.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import my.comment.service.CommentService;
import my.comment.vo.CommentVO;
import my.trade.service.TradeService;
import my.trade.vo.TradeVO;


@Controller
public class TradeController {
	
	@Autowired
	TradeService tradeService;
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value="/tradeInsertPage.do")//게시글 등록 페이지 이동
	public String tradeInsertPage() {
		return "trade/tradeInsert.jsp";
	}
	
	@RequestMapping(value="/tradeListPage.do")
	public ModelAndView tradeListPage() {
		ModelAndView mav = new ModelAndView("trade/tradeList.jsp");
		
		List<TradeVO> tradeList = tradeService.selectTradeList();
		
		mav.addObject("tradeList", tradeList);
		
		return mav;
	}
	
	@RequestMapping(value="/tradeInsert.do", method = RequestMethod.POST)//게시글 등록 처리
	public String tradeInsert(@ModelAttribute TradeVO trade) throws IOException {
		// 파일 업로드 처리
		String image=null;
		MultipartFile uploadImage = trade.getUploadImage();
		if (!uploadImage.isEmpty()) {
			String originalFileName = uploadImage.getOriginalFilename();
			UUID uuid = UUID.randomUUID();	
			image=uuid+"_"+originalFileName;	
			
			uploadImage.transferTo(new File("E:\\uploads\\" + image));
		}
		trade.setImage(image);
		
		tradeService.insertTrade(trade);
		return "redirect:/tradeListPage.do";
	}
	
	@RequestMapping(value="/tradeInfoPage/{tradeId}.do")//게시글 자세히보기 이동
	public ModelAndView tradeInfoPage(@PathVariable("tradeId") int tradeId) {
		ModelAndView mav = new ModelAndView("trade/tradeInfo.jsp");
		TradeVO trade = tradeService.selectTrade(tradeId);
		List<CommentVO> comments = commentService.selectCommentList(tradeId);
		
		mav.addObject("trade", trade);
		mav.addObject("comments", comments);
		
		return mav;
	}
	
	@RequestMapping("/updateTradePage.do")
	public ModelAndView tradeUpdatePage(int tradeId){
		ModelAndView mav = new ModelAndView("trade/tradeUpdate.jsp");
		
		TradeVO trade = tradeService.selectTrade(tradeId);
		mav.addObject("trade", trade);
		
		return mav;
	}
	
	@RequestMapping("/tradeUpdate.do")
	public String tradeUpdate(@ModelAttribute TradeVO trade) throws IOException {
		TradeVO tradeOrigin = tradeService.selectTrade(trade.getTradeId());
		MultipartFile uploadImage = trade.getUploadImage();
		String image=null;
		
		if (!uploadImage.isEmpty()) {
			// 파일 업로드 처리
			String originalFileName = uploadImage.getOriginalFilename();
			UUID uuid = UUID.randomUUID();	
			image=uuid+"_"+originalFileName;	
			
			uploadImage.transferTo(new File("E:\\uploads\\" + image));
			trade.setImage(image);
		}
		
		else {
			String orgFile = tradeOrigin.getImage();

			trade.setImage(orgFile);
		}
		
		tradeService.updateTrade(trade);
		
		return "redirect:/tradeInfoPage/"+Integer.toString(trade.getTradeId())+".do";
	}
	
	@RequestMapping("/tradeDelete.do")
	public String tradeDelete(int tradeId, String image) throws IOException {
		
		tradeService.deleteTrade(tradeId);
		
		File fileDel = new File("E:\\uploads\\" + image);
		fileDel.delete();
		
		return "redirect:/tradeListPage.do";
	}
}
