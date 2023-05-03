package my.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import my.comment.service.CommentService;
import my.comment.vo.CommentVO;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	
	
	
	@GetMapping("comments/{tradeId}.do")
	@ResponseBody
	public ModelAndView getComments(@PathVariable("tradeId") int tradeId) {
		ModelAndView mav = new ModelAndView("jsonView");

	    List<CommentVO> comments = commentService.selectCommentList(tradeId);
	    mav.addObject("comments", comments);

		return mav;	
		}
}
