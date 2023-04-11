package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("/Mypage.me")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
		HttpSession session = request.getSession();
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		Attachment at = new MemberService().memberListImg(loginUser.getUserId());
		ArrayList<Board> list = new MemberService().myPageBoardList(loginUser.getUserNo());
		
		
		if(at != null) {
			loginUser.setFileName(at.getFilePath() + at.getChangeName());
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/member/Mypage.jsp").forward(request, response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
