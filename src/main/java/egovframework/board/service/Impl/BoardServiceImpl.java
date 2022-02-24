package egovframework.board.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.board.service.BoardService;
import egovframework.board.service.BoardVO;
import egovframework.board.service.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public String insertBoard(BoardVO vo) {
		vo.setCrud("ins");
		vo.setPerformer(vo.getAuthor_id());
		int i = 1;
//		i=i/0;
		mapper.insertBoard(vo);
		vo.setId(mapper.getboardinc());
		mapper.insertBoardLog(vo);
		return "aa";
	}

	@Override
	public String deleteBoards(String check) {
		String[] sc = check.split(",");
		BoardVO vo = new BoardVO();
		for (String c : sc) {
			vo.setId(Integer.parseInt(c));
			vo = mapper.selectBoard(vo);
			vo.setCrud("del");
			vo.setPerformer("admin");
			mapper.insertBoardLog(vo);
			mapper.deleteBoard(vo);
		}
		return "bb";
	}

	@Override
	public String deleteBoard(BoardVO vo) {
		vo = mapper.selectBoard(vo);
		vo.setCrud("del");
		vo.setPerformer(vo.getAuthor_id());
		mapper.insertBoardLog(vo);
		mapper.deleteBoard(vo);
		return "cc";
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
