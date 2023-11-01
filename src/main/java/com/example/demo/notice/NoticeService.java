package com.example.demo.notice;

import java.util.List;

import org.apache.logging.log4j.message.ReusableMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.stereotype.Service;

import com.example.demo.board.Board;

@Service
public class NoticeService {

    @Autowired
    private NoticeMapper mapper;

    public void addNotice(Notice n){
        mapper.insert(n);
    }

    public Notice getNotice(String notice_id){
        return mapper.select(notice_id);
    }

    public Notice getNoticeByNum(int notice_num){
        return mapper.selectByNum(notice_num);
    }

    public List getNoticeByName(String notice_name) {
      return mapper.selectByName(notice_name);
   }

    public List getNoticeByNoticeId(String notice_id) {
      return mapper.selectByNoticeId(notice_id);
   }

    public List getNoticeAll() {
      return mapper.selectAll();
   }

    public void editNotice(Notice n) {
      mapper.update(n);
   }

    public void delNotice(int notice_num) {
      mapper.delete(notice_num);
   }
   
   public int getNum() {
      return mapper.getNum();
   }
   
	public void uplike(int notice_num) {
		mapper.uplike(notice_num);
	}
	
	public void uphate(int notice_num) {
		mapper.uphate(notice_num);
	}
    
}