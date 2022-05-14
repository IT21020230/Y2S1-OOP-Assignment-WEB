package com.popcorntime.authentication;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.popcorntime.dbutil.UserDBUtil;


/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String email = request.getParameter("txtEmail");
		String username = request.getParameter("txtUsername");
		String password = request.getParameter("txtPassword");
		
		boolean isTrue;
		
		isTrue = UserDBUtil.registertUser(email, username, password);
		
		if(isTrue == true) {
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("loginregister.jsp");
			requestdispatcher.forward(request, response);
		} else {
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("register.jsp");
			requestdispatcher.forward(request, response);
		}
	}

}
