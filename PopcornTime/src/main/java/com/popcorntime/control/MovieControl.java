package com.popcorntime.control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.popcorntime.dbutil.MovieDBUtil;

/**
 * Servlet implementation class MovieControl
 */
@MultipartConfig
public class MovieControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieControl() {
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
		
		int movieID = MovieDBUtil.getNextID();
		
		String strmovieID = null;
		String name = null;
		String description = null;
		String releaseDate = null;
		double budget = 0.0;
		String country = null;
		String language = null;
		String director = null;
		String productionCompany = null;
		int runtime = 0;
		String rating = null;
		
		String posterImage, bannerImage, path;
	    String trailer = null;
	    
	    Part partAttrPosterImage, partAttrBannerImage, partAttrMovie;
	    InputStream isPosterImage, isBannerImage, isMovie;
	    File filePosterImage, fileBannerImage, fileMovie;
	    FileOutputStream outputStreamPosterImage, outputStreamBannerImage, outputStreamMovie;
	    int read = 0;
	    byte[] bytes;
	    boolean isSuccess; 
		
		if(request.getParameter("txtMovieID")!=null)
			strmovieID = request.getParameter("txtMovieID");
		
		if(request.getParameter("txtMovieTitle")!=null)
			name = request.getParameter("txtMovieTitle");
		
		if(request.getParameter("txtDescription")!=null)
			description = request.getParameter("txtDescription");
		
		if(request.getParameter("txtReleaseDate")!=null)
			releaseDate = request.getParameter("txtReleaseDate");
		
		if(request.getParameter("txtBudget")!=null)
			budget = Double.parseDouble(request.getParameter("txtBudget"));
		
		if(request.getParameter("selectCountry")!=null)
			country = request.getParameter("selectCountry");
		
		if(request.getParameter("selectLanguage")!=null)
			language = request.getParameter("selectLanguage");
		
		if(request.getParameter("txtDirector")!=null)
			director = request.getParameter("txtDirector");
		
		if(request.getParameter("txtProductionCompany")!=null)
			productionCompany = request.getParameter("txtProductionCompany");
		
		if(request.getParameter("txtRuntime")!=null)
			runtime = Integer.parseInt(request.getParameter("txtRuntime"));
		
		if(request.getParameter("selectRating")!=null)
			rating = request.getParameter("selectRating");
		
