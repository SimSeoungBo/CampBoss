package com.example.demo.member;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	

	void insert(Member m);

	Member select(String user_id);

	void update(Member m);

	void delete(String user_id);
	
	List selectAll();
}
