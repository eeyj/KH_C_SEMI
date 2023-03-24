package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminProfileController
 */
@WebServlet("/adminProfile")
public class AdminProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/admin/adminProfile.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("username");
		String userNickname = request.getParameter("userNickname");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("newPwd");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String pet = request.getParameter("pet");
		
		Member m = new Member();
		m.setUserName(userName);
		m.setUserNickname(userNickname);
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.set
		
		Member updateMem = new MemberService().updateMember(m);
	}

}
