package com.example.demo.member;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	
	public void addMember(Member m) {
		mapper.insert(m);
	}

	public Member getMember(String user_id) {
		return mapper.select(user_id);
	}

	public void editMember(Member m) {
		mapper.update(m);
	}

	public void delMember(String user_id) {
		mapper.delete(user_id);
	}
	
	public List selectAll() {
		return mapper.selectAll();
	}
}
