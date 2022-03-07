package egovframework.login.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	/*
	 * 로그인화면
	*/
	@RequestMapping("login.do")
	public String selectLoginPage() {
		return "tiles/Login/Login";
	}
}
