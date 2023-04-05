package my.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value="/busroute.do", method = RequestMethod.GET)
	public String busRoute() {
		return "busr.jsp";
	}
	
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
	public String mainPage() {
		return "main.jsp";
	}
	
	@RequestMapping(value="/delivery.do", method = RequestMethod.GET)
	public String deliveryPage() {
		return "delivery.jsp";
	}
	
	@RequestMapping(value="/bustime.do", method = RequestMethod.GET)
	public String bustimePage() {
		return "bustime.jsp";
	}
}
