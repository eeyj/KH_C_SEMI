package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.vo.Attachment;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.service.MemberService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProfileImgController
 */
@WebServlet("/profileImg")
public class ProfileImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileImgController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/profile_upfiles/");
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String key = "file";
			int userNo = Integer.parseInt(multi.getParameter("userNo"));
			
			Attachment at = new Attachment();
			at.setOriginName(multi.getOriginalFileName(key));
			at.setChangeName(multi.getFilesystemName(key));
			at.setFilePath("/resources/profile_upfiles/");
			
			int result = new MemberService().insertProfileImg(userNo, at);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/adminProfile");
			}else {
				request.setAttribute("errorMsg", "사진게시판 업로드 실팬");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
		
		
		
	}

}
