package com.example.demo.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	
	void insertC1(Category c);

	List selectAllC1();

	Category selectC1(int id);

	void deleteC1(int id);


	
	void insertC2(Category c);

	List selectAllC2(int p_id);

	Category selectC2(int id);

	void deleteC2(int id);
	
	
	

	void insertC3(Category c);

	List selectAllC3(int p_id);

	Category selectC3(int id);

	void deleteC3(int id);

}
