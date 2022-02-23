package egovframework.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.board.service.BoardService;
import egovframework.board.service.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	@RequestMapping("selectAllBoard.do")
	public String selectAllBoard(Model model) {
		System.out.println("selectAllboard");
		List<BoardVO> list = service.selectAllBoard();
		System.out.println(list.toString());
		model.addAttribute("boardlist",list);
		return "Board/BoardList";
	}
	@RequestMapping("insertBoard.do")
	public String insertBoard() {
		return "Board/BoardInsert";
	}
	@RequestMapping("BoardInsert.do")
	public String boardInsert(BoardVO vo) {
		System.out.println(vo.toString());
		//service.insertBoard(vo);
		return "redirect:TempBoard.do";
	}
	@RequestMapping("TempBoard.do")
	public String TempBoard() {
		return "Board/BoardList";
	}
}
