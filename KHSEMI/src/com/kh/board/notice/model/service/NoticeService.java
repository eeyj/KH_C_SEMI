package com.kh.board.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Board;
import com.kh.board.notice.model.dao.NoticeDao;

import static com.kh.common.JDBCTemplate.*;

public class NoticeService {

	public ArrayList<Board> selectNoticeList(){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	
}
