package my.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import my.user.service.UserService;
import my.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/signUpPage.do", method = RequestMethod.GET)
	public ModelAndView signUpPage() {
		ModelAndView mav = new ModelAndView("user/signUp.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/signUp.do", method = RequestMethod.POST)
	public String signUp(@ModelAttribute UserVO user) {
		userService.insertUser(user);
		
		return "redirect:/loginPage.do";
	}
	
	@RequestMapping(value="/pwdConfirmPage.do", method = RequestMethod.GET)
	public String pwdConfirmPage() {
		return "user/pwdConfirm.jsp";
	}
	
	@RequestMapping(value="/userUpdatePage.do", method = RequestMethod.POST)
	public ModelAndView userUpdatePage(@ModelAttribute UserVO user) {
		if(userService.selectPwd(user.getUserId(), user.getPwd())) {
			ModelAndView mav = new ModelAndView("user/userUpdate.jsp");
			
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("main.jsp");
			return mav;
		}
	}
	
	@RequestMapping(value="/userUpdate.do", method = RequestMethod.POST)
	public String updateUser(HttpSession session, @ModelAttribute UserVO user) {
		userService.updateUser(user);
		userService.setSession(session, user.getUserId());
		return "main.jsp";
	}
	
	@RequestMapping(value="/userDelete.do", method = RequestMethod.GET)
	public String userDelete(HttpSession session) {
		UserVO userInfo = (UserVO) session.getAttribute("USER");
		
//		System.out.println(userInfo.getUserId());
		userService.deleteUser(userInfo.getUserId());
		session.removeAttribute("USER");
		
		return "redirect:/loginPage.do";
	}

}