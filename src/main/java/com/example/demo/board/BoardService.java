package com.example.demo.board;

import java.util.List;

import org.apache.logging.log4j.message.ReusableMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.stereotype.Service;

@Service
public class BoardService {

	@Autowired
	
	private BoardMapper mapper;
	
	public void addBoard(Board b) {
		mapper.insert(b);
	}
	
	public Board getBoard(String board_id) {
		return mapper.select(board_id);
	}
	
	public Board getBoardByNum(int board_num) {
		return mapper.selectByNum(board_num);
	}
	
	public List getBoardByName(String board_name) {
		return mapper.selectByName(board_name);
	}
	
	public List getBoardByBoardid(String board_id) {
		return mapper.selectByBoardid(board_id);
	}
	
	public List getBoardByC1(int c1) {
		return mapper.selectByC1(c1);
	}

	public List getBoardByC2(int c2) {
		return mapper.selectByC2(c2);
	}

	public List getBoardByC3(int c3) {
		return mapper.selectByC3(c3);
	}
	
	public List getBoardAll() {
		return mapper.selectAll();
	}
	
	public void editBoard(Board b) {
		mapper.update(b);
	}
	
	public void delBoard(int board_num) {
		mapper.delete(board_num);
	}
	
	public void editCbboard_hit(int board_num) {
		mapper.editCbboard_hit(board_num);
	}
	public int getNum() {
		return mapper.getNum();
	}
	
	
	public void uplike(int board_num) {
		mapper.uplike(board_num);
	}
	
	public void uphate(int board_num) {
		mapper.uphate(board_num);
	}
}
