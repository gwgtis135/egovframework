package egovframework.board.service;

public class FileVO {
	int id;
	int boardId;
	String fileName;
	String filePath;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id=id;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int board_id) {
		this.boardId = board_id;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String file_path) {
		this.filePath = file_path;
	}
	public String getfileName() {
		return fileName;
	}
	public void setfileName(String file_name) {
		this.fileName = file_name;
	}
	@Override
	public String toString() {
		return "FileVO [id=" + id + ", board_id=" + boardId + ", file_path=" + filePath + ", file_name=" + fileName + "]";
	}
}
