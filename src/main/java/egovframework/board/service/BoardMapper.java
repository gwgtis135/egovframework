package egovframework.board.service;

import java.util.List;

public interface BoardMapper {
	public int insertBoard(BoardVO vo);
	public int deleteBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public int insertBoardLog(BoardVO vo);
	public BoardVO selectBoard(BoardVO vo);
	public List<BoardVO> selectAllBoard();
}