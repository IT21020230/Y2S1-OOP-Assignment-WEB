package com.popcorntime.view;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.popcorntime.content.Movie;
import com.popcorntime.content.TVSeries;
import com.popcorntime.dbutil.MovieDBUtil;
import com.popcorntime.dbutil.TVSeriesDBUtil;

/**
 * Servlet implementation class TVSeriesView
 */
public class TVSeriesView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TVSeriesView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String tvShowID = request.getParameter("tvseries_id");
			List<TVSeries> tvSeries = TVSeriesDBUtil.getTVShow(tvShowID);
			request.setAttribute("tvshow", tvSeries);
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("tvshow.jsp");
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
