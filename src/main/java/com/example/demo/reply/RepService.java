package com.example.demo.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RepService {

	@Autowired
	private RepMapper mapper;

	public void addReply(Reply r) {
		mapper.insert(r);
	}

	public Reply getReply(int num) {
		return mapper.select(num);
	}

	public List getByre_num(int re_num) {
		return mapper.selectByre_num(re_num);
	}

	public void delReply(int num) {
		mapper.delete(num);
	}
}
