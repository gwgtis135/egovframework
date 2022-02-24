package egovframework.join.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.join.service.JoinService;
import egovframework.join.service.JoinVO;

@Controller
public class JoinController {

	/*
	 * 회원등록화면
	*/
	@Autowired JoinService joinService;
	
	@RequestMapping("join.do")
	public String selectJoinPage() {
		return "Join/Join";
	}
	
	
	@ResponseBody
	@PostMapping("joinInsert.do") 
	public String insertJoin(@RequestBody JoinVO joinVO) { 
		System.out.println(joinVO); 
		if(joinService.joinInsert(joinVO) > 0){
			return "ok";
		}else {
			return  "no"; 
		}
  }
	 
}