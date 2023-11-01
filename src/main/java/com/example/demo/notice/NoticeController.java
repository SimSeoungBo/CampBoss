package com.example.demo.notice;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.board.Board;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class NoticeController {
   @Autowired
   private NoticeService service;

   public static String basePath = "C:\\boardimg\\";

   // 일반회원 입장 및 리스트
   @RequestMapping(value = "/notice/noticeList1")
   public ModelAndView memnolist() {
      ModelAndView mav = new ModelAndView("notice/noticeList1");
      ArrayList<Notice> list = (ArrayList<Notice>) service.getNoticeAll();
      mav.addObject("list", list);
      return mav;
   }

   // 관리자 로그인 및 리스트
   @RequestMapping(value = "/notice/noticeList2")
   public ModelAndView noticeList2() {
      ModelAndView mav = new ModelAndView("notice/noticeList2");
      ArrayList<Notice> list = (ArrayList<Notice>) service.getNoticeAll();
      mav.addObject("list", list);
      return mav;
   }

   // 관리자 공지사항 작성
   @RequestMapping(value = "/notice/noticeAdd")
   public void noticeAdd() {
   }

   @RequestMapping(value = "/notice/add")
   public String add(Notice n) {
      int notice_num = service.getNum();
      n.setNotice_num(notice_num);
      service.addNotice(n);
      return "redirect:/notice/noticeList2";
   }

   // 상세페이지 확인 일반 list1 -> view
   @RequestMapping(value = "/notice/noticeView")
   public ModelAndView noticeView(@RequestParam(value = "notice_num") int notice_num) {
      ModelAndView mav = new ModelAndView("notice/noticeView");
      Notice notice = service.getNoticeByNum(notice_num);
      mav.addObject("n", notice);

      return mav;
   }

   // 수정
   @RequestMapping(value = "notice/noticeEdit", method = RequestMethod.POST)
   public void noticeEdit(HttpServletResponse response, @RequestParam HashMap<String, String> param) throws IOException {   // @RequestBody contenttype ==> application/json @RequestParam --> application/json 제외
      Notice n = service.getNoticeByNum(Integer.parseInt(param.get("notice_num").toString()));
      n.setNotice_name(param.get("noticeName"));
      n.setNotice_info(param.get("noticeInfo"));
      service.editNotice(n);
      response.sendRedirect("/notice/noticeList2");
   }

   // 수정
   @RequestMapping(value = "/notice/View")
   public String edit(Notice n) {
      service.editNotice(n);
      return "notice/noticeList2";
   }

   // 삭제

   @RequestMapping(value="notice/del", method= RequestMethod.GET)
   public String getDelete(@RequestParam(value = "notice_num")int delNotice) throws Exception{
      service.delNotice(delNotice);
      return "redirect:/notice/noticeList2";
   }
   
         //좋아요
       @RequestMapping(value = "/notice/uplike")
       public ModelAndView uplike(@RequestParam(value = "notice_num") int notice_num, @RequestParam(value = "type") int type) {
          ModelAndView mav = new ModelAndView();
          service.uplike(notice_num);
          if(type == 1) {
             mav.setViewName("notice/noticeView");
          }
          Notice n = service.getNoticeByNum(notice_num);

          mav.addObject("n",n);
          return mav;
       }
       //싫어요
       @RequestMapping(value = "/notice/uphate")
       public ModelAndView uphate(@RequestParam(value = "notice_num") int notice_num, @RequestParam(value = "type") int type) {
          ModelAndView mav = new ModelAndView();
          service.uphate(notice_num);
          if(type == 1) {
             mav.setViewName("notice/noticeView");
          }         
          Notice n = service.getNoticeByNum(notice_num);

          mav.addObject("n",n);
          return mav;
       }
   
}