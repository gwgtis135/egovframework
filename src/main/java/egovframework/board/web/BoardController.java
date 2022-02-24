package egovframework.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
		service.insertBoard(vo);
		return "redirect:TempBoard.do";
	}
	
	@RequestMapping("selectBoard.do")
	public String selectBoard(Model model,BoardVO vo) {
		vo.setId(vo.getId());
		vo = service.selectBoard(vo);
		System.out.println(vo);
		model.addAttribute("board",vo);
		return "Board/BoardSelect";
	}
	
	@RequestMapping("deleteBoards.do")
	public String deleteBoards(HttpServletRequest req) {
		String check = req.getParameter("check");
		System.out.println(check);
		service.deleteBoards(check);
		return "redirect:TempBoard.do";
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(HttpServletRequest req) {
		BoardVO vo = new BoardVO();
		vo.setId(Integer.parseInt(req.getParameter("id")));
		service.deleteBoard(vo);
		return "redirect:TempBoard.do";
	}
	
	@RequestMapping("updateBoard.do")
	public String updateBoard(BoardVO vo,Model model) {
		vo = service.selectBoard(vo);
		ObjectMapper mapper = new ObjectMapper();
		String js = null;
		try {
			 js = mapper.writeValueAsString(vo);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		model.addAttribute("board",js);
		return "Board/BoardInsert";
	}
	
	@RequestMapping("TempBoard.do")
	public String TempBoard() {
		return "redirect:selectAllBoard.do";
	}
}
