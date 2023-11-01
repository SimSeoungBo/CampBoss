package com.example.demo.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

	@Autowired
	private CategoryMapper mapper;

	public void addCategory(Category c, int type) { //카테고리  추가 

		switch (type) {
		case 1:
			mapper.insertC1(c);
			break;
		case 2:
			mapper.insertC2(c);
			break;
		case 3:
			mapper.insertC3(c);
			break;
		}
	}

	public List getAll(int type, int p_id) { // 카테고리 전체 출력 
		List list = null;

		switch (type) {
		case 1:
			list = mapper.selectAllC1();
			break;
		case 2:
			list = mapper.selectAllC2(p_id);
			break;
		case 3:
			list = mapper.selectAllC3(p_id);
			break;
		}
		return list;
	}

	public Category getCategory(int id, int type) {
		Category category = null;

		switch (type) {
		case 1:
			category = mapper.selectC1(id);
			break;
		case 2:
			category = mapper.selectC2(id);
			break;
		case 3:
			category = mapper.selectC3(id);
			break;
		}
		return category;
	}

	public void delCategory(int id, int type) {
		switch (type) {
		case 1:
			mapper.deleteC1(id);
			break;
		case 2:
			mapper.deleteC2(id);
			break;
		case 3:
			mapper.deleteC3(id);
			break;
		}
	}
}
