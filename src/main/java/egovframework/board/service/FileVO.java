package egovframework.board.service;

public class FileVO {
	int id;
	int board_id;
	String file_path;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.board_id=id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	@Override
	public String toString() {
		return "FileVO [id=" + id + ", board_id=" + board_id + ", file_path=" + file_path + "]";
	}
}