		if(request.getParameter("txtTrailer")!=null)
			trailer = request.getParameter("txtTrailer");

    	
		if(request.getParameter("btnAddMovie")!=null) {	
			
			partAttrPosterImage = request.getPart("posterImage");
		    isPosterImage = partAttrPosterImage.getInputStream();
		    posterImage = movieID+"_"+partAttrPosterImage.getSubmittedFileName();
		    
		    partAttrBannerImage = request.getPart("bannerImage");
		    isBannerImage = partAttrBannerImage.getInputStream();
		    bannerImage = movieID+"_"+partAttrBannerImage.getSubmittedFileName();
		    
		    partAttrMovie = request.getPart("movie");
		    isMovie = partAttrMovie.getInputStream();
		    path = movieID+"_"+partAttrMovie.getSubmittedFileName(); 
		    
			isSuccess = MovieDBUtil.addMovie(name, description, releaseDate, budget, country, language, director, 
			    		productionCompany, runtime, rating, posterImage, bannerImage, trailer, path);
			
			if(isSuccess) {
				
				filePosterImage = new File(getServletContext().getInitParameter("movie-poster-image-upload-path") + posterImage);
			    outputStreamPosterImage = new FileOutputStream(filePosterImage);
			 
			    read = 0;
			    bytes = new byte[1024];
			    while ((read = isPosterImage.read(bytes)) != -1) {
			    	outputStreamPosterImage.write(bytes, 0, read);
			    }
			    
			    fileBannerImage = new File(getServletContext().getInitParameter("movie-banner-image-upload-path") + bannerImage);
			    outputStreamBannerImage = new FileOutputStream(fileBannerImage);
			 
			    read = 0;
			    bytes = new byte[1024];
			    while ((read = isBannerImage.read(bytes)) != -1) {
			    	outputStreamBannerImage.write(bytes, 0, read);
			    }
			    
			    fileMovie = new File(getServletContext().getInitParameter("movie-upload-path") + path);
			    outputStreamMovie = new FileOutputStream(fileMovie);

			    read = 0;
			    bytes = new byte[1024];
			    while ((read = isMovie.read(bytes)) != -1) {
			        outputStreamMovie.write(bytes, 0, read);
			    }   
			}
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("movie?movie_id="+movieID);
			requestdispatcher.forward(request, response);
			
		}else if(request.getParameter("btnUpdateMovie")!=null) {
			
			partAttrPosterImage = request.getPart("posterImage");
		    isPosterImage = partAttrPosterImage.getInputStream();
		    posterImage = strmovieID+"_"+partAttrPosterImage.getSubmittedFileName();
		    
		    partAttrBannerImage = request.getPart("bannerImage");
		    isBannerImage = partAttrBannerImage.getInputStream();
		    bannerImage = strmovieID+"_"+partAttrBannerImage.getSubmittedFileName();
		    
		    partAttrMovie = request.getPart("movie");
		    isMovie = partAttrMovie.getInputStream();
		    path = strmovieID+"_"+partAttrMovie.getSubmittedFileName();
		    
		    isSuccess = MovieDBUtil.updateMovie(strmovieID, name, description, releaseDate, budget, country, language, director, 
		    		productionCompany, runtime, rating, trailer);
		    
		    if(isSuccess) {
		    	if(partAttrPosterImage.getSize()>0) {
					File filePosterImageDelete = new File(getServletContext().getInitParameter("movie-poster-image-upload-path") + MovieDBUtil.getPosterImage(strmovieID));
					if(filePosterImageDelete.exists()) {
						filePosterImageDelete.delete();
					}
					filePosterImage = new File(getServletContext().getInitParameter("movie-poster-image-upload-path") + posterImage);
				    outputStreamPosterImage = new FileOutputStream(filePosterImage);
				 
				    read = 0;
				    bytes = new byte[1024];
				    while ((read = isPosterImage.read(bytes)) != -1) {
				    	outputStreamPosterImage.write(bytes, 0, read);
				    }
					MovieDBUtil.setPosterImage(strmovieID, posterImage);
				}
				
				if(partAttrBannerImage.getSize()>0) {
					File fileBannerImageDelete = new File(getServletContext().getInitParameter("movie-banner-image-upload-path") + MovieDBUtil.getBannerImage(strmovieID));
					if(fileBannerImageDelete.exists()) {
						fileBannerImageDelete.delete();
					}
					fileBannerImage = new File(getServletContext().getInitParameter("movie-banner-image-upload-path") + bannerImage);
				    outputStreamBannerImage = new FileOutputStream(fileBannerImage);
				 
				    read = 0;
				    bytes = new byte[1024];
				    while ((read = isBannerImage.read(bytes)) != -1) {
				    	outputStreamBannerImage.write(bytes, 0, read);
				    }
					MovieDBUtil.setBannerImage(strmovieID, bannerImage);
				}
				
				if(partAttrMovie.getSize()>0) {
					File fileMovieDelete = new File(getServletContext().getInitParameter("movie-upload-path") + MovieDBUtil.getMoviePath(strmovieID));
					if(fileMovieDelete.exists()) {
						fileMovieDelete.delete();
					}
					fileMovie = new File(getServletContext().getInitParameter("movie-upload-path") + path);
					outputStreamMovie = new FileOutputStream(fileMovie);
					
					read = 0;
				    bytes = new byte[1024];
				    while ((read = isMovie.read(bytes)) != -1) {
				        outputStreamMovie.write(bytes, 0, read);
				    }   
					MovieDBUtil.setMoviePath(strmovieID, path);
				}
		    }
		    RequestDispatcher requestdispatcher = request.getRequestDispatcher("movie?movie_id="+strmovieID);
			requestdispatcher.forward(request, response);
			
		}else if(request.getParameter("btnDeleteMovie")!=null) {
		    
			File filePosterImageDelete = new File(getServletContext().getInitParameter("movie-poster-image-upload-path") + MovieDBUtil.getPosterImage(strmovieID));
			if(filePosterImageDelete.exists())
				filePosterImageDelete.delete();
			
			File fileBannerImageDelete = new File(getServletContext().getInitParameter("movie-banner-image-upload-path") + MovieDBUtil.getBannerImage(strmovieID));
			if(fileBannerImageDelete.exists())
				fileBannerImageDelete.delete();
			
			File fileMovieDelete = new File(getServletContext().getInitParameter("movie-upload-path") + MovieDBUtil.getMoviePath(strmovieID));
			if(fileMovieDelete.exists())
				fileMovieDelete.delete();
			
			MovieDBUtil.deleteMovie(strmovieID);
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("movies.jsp");
			requestdispatcher.forward(request, response);
			
		}else if(request.getParameter("btnAddCast")!=null) {
			String celebrityID = request.getParameter("selectCelebrity");
			MovieDBUtil.addCast(strmovieID, celebrityID);
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("movie?movie_id="+strmovieID);
			requestdispatcher.forward(request, response);
			
		}else if(request.getParameter("btnRemoveCast")!=null) {
			String celebrityID = request.getParameter("txtCelebrityID");
			MovieDBUtil.removeCast(strmovieID, celebrityID);
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("movie?movie_id="+strmovieID);
			requestdispatcher.forward(request, response);
		}
	}
}
