package com.popcorntime.control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.popcorntime.dbutil.UserDBUtil;

/**
 * Servlet implementation class UserControl
 */
public class UserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserControl() {
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
		String strUserID = request.getParameter("user_id");
		String email = request.getParameter("email");
    	String role = request.getParameter("role");
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");	
    	boolean isSuccess;
    	
    	if(request.getParameter("btnAddUser")!=null) {
    		isSuccess = UserDBUtil.addUser(email, role, username, password);
    		RequestDispatcher requestdispatcher = request.getRequestDispatcher("user?username="+username);
			requestdispatcher.forward(request, response);
    	} else if (request.getParameter("btnUpdateUser")!=null) {
    		isSuccess = UserDBUtil.updateUser(strUserID, email, role, username, password);
    		/*RequestDispatcher requestdispatcher = request.getRequestDispatcher("user?username="+username);
			requestdispatcher.forward(request, response);*/
    		response.sendRedirect(request.getContextPath() + "/user?sessionUsername="+username);
    	} else if (request.getParameter("btnDeleteUser")!=null) {
    		UserDBUtil.deleteUser(strUserID);
    		RequestDispatcher requestdispatcher = request.getRequestDispatcher("index.jsp");
			requestdispatcher.forward(request, response);
    	}
	}
}
