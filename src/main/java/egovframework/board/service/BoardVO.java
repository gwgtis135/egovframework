package egovframework.board.service;

import java.util.List;

public class BoardVO {

	int log_id;
	String crud;
	String performer;
	int id;
	String title;
	String content;
	String userid;
	String createdDate;
	List<FileVO> filevo;
	public List<FileVO> getFilevo() {
		return filevo;
	}
	public void setFilevo(List<FileVO> filevo) {
		this.filevo = filevo;
	}
	public int getLog_id() {
		return log_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}
	public String getCrud() {
		return crud;
	}
	public void setCrud(String crud) {
		this.crud = crud;
	}
	public String getPerformer() {
		return performer;
	}
	public void setPerformer(String performer) {
		this.performer = performer;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	@Override
	public String toString() {
		return "BoardVO [log_id=" + log_id + ", crud=" + crud + ", performer=" + performer + ", id=" + id + ", title="
				+ title + ", content=" + content + ", userid=" + userid + ", createdDate=" + createdDate
				+ ", fileVO" + filevo.toString() + "]";
	}

}
