package com.example.demo.reply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RepController {
	
	@Autowired
	private RepService service;

	@RequestMapping(value="/rep/write")
	public String write(Reply r){
		service.addReply(r);
		return "redirect:/rep/list?re_num="+r.getRe_num();
	}
	
	@RequestMapping(value="/rep/list")
	public ModelAndView list(@RequestParam(value="re_num")int re_num){
		ArrayList<Reply> list = 
				(ArrayList<Reply>) service.getByre_num(re_num);
		ModelAndView mav = new ModelAndView("board/listRep");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/rep/print")
	public String print(Reply r){
		return "redirect:/rep/list?re_num="+r.getRe_num();
	}
	
	
	
}
