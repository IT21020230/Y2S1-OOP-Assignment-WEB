package com.popcorntime.view;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.popcorntime.content.Celebrity;
import com.popcorntime.content.Movie;
import com.popcorntime.dbutil.CelebrityDBUtil;
import com.popcorntime.dbutil.MovieDBUtil;

/**
 * Servlet implementation class CelebrityView
 */
public class CelebrityView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CelebrityView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String celebrityID = request.getParameter("celebrity_id");
			List<Celebrity> celebrity = CelebrityDBUtil.getCelebrity(celebrityID);
			request.setAttribute("celebrity", celebrity);
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("celebrity.jsp");
			requestdispatcher.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
