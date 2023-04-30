package my.comment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import my.comment.dao.CommentDAO;
import my.comment.service.CommentService;
import my.comment.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	CommentDAO commentDAO;
	
	@Override
	public int insertComment(CommentVO comment) {
		return commentDAO.insertComment(comment);
	}
	
	@Override
	public List<CommentVO> selectCommentList(int tradeId){
		return commentDAO.selectCommentList(tradeId);
	}
}
