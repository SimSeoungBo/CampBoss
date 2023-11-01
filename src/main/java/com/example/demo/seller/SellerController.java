package com.example.demo.seller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.weaving.DefaultContextLoadTimeWeaver;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.example.demo.admin.AdminService;
import com.example.demo.member.Member;

import com.example.demo.reply.Reply;



@Controller
public class SellerController {

	@Autowired
	private SellerService service;
	
	

	public static String basePath = "C:\\shopimg\\";
	
	
	// 상품 리스트 전체 및 검색 출력
	
		@GetMapping(value = "/product/productPage")
		public ModelAndView productPage() {
				ModelAndView mav = new ModelAndView("product/productPage");
				ArrayList<Product> list = (ArrayList<Product>) service.getProductAll();
				mav.addObject("list", list);
			return mav;
		}
	
		@RequestMapping(value = "/seller/allList")
		public ModelAndView allList() {
			ModelAndView mav = new ModelAndView("product/productPage");
			ArrayList<Product> list = (ArrayList<Product>) service.getProductAll();
			mav.addObject("list", list);
			return mav;
		}


		@RequestMapping(value = "/seller/cateList")
		public ModelAndView cateList(@RequestParam(value = "c1", required = true) int c1,
				@RequestParam(value = "c2", required = false, defaultValue = "0") int c2,
				@RequestParam(value = "c3", required = false, defaultValue = "0") int c3) {
			ModelAndView mav = new ModelAndView("product/productPage");
			ArrayList<Product> list = null;
			if (c2 == 0) {
				list = (ArrayList<Product>) service.getProductByC1(c1);
			} else if (c3 == 0) {
				list = (ArrayList<Product>) service.getProductByC2(c2);
			} else {
				list = (ArrayList<Product>) service.getProductByC3(c3);
			}
			mav.addObject("list", list);
			return mav;
		}

		@RequestMapping(value = "/seller/nameList")
		public ModelAndView nameList(@RequestParam(value = "name") String name) {
			ModelAndView mav = new ModelAndView("product/productPage");
			ArrayList<Product> list = (ArrayList<Product>) service.getProductByName(name);
			mav.addObject("list", list);
			return mav;
		}

		
		@RequestMapping(value = "/seller/sellerList")
		public ModelAndView sellerList(@RequestParam(value = "seller_id") String seller_id) {
			ModelAndView mav = new ModelAndView("product/productPage");
			ArrayList<Product> list = (ArrayList<Product>) service.getProductBySellerId(seller_id);
			mav.addObject("list", list);
			return mav;
		}
	
	
	// 판매리스트 출력 
		
	@RequestMapping(value = "/product/productList")
	public ModelAndView cbList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("product/productList");
		HttpSession session = req.getSession(false);
		String seller_id = (String)session.getAttribute("user_id");
		
		ArrayList<Product> list = (ArrayList<Product>) service.getProductBySellerId(seller_id);
		
		for(int i = 0; i < list.size(); i++ ) {
			Product p = list.get(i);
			p.setSeller_id(seller_id);
		}
		mav.addObject("list",list);
		return mav;
	}
	
	// 상품등록
	
	@RequestMapping(value = "/product/productAdd")
	public void add() {
		
	}
	@RequestMapping(value = "/seller/add")
	public String add(Product p) {
		int num = service.getNum();
		p.setNum(num);
		service.addProduct(p);
		saveImg(num, p.getFile1());
		saveImg(num, p.getFile2());
		saveImg(num, p.getFile3());
		return "redirect:/product/productPage";
	}
	@RequestMapping(value = "/cbproduct/cbForm")
	public void form() {

	}

	
	// 상품상세페이지 
	@RequestMapping(value = "/product/productView")
	public ModelAndView view(@RequestParam(value = "num") int num, @RequestParam(value = "type") int type) {
		ModelAndView mav = new ModelAndView();
		service.editCbproduct_hit(num);
		if (type == 1) {
			mav.setViewName("product/productView");
		}

		Product p = service.getProductByNum(num);
		String path = basePath + p.getNum() + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				mav.addObject("file" + j, files[j]);
			}
		}

		mav.addObject("p", p);
		return mav;
	}
	
	
	//이미지 파일 
	@RequestMapping("/img")
	public ResponseEntity<byte[]> getImg(String fname, int num) {
		String path = basePath + num + "\\" + fname;
		File f = new File(path);
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
	
	public void saveImg(int num, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			File dir = new File(basePath + num);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File f = new File(basePath + num + "\\" + fileName);
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 상품수정 및 삭제
	@RequestMapping(value = "/product/productEdit")
	public ModelAndView productEdit(@RequestParam(value = "num") int num) {
		ModelAndView mav = new ModelAndView();
		
		Product p = service.getProductByNum(num);
		String path = basePath + p.getNum() + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				mav.addObject("file" + j, files[j]);
			}
		}

		mav.addObject("p", p);
		return mav;
	}

	
	@RequestMapping(value = "/product/edit")
	public String edit(Product p) {
		service.editProduct(p);
		return "product/productPage";
	}

	//삭제
	@RequestMapping(value = "/seller/del")
	public String del(@RequestParam(value = "num") int num) {
		service.delProduct(num);
		String path = basePath + num + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		imgDir.delete();
		return "product/productPage";
	}
	
	@PostMapping(value = "/seller/reset")
	public String reset() {
		
		return "redirect:/product/productPage";
	}
	



	
	//상품전체출력 (관리자 )
	@RequestMapping(value = "/admin/productList")
	public ModelAndView porList() {
		ModelAndView mav = new ModelAndView("admin/productList");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductAll();
		mav.addObject("list", list);
		return mav;
	}
	
	//상품리스트 삭제(관리자 )
	@RequestMapping(value = "/seller/prodel")
	public String prodel(@RequestParam(value = "num") int num) {
		service.delProduct(num);
		String path = basePath + num + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		imgDir.delete();
		
	    ModelAndView mav = new ModelAndView("admin/productList");
	    ArrayList<Product> list = (ArrayList<Product>) service.getProductAll();
	    mav.addObject("list", list);
	    return "redirect:/admin/productList";
		
	}

	
}
