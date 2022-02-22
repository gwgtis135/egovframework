package egovframework.board.service;

import java.util.List;

public interface BoardService {
	public String insertBoard(BoardVO vo);
	public String deleteBoard(BoardVO vo);
	public String updateBoard(BoardVO vo);
	public BoardVO selectBoard(BoardVO vo);
	public List<BoardVO> selectAllBoard();
}
