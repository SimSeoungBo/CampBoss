package com.example.demo.board;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {

	private int board_num;
	private String board_name;
	private String board_addr;
	private String board_info;
	private String board_id;
	private Date board_date;
	private int board_like;
	private int board_hate;
	private int boardcategory1_id;
	private int boardcategory2_id;
	private int boardcategory3_id;
	private int cbboard_hit;
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;

	public Board() {
		super();
	}

	public Board(int board_num, String board_name, String board_addr, String board_info, String board_id,
			Date board_date, int board_like, int board_hate, int boardcategory1_id, int boardcategory2_id,
			int boardcategory3_id, int cbboard_hit) {

		this.board_num = board_num;
		this.board_name = board_name;
		this.board_addr = board_addr;
		this.board_info = board_info;
		this.board_id = board_id;
		this.board_date = board_date;
		this.board_like = board_like;
		this.board_hate = board_hate;
		this.boardcategory1_id = boardcategory1_id;
		this.boardcategory2_id = boardcategory2_id;
		this.boardcategory3_id = boardcategory3_id;
		this.cbboard_hit = cbboard_hit;
	}

	public Board(int board_num, String board_name, String board_addr, String board_info, String board_id,
			Date board_date, int board_like, int board_hate, int boardcategory1_id, int boardcategory2_id,
			int boardcategory3_id, int cbboard_hit, MultipartFile file1, MultipartFile file2, MultipartFile file3) {

		this.board_num = board_num;
		this.board_name = board_name;
		this.board_addr = board_addr;
		this.board_info = board_info;
		this.board_id = board_id;
		this.board_date = board_date;
		this.board_like = board_like;
		this.board_hate = board_hate;
		this.boardcategory1_id = boardcategory1_id;
		this.boardcategory2_id = boardcategory2_id;
		this.boardcategory3_id = boardcategory3_id;
		this.cbboard_hit = cbboard_hit;
		this.file1 = file1;
		this.file2 = file2;
		this.file3 = file3;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public String getBoard_addr() {
		return board_addr;
	}

	public void setBoard_addr(String board_addr) {
		this.board_addr = board_addr;
	}

	public String getBoard_info() {
		return board_info;
	}

	public void setBoard_info(String board_info) {
		this.board_info = board_info;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_like() {
		return board_like;
	}

	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	public int getBoard_hate() {
		return board_hate;
	}

	public void setBoard_hate(int board_hate) {
		this.board_hate = board_hate;
	}

	public int getBoardcategory1_id() {
		return boardcategory1_id;
	}

	public void setBoardcategory1_id(int boardcategory1_id) {
		this.boardcategory1_id = boardcategory1_id;
	}

	public int getBoardcategory2_id() {
		return boardcategory2_id;
	}

	public void setBoardcategory2_id(int boardcategory2_id) {
		this.boardcategory2_id = boardcategory2_id;
	}

	public int getBoardcategory3_id() {
		return boardcategory3_id;
	}

	public void setBoardcategory3_id(int boardcategory3_id) {
		this.boardcategory3_id = boardcategory3_id;
	}

	public int getCbboard_hit() {
		return cbboard_hit;
	}

	public void setCbboard_hit(int cbboard_hit) {
		this.cbboard_hit = cbboard_hit;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	@Override
	public String toString() {
		return "Board [board_num=" + board_num + ", board_name=" + board_name + ", board_addr=" + board_addr
				+ ", board_info=" + board_info + ", board_id=" + board_id + ", board_date=" + board_date
				+ ", board_like=" + board_like + ", board_hate=" + board_hate + ", boardcategory1_id="
				+ boardcategory1_id + ", boardcategory2_id=" + boardcategory2_id + ", boardcategory3_id="
				+ boardcategory3_id + ", cbboard_hit=" + cbboard_hit + ", file1=" + file1 + ", file2=" + file2
				+ ", file3=" + file3 + "]";
	}

}
