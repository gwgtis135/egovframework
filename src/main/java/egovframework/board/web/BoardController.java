package egovframework.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	@RequestMapping("selectAllBoard.do")
	public String selectAllBoard() {
		System.out.println("selectAllboard");
		service.selectAllBoard();
		return "Board/BoardList";
	}
	
	public String insertBoard() {
		return null;
	}
}
