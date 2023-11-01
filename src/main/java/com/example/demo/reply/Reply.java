package com.example.demo.reply;

public class Reply {
	private int num;
	private int re_num;
	private String content;
	private String writer_id;
	
	public Reply(){}
	
	public Reply(int num, int re_num, String content, String writer_id) {
		this.num = num;
		this.re_num = re_num;
		this.content = content;
		this.writer_id = writer_id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRe_num() {
		return re_num;
	}

	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	@Override
	public String toString() {
		return "Reply [num=" + num + ", re_num=" + re_num + ", content=" + content + ", writer_id=" + writer_id + "]";
	}

	
	
}
