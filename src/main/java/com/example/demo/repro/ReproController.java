package com.example.demo.repro;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ReproController {

	@Autowired
	private ReproService service;
	
	@RequestMapping(value="/repro/writepro")
	public String writepro(Repro r){
		service.addRepro(r);
		return "redirect:/repro/listpro?repro_num="+r.getRepro_num();
	}
	
	@RequestMapping(value="/repro/listpro")
	public ModelAndView listpro(@RequestParam(value="repro_num")int repro_num){
		ArrayList<Repro> list = 
				(ArrayList<Repro>) service.getByrepro_num(repro_num);
		ModelAndView mav = new ModelAndView("product/listRep");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/repro/printpro")
	public String printpro(Repro r){
		return "redirect:/repro/listpro?repro_num="+r.getRepro_num();
	}
}
