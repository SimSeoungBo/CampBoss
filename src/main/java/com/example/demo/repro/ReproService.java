package com.example.demo.repro;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReproService {
	
	@Autowired
	private ReproMapper mapper;
	
	public void addRepro(Repro r) {
		mapper.insert(r);
	}
	
	public Repro getRepro(int num) {
		return mapper.select(num);
	}
	
	public List getByrepro_num(int repro_num) {
		return mapper.selectByrepro_num(repro_num);
	}
	
	public void delRepro(int num) {
		mapper.delete(num);
	}
}
