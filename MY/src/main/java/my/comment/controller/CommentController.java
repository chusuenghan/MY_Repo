package my.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import my.comment.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
}
