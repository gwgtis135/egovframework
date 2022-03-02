package egovframework.board.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.board.service.BoardMapper;
import egovframework.board.service.BoardService;
import egovframework.board.service.BoardVO;
import egovframework.board.service.FileVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public String insertBoard(BoardVO vo) {
		vo.setCrud("ins");
		vo.setPerformer(vo.getUserid());
		mapper.insertBoard(vo);
		int boardid = mapper.getboardinc();
		System.out.println(boardid);
		List<FileVO> fvolist = vo.getFilevo();
		System.out.println(fvolist.size());
		for(int i = 0; i<fvolist.size();i++) {
			fvolist.get(i).setBoardId(boardid);
			System.out.println(i);
			System.out.println(fvolist.get(i));
			mapper.insertattachFile(fvolist.get(i));
		}
		vo.setId(boardid);
		System.out.println(boardid);
		mapper.insertBoardLog(vo);
		return "inserted!";
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
		return "deleted!";
	}

	@Override
	public String deleteBoard(BoardVO vo) {
		vo = mapper.selectBoard(vo);
		vo.setCrud("del");
		vo.setPerformer(vo.getUserid());
		mapper.insertBoardLog(vo);
		mapper.deleteBoard(vo);
		return "deleted!";
	}

	@Override
	public String updateBoard(BoardVO vo) {
		vo.setCrud("upd");
		vo.setPerformer(vo.getUserid());
		mapper.updateBoard(vo);
		mapper.insertBoardLog(vo);
		return "updated!";
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) {
		BoardVO rvo = mapper.selectBoard(vo);
		FileVO fvo = new FileVO();
		fvo.setBoardId(vo.getId());
		rvo.setFilevo(mapper.selectFile(fvo));
		return rvo;
	}

	@Override
	public List<BoardVO> selectAllBoard() {
		return mapper.selectAllBoard();
	}
}
