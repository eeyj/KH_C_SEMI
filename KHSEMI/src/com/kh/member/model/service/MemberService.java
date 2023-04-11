package com.kh.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.pet.model.vo.Pet;

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
	
	public Member memberListDetail(String userId) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().selectMember(conn, userId);
		
		close(conn);
		
		return m;
	}
	
	public Attachment memberListImg(String userId){
		Connection conn = getConnection();
		
		Attachment at = new MemberDao().memberListImg(conn, userId);
		
		close(conn);
		
		return at;
	}
	
	public String updateStatusM(String status, String userId) {
		Connection conn = getConnection();
		
		
		int result =  new MemberDao().updateStatusM(conn, userId, status);
		
		String updateStatus = null;
		
		if(result > 0) {
			commit(conn);
			
			updateStatus = new MemberDao().selectStatus(conn, userId);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateStatus;
	}
	
	public ArrayList<Board> myPageBoardList(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new MemberDao().myPageBoardList(conn, userNo);
		
		close(conn);
		
		return list;
		
	}
	
}
