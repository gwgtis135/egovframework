package egovframework.board.web;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.board.service.BoardService;
import egovframework.board.service.BoardVO;
import egovframework.board.service.FileVO;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping("selectAllBoard.do")
	public String selectAllBoard(Model model,HttpServletRequest req) {
		System.out.println("selectAllboard");
		List<BoardVO> list = service.selectAllBoard();
		System.out.println(list.toString());
		model.addAttribute("boardlist",list);
		model.addAttribute("result", req.getParameter("result"));
		return "Board/BoardList";
	}
	
	@RequestMapping("insertBoard.do")
	public String insertBoard() {
		return "Board/BoardInsert";
	}
	
	@RequestMapping("BoardInsert.do")
	public String boardInsert(Model model,HttpServletRequest request) {
		BoardVO vo = new BoardVO();
		List<FileVO> fvolist = new ArrayList<FileVO>();
		System.out.println("BoardInsert.do");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String realPath = "";
		String savePath = "fileSave";
		String type = "utf-8";
		int maxSize = 10*1024*1024; // 10mb
		ServletContext context = request.getServletContext();
		realPath = context.getRealPath(savePath);
		try {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			diskFileItemFactory.setRepository(new File(realPath));
			diskFileItemFactory.setSizeThreshold(maxSize);
			diskFileItemFactory.setDefaultCharset(type);
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);

			List<FileItem> items = fileUpload.parseRequest(request);
			for (FileItem item : items) {
				if (item.isFormField()) {
					System.out.println(String.format("[파일형식이 아닌 파라미터] 파라미터명: %s, 파일 명: %s, 파일크기: %s bytes <br>",
							item.getFieldName(), item.getString(), item.getSize()));
					switch (item.getFieldName()) {
					case "title":
						vo.setTitle(item.getString());
						break;
					case "userid":
						vo.setTitle(item.getString());
						break;
					case "content":
						vo.setTitle(item.getString());
						break;
					}
					
				} else {
					System.out.println(String.format("[파일형식 파라미터] 파라미터명: %s, 파일 명: %s, 파일 크기: %s bytes <br>",
							item.getFieldName(), item.getName(), item.getSize()));
					if (item.getSize() > 0) {
						FileVO fvo = new FileVO();
						String separator = File.separator;
						System.out.println("1" + separator);
						int index = item.getName().lastIndexOf(separator);
						String fileName = item.getName().substring(index + 1);
						System.out.println("2" + fileName);
						File uploadFile = new File(realPath + separator + fileName);
						System.out.println("3" + uploadFile);
						System.out.println("3" + realPath);
						item.write(uploadFile);
						System.out.println("4" + separator);
						fvo.setFile_path(realPath+separator+fileName);
						fvolist.add(fvo);
					}
				}

			}
			vo.setFilevo(fvolist);
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("에러");
			e.printStackTrace();
		}
		System.out.println(vo.toString());
//		String result = service.insertBoard(vo);
		String result="";
		model.addAttribute("result", result);
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
	public String deleteBoards(HttpServletRequest req,Model model) {
		String check = req.getParameter("check");
		System.out.println(check);
		String result = service.deleteBoards(check);
		model.addAttribute("result", result);
		return "redirect:TempBoard.do";
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(HttpServletRequest req,Model model) {
		BoardVO vo = new BoardVO();
		vo.setId(Integer.parseInt(req.getParameter("id")));
		String result = service.deleteBoard(vo);
		model.addAttribute("result", result);
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
	
	@RequestMapping("BoardUpdate.do")
	public String boardUpdate(BoardVO vo,Model model) {
		System.out.println(vo.toString());
		String result = service.updateBoard(vo);
		model.addAttribute("result", result);
		model.addAttribute("id", vo.getId());
		return "redirect:TempBoard.do";
	}
	
	@RequestMapping("TempBoard.do")
	public String TempBoard(HttpServletRequest req,Model model) {
		model.addAttribute("result", req.getParameter("result"));
		return "redirect:selectAllBoard.do";
	}
}
