package com.example.demo.seller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	void insert(Product p);
	Product select(String seller_id);
	Product selectByNum(int num);
	List selectByName(String name);
	List selectBySellerId(String seller_id);
	List selectByC1(int c1);
	List selectByC2(int c2);
	List selectByC3(int c3);
	List selectAll();
	void update(Product p);
	void delete(int num);
	void editCbproduct_hit(int num);
	int getNum();
}
