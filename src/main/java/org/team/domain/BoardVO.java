package org.team.domain;

import java.sql.Timestamp;

public class BoardVO {

	//DB 자료
//	create table tbl_board(
//			bno int auto_increment,
//			title varchar(1000) not null,
//			content text not null,
//			writer varchar(500) not null,
//			regdate timestamp default now(),
//			updatedate timestamp default now(),
	
	private Integer bno;
	private String title, content, writer;
	private Timestamp regdate, updatedate;
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", updatedate=" + updatedate + "]";
	}
}


