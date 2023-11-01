package com.example.demo.board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.naming.directory.SchemaViolationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.example.demo.seller.Product;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	public static String basePath = "C:\\boardimg\\";
	
	
	// 게시글 전체출력 및 검색
	
	@GetMapping(value = "/board/boardPage")
	public ModelAndView boardPage() {
			ModelAndView mav = new ModelAndView("board/boardPage");
			ArrayList<Board> list = (ArrayList<Board>) service.getBoardAll();
			mav.addObject("list", list);
			return mav;
	}
	
	@RequestMapping(value = "/board/allList")
	public ModelAndView allList() {
		ModelAndView mav = new ModelAndView("board/boardPage");
		ArrayList<Board> list = (ArrayList<Board>) service.getBoardAll();
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value = "/board/cateList")
	public ModelAndView cateList(@RequestParam(value = "c1", required = true) int c1,
			@RequestParam(value = "c2", required = false, defaultValue = "0") int c2,
			@RequestParam(value = "c3", required = false, defaultValue = "0") int c3) {
		ModelAndView mav = new ModelAndView("board/boardPage");
		ArrayList<Board> list = null;
		
		if(c2 == 0) {
			list = (ArrayList<Board>) service.getBoardByC1(c1);
		} else if(c3 == 0) {
			list = (ArrayList<Board>) service.getBoardByC2(c2);
		} else {
			list = (ArrayList<Board>) service.getBoardByC3(c3);
		}
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value = "/board/board_nameList")
	public ModelAndView board_nameList(@RequestParam(value = "board_name") String board_name) {
		ModelAndView mav = new ModelAndView("board/boardPage");
		ArrayList<Board> list = (ArrayList<Board>) service.getBoardByName(board_name);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value = "/board/board_idList")
	public ModelAndView board_idList(@RequestParam(value = "board_id") String board_id) {
		ModelAndView mav = new ModelAndView("board/boardPage");
		ArrayList<Board> list = (ArrayList<Board>) service.getBoardByBoardid(board_id);
		mav.addObject("list",list);
		return mav;
	}
	
	
	//이미지
	@RequestMapping("/boardimg")
	public ResponseEntity<byte[]> getImg(String fname, int board_num) {
		String path = basePath + board_num + "\\" + fname;
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
	
	public void saveImg(int board_num, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			File dir = new File(basePath + board_num);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File f = new File(basePath + board_num + "\\" + fileName);
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
	
	// 게시글 등록
	
	@RequestMapping(value = "/board/boardAdd")
	public void add() {
		
	}
	
	@RequestMapping(value = "/board/add")
	public String add(Board b) {
		int board_num = service.getNum();
		b.setBoard_num(board_num);
		service.addBoard(b);
		saveImg(board_num, b.getFile1());
		saveImg(board_num, b.getFile2());
		saveImg(board_num, b.getFile3());
		return "redirect:/board/boardPage";
	}
	
	
	// 내가 작성한 글 리스트 출력
	
	@RequestMapping(value = "/board/boardList")
	public ModelAndView boardList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView( "/board/boardList");
		HttpSession session = req.getSession(false);
		
		String board_id = (String)session.getAttribute("user_id");
		
		ArrayList<Board> list = (ArrayList<Board>) service.getBoardByBoardid(board_id);
		
		for(int i = 0; i < list.size(); i++) {
			Board b = list.get(i);
			b.setBoard_id(board_id);
		}
		mav.addObject("list",list);
		return mav;
	}
	
	// 게시글 상세페이지
	
	@RequestMapping(value = "/board/boardView")
	public ModelAndView boardview(@RequestParam(value = "board_num") int board_num, @RequestParam(value = "type") int type) {
		ModelAndView mav = new ModelAndView();
		service.editCbboard_hit(board_num);
		if(type == 1) {
			mav.setViewName("board/boardView");
		}
		
		Board b = service.getBoardByNum(board_num);
		String path = basePath + b.getBoard_num() + "\\";
		File boardimgDir = new File(path);
		
		if(boardimgDir.exists()) {
			String[] files = boardimgDir.list();
			for(int j = 0; j<files.length; j++) {
				mav.addObject("file" + j,files[j]);
			}
		}
		
		mav.addObject("b",b);
		return mav;
	}
	
	// 게시글 수정 및 삭제 
	
	@RequestMapping(value = "/board/boardEdit")
	public ModelAndView boardEdit(@RequestParam(value = "board_num") int board_num) {
		ModelAndView mav = new ModelAndView();
		
		Board b = service.getBoardByNum(board_num);
		String path = basePath + b.getBoard_num() + "\\";
		File boardimgDir = new File(path);
		
		if(boardimgDir.exists()) {
			String [] files = boardimgDir.list()	;
			for(int j = 0; j < files.length; j++) {
				mav.addObject("file" + j, files[j]);
			}
		}
		
		mav.addObject("b",b);
		return mav;
	}
	
	@RequestMapping(value = "/board/edit")
	public String edit(Board b) {
		service.editBoard(b);
		return "board/boardPage";
	}
	
	//삭제
	@RequestMapping(value = "/board/del")
	public String del(@RequestParam(value = "board_num") int board_num) {
		service.delBoard(board_num);
		String path = basePath + board_num + "\\";
		File boardimgDir = new File(path);
		if(boardimgDir.exists()) {
			String[] files = boardimgDir.list();
			for(int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		boardimgDir.delete();
		return "board/boardPage";
	}
	
	@PostMapping(value = "/board/reset")
	public String reset() {
		return "redirect:/board/boardPage";
	}
	
	//게시글전체출력 (관리자 )
	@RequestMapping(value = "/admin/boardList")
	public ModelAndView boList() {
		ModelAndView mav = new ModelAndView("admin/boardList");
		ArrayList<Board> list = (ArrayList<Board>) service.getBoardAll();
		mav.addObject("list", list);
		return mav;
	}
	
	//게시글리스트 삭제(관리자 )
	@RequestMapping(value = "/board/bodel")
	public String bodel(@RequestParam(value = "num") int num) {
		service.delBoard(num);
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
		
	    ModelAndView mav = new ModelAndView("admin/boardList");
	    ArrayList<Board> list = (ArrayList<Board>) service.getBoardAll();
	    mav.addObject("list", list);
	    return "redirect:/admin/boardList";
		
	}
	
	//좋아요
		@RequestMapping(value = "/board/uplike")
		public ModelAndView uplike(@RequestParam(value = "board_num") int board_num, @RequestParam(value = "type") int type) {
			ModelAndView mav = new ModelAndView();
			service.uplike(board_num);
			if(type == 1) {
				mav.setViewName("board/boardView");
			}
			
			Board b = service.getBoardByNum(board_num);
			String path = basePath + b.getBoard_num() + "\\";
			File boardimgDir = new File(path);
			
			if(boardimgDir.exists()) {
				String[] files = boardimgDir.list();
				for(int j = 0; j<files.length; j++) {
					mav.addObject("file" + j,files[j]);
				}
			}
			
			mav.addObject("b",b);
			return mav;
		}
	//싫어요
		@RequestMapping(value = "/board/uphate")
		public ModelAndView uphate(@RequestParam(value = "board_num") int board_num, @RequestParam(value = "type") int type) {
			ModelAndView mav = new ModelAndView();
			service.uphate(board_num);
			if(type == 1) {
				mav.setViewName("board/boardView");
			}
			
			Board b = service.getBoardByNum(board_num);
			String path = basePath + b.getBoard_num() + "\\";
			File boardimgDir = new File(path);
			
			if(boardimgDir.exists()) {
				String[] files = boardimgDir.list();
				for(int j = 0; j<files.length; j++) {
					mav.addObject("file" + j,files[j]);
				}
			}
			
			mav.addObject("b",b);
			return mav;
		}
}
