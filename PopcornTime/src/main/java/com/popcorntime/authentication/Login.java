package com.popcorntime.authentication;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.popcorntime.dbutil.UserDBUtil;
import com.popcorntime.role.User;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {			
			HttpSession session = request.getSession(true);
			
			String username = request.getParameter("txtUsername");
			String password = request.getParameter("txtPassword");
			
			boolean isTrue;
			isTrue = UserDBUtil.validateUser(username, password);
			
			if(isTrue) {				
				String sessionUsername = username;
				String sessionRole = UserDBUtil.getRole(username);
				session.setAttribute("sessionUsername", sessionUsername);
				session.setAttribute("sessionRole", sessionRole);
				session.setMaxInactiveInterval(3600);
				//RequestDispatcher requestdispatcher = request.getRequestDispatcher("user?username="+username);
				//requestdispatcher.forward(request, response);
				response.sendRedirect(request.getContextPath() + "/user?sessionUsername="+username);
			} else {
				RequestDispatcher requestdispatcher = request.getRequestDispatcher("loginregister.jsp");
				requestdispatcher.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
