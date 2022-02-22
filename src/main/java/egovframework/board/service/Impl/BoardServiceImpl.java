package egovframework.board.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.board.service.BoardService;
import egovframework.board.service.BoardVO;
import egovframework.board.service.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired 
	private BoardMapper mapper;

	@Override
	public String insertBoard(BoardVO vo) {
		vo.setCrud("ins");
		mapper.insertBoard(vo);
		mapper.insertBoardLog(vo);
		return "aa";
	}

	@Override
	public String deleteBoard(BoardVO vo) {
		vo.setCrud("del");
		mapper.deleteBoard(vo);
		mapper.insertBoardLog(vo);
		return null;
	}

	@Override
	public String updateBoard(BoardVO vo) {
		vo.setCrud("upd");
		mapper.updateBoard(vo);
		mapper.insertBoardLog(vo);
		return null;
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) {
		
		return mapper.selectBoard(vo);
	}

	@Override
	public List<BoardVO> selectAllBoard() {
		
		return mapper.selectAllBoard();
	}

}
