package egovframework.board.service;

public class BoardVO {

	int log_id;
	String crud;
	String performer;
	int id;
	String title;
	String content;
	String author_id;
	public int getLog_id() {
		return log_id;
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
	public String getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}
	@Override
	public String toString() {
		return "BoardVO [log_id=" + log_id + ", crud=" + crud + ", performer=" + performer + ", id=" + id + ", title="
				+ title + ", content=" + content + ", author_id=" + author_id + "]";
	}

}
