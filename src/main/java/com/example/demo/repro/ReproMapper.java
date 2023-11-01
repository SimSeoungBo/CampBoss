package com.example.demo.repro;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReproMapper {

	void insert(Repro r);
	
	Repro select(int num);
	
	List selectByrepro_num(int repro_num);
	
	void delete(int repro_num);
}
