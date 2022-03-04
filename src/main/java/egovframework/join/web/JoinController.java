package egovframework.join.web;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		System.out.println("asdasdasd");
		return "tiles/Join/Join";
	}
	
	
	@ResponseBody
	@PostMapping("JoinInsert.do") 
	public String insertJoin(JoinVO joinVO) { 
		System.out.println("암호화전:"+joinVO.getPass() );
		System.out.println("암호화후:"+joinVO.getPass() );
		
		System.out.println("인서트 컨트롤러 접속완료");
		System.out.println(joinVO.getUserId()); 
		String message = "";
		int result = joinService.joinInsert(joinVO);
		
		if(result > 0){
			message ="ok";
		}else {
			message ="no";
		}
		return message;
  }
	 
}