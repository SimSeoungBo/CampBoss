package com.example.demo.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RepMapper {
	void insert(Reply r);

	Reply select(int num);

	List selectByre_num(int re_num);

	void delete(int re_num);
}
