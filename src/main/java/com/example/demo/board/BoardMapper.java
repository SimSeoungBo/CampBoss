package com.example.demo.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {

	void insert(Board b);
	
	Board select(String board_id);
	Board selectByNum(int board_num);
	
	List selectByName(String board_name);
	List selectByBoardid(String boara_id);
	List selectByC1(int c1);
	List selectByC2(int c2);
	List selectByC3(int c3);
	List selectAll();
	
	void update(Board b);
	void uplike(int board_num);
	void uphate(int board_num);
	
	void delete(int board_num);
	void editCbboard_hit(int board_num);
	int getNum();
}
