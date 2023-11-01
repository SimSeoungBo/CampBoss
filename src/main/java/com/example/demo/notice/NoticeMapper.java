package com.example.demo.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {
    
    
    void insert(Notice n);
    Notice select(String notice_id);
    Notice selectByNum(int notice_num);


    List selectByName(String notice_name);
    List selectByNoticeId(String notice_id);
    List selectAll();

    void update(Notice n);
	void uplike(int notice_num);
	void uphate(int notice_num);
	
    void delete(int notice_num);
    int getNum();
    

}