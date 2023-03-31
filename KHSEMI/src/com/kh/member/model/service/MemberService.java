package com.kh.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.board.model.vo.Attachment;
import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return m;
		
	}
	
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
		
	}
	
	
	public int insertProfileImg(int userNo, Attachment at) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertProfileImg(conn, userNo, at);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	public ArrayList<Attachment> selectProfileImg(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new MemberDao().selectProfileImg(conn, userNo);
		
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<Member> selectMemberList(){
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberList(conn);
		
		close(conn);
		
		return list;
		
		
	}
	
}
