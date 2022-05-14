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
import com.popcorntime.dbutil.TVSeriesDBUtil;

/**
 * Servlet implementation class TVSeriesControl
 */

@MultipartConfig
public class TVSeriesControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TVSeriesControl() {
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
		int tvShowID = TVSeriesDBUtil.getNextID();
		
		String strTVShowID = null;
		String name= null;
		String description = null;
		String releaseDate = null;
		double budget = 0.0;
		String country = null;
		String language = null;
		String director = null;
		String productionCompany = null;
		int seasons = 0;
		String rating = null;
		String trailer = null;
		
		String episode = null;
	    String season = null;
	    String previousEpisode = null;
	    String previousSeason = null;
	    
	    String posterImage, bannerImage, path;    
	    
	    Part partAttrPosterImage, partAttrBannerImage, partAttrEpisode;
	    InputStream isPosterImage, isBannerImage, isEpisode;
	    File filePosterImage, fileBannerImage, fileEpisode, tvShowDirectory;
	    FileOutputStream outputStreamPosterImage, outputStreamBannerImage, outputStreamEpisode;
	    int read = 0;
	    byte[] bytes;
	    boolean isSuccess; 
		
		if(request.getParameter("txtTVShowID")!=null)
			strTVShowID = request.getParameter("txtTVShowID");
		
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
		
		if(request.getParameter("txtSeasons")!=null) 
			seasons = Integer.parseInt(request.getParameter("txtSeasons"));
		
		if(request.getParameter("selectRating")!=null) 
			rating = request.getParameter("selectRating");
		
		if(request.getParameter("txtTrailer")!=null) 
			trailer = request.getParameter("txtTrailer");
		
		if(request.getParameter("txtEpisode")!=null) 
			episode = request.getParameter("txtEpisode");
		
		if(request.getParameter("txtSeason")!=null) 
			season = request.getParameter("txtSeason");
		
		if(request.getParameter("txtPreviousSeason")!=null) 
			previousSeason = request.getParameter("txtPreviousSeason");
		
		if(request.getParameter("txtPreviousEpisode")!=null) 
			previousEpisode = request.getParameter("txtPreviousEpisode");
		
		
	    
	    if(request.getParameter("btnAddTVShow")!=null) {
	    	partAttrPosterImage = request.getPart("posterImage");
		    isPosterImage = partAttrPosterImage.getInputStream();
		    posterImage = tvShowID+"_"+partAttrPosterImage.getSubmittedFileName();
		    
		    partAttrBannerImage = request.getPart("bannerImage");
		    isBannerImage = partAttrBannerImage.getInputStream();
		    bannerImage = tvShowID+"_"+partAttrBannerImage.getSubmittedFileName();
		    
			isSuccess = TVSeriesDBUtil.addTVSeries(name, description, releaseDate, budget, country, language, director, 
			    		productionCompany, rating, posterImage, bannerImage, trailer, seasons);
			
			if(isSuccess) {
				
				filePosterImage = new File(getServletContext().getInitParameter("tvshow-poster-image-upload-path") + posterImage);
			    outputStreamPosterImage = new FileOutputStream(filePosterImage);
			 
			    read = 0;
			    bytes = new byte[1024];
			    while ((read = isPosterImage.read(bytes)) != -1) {
			    	outputStreamPosterImage.write(bytes, 0, read);
			    }
			    
			    fileBannerImage = new File(getServletContext().getInitParameter("tvshow-banner-image-upload-path") + bannerImage);
			    outputStreamBannerImage = new FileOutputStream(fileBannerImage);
			 
			    read = 0;
			    bytes = new byte[1024];
			    while ((read = isBannerImage.read(bytes)) != -1) {
			    	outputStreamBannerImage.write(bytes, 0, read);
			    }
			}
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("tvshow?tvseries_id="+tvShowID);
			requestdispatcher.forward(request, response);
			
	    }else if(request.getParameter("btnUpdateTVShow")!=null) {
	    	partAttrPosterImage = request.getPart("posterImage");
		    isPosterImage = partAttrPosterImage.getInputStream();
		    posterImage = strTVShowID+"_"+partAttrPosterImage.getSubmittedFileName();
		    
		    partAttrBannerImage = request.getPart("bannerImage");
		    isBannerImage = partAttrBannerImage.getInputStream();
		    bannerImage = strTVShowID+"_"+partAttrBannerImage.getSubmittedFileName();
		    
		    isSuccess = TVSeriesDBUtil.updateTVSeries(strTVShowID, name, description, releaseDate, budget, country, language, director, 
		    		productionCompany, rating, trailer, seasons);
		    
		    if(isSuccess) {
		    	if(partAttrPosterImage.getSize()>0) {
					File filePosterImageDelete = new File(getServletContext().getInitParameter("tvshow-poster-image-upload-path") + TVSeriesDBUtil.getPosterImage(strTVShowID));
					if(filePosterImageDelete.exists())
						filePosterImageDelete.delete();
					filePosterImage = new File(getServletContext().getInitParameter("tvshow-poster-image-upload-path") + posterImage);
				    outputStreamPosterImage = new FileOutputStream(filePosterImage);
				 
				    read = 0;
				    bytes = new byte[1024];
				    while ((read = isPosterImage.read(bytes)) != -1) {
				    	outputStreamPosterImage.write(bytes, 0, read);
				    }
					TVSeriesDBUtil.setPosterImage(strTVShowID, posterImage);
				}
				
				if(partAttrBannerImage.getSize()>0) {
					File fileBannerImageDelete = new File(getServletContext().getInitParameter("tvshow-banner-image-upload-path") + TVSeriesDBUtil.getBannerImage(strTVShowID));
					if(fileBannerImageDelete.exists())
						fileBannerImageDelete.delete();
					fileBannerImage = new File(getServletContext().getInitParameter("tvshow-banner-image-upload-path") + bannerImage);
				    outputStreamBannerImage = new FileOutputStream(fileBannerImage);
				 
				    read = 0;
				    bytes = new byte[1024];
				    while ((read = isBannerImage.read(bytes)) != -1) {
				    	outputStreamBannerImage.write(bytes, 0, read);
				    }
					TVSeriesDBUtil.setBannerImage(strTVShowID, bannerImage);
				}
		    }
		    RequestDispatcher requestdispatcher = request.getRequestDispatcher("tvshow?tvseries_id="+strTVShowID);
			requestdispatcher.forward(request, response);
			
	    } else if(request.getParameter("btnDeleteTVShow")!=null) {
		    
			File filePosterImageDelete = new File(getServletContext().getInitParameter("tvshow-poster-image-upload-path") + TVSeriesDBUtil.getPosterImage(strTVShowID));
			if(filePosterImageDelete.exists())
				filePosterImageDelete.delete();
			
			File fileBannerImageDelete = new File(getServletContext().getInitParameter("tvshow-banner-image-upload-path") + TVSeriesDBUtil.getBannerImage(strTVShowID));
			if(fileBannerImageDelete.exists())
				fileBannerImageDelete.delete();
			
			tvShowDirectory = new File(getServletContext().getInitParameter("tvshows-upload-path")+strTVShowID+"\\");
	    	if (tvShowDirectory.exists()) 
	    		tvShowDirectory.delete();
			
			TVSeriesDBUtil.deleteTVSeries(strTVShowID);
			
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("tvshows.jsp");
			requestdispatcher.forward(request, response);			
			
		} else if(request.getParameter("btnAddEpisode")!=null) {
			partAttrEpisode = request.getPart("episode");
		    isEpisode = partAttrEpisode.getInputStream();
		    path = episode+season+strTVShowID+"_"+partAttrEpisode.getSubmittedFileName();
		    
		    isSuccess = TVSeriesDBUtil.addEpisode(episode, season, strTVShowID, path);
		    
		    if(isSuccess) {
		    	tvShowDirectory = new File(getServletContext().getInitParameter("tvshows-upload-path")+strTVShowID+"\\");
		    	if (!tvShowDirectory.exists()) {
		    		tvShowDirectory.mkdirs();
		    	}
		    	fileEpisode = new File(getServletContext().getInitParameter("tvshows-upload-path") +strTVShowID+"\\"+ path);
		    	outputStreamEpisode = new FileOutputStream(fileEpisode);
			 
			    read = 0;
			    bytes = new byte[1024];
			    while ((read = isEpisode.read(bytes)) != -1) {
			    	outputStreamEpisode.write(bytes, 0, read);
			    }
		    }
		    RequestDispatcher requestdispatcher = request.getRequestDispatcher("tvshow?tvseries_id="+strTVShowID);
			requestdispatcher.forward(request, response);
			
		} else if(request.getParameter("btnUpdateEpisode")!=null) {
			partAttrEpisode = request.getPart("episode");
		    isEpisode = partAttrEpisode.getInputStream();
		    path = episode+season+tvShowID+"_"+partAttrEpisode.getSubmittedFileName();
		    
		    isSuccess = TVSeriesDBUtil.updateEpisode(episode, season, strTVShowID, previousEpisode, previousSeason);
		    
		    if(isSuccess) {
		    	if(partAttrEpisode.getSize()>0) {
					File fileEpisodeDelete = new File(getServletContext().getInitParameter("tvshows-upload-path") +strTVShowID+"\\"+ TVSeriesDBUtil.getEpisodePath(strTVShowID, previousEpisode, previousSeason));
					if(fileEpisodeDelete.exists())
						fileEpisodeDelete.delete();
					
					fileEpisode = new File(getServletContext().getInitParameter("tvshows-upload-path") +strTVShowID+"\\"+ path);
					outputStreamEpisode = new FileOutputStream(fileEpisode);
					
					read = 0;
				    bytes = new byte[1024];
				    while ((read = isEpisode.read(bytes)) != -1) {
				    	outputStreamEpisode.write(bytes, 0, read);
				    }   
					TVSeriesDBUtil.setEpisodePath(strTVShowID, episode, season, path);
				}
		    }
		    RequestDispatcher requestdispatcher = request.getRequestDispatcher("tvshow?tvseries_id="+strTVShowID);
			requestdispatcher.forward(request, response);
		  
		} else if(request.getParameter("btnDeleteEpisode")!=null) {
			File fileEpisodeDelete = new File(getServletContext().getInitParameter("tvshows-upload-path") +strTVShowID+"\\"+ TVSeriesDBUtil.getEpisodePath(strTVShowID, previousEpisode, previousSeason));
			if(fileEpisodeDelete.exists())
				fileEpisodeDelete.delete();
			
			TVSeriesDBUtil.deleteEpisode(strTVShowID, previousEpisode, previousSeason);
			
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("tvshow?tvseries_id="+strTVShowID);
			requestdispatcher.forward(request, response);
			
		} else if(request.getParameter("btnAddCast")!=null) {
			String celebrityID = request.getParameter("selectCelebrity");
			TVSeriesDBUtil.addCast(strTVShowID, celebrityID);
			
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("tvshow?tvseries_id="+strTVShowID);
			requestdispatcher.forward(request, response);
			
		} else if(request.getParameter("btnRemoveCast")!=null) {
			
			String celebrityID = request.getParameter("txtCelebrityID");
			TVSeriesDBUtil.removeCast(strTVShowID, celebrityID);
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("tvshow?tvseries_id="+strTVShowID);
			requestdispatcher.forward(request, response);
		}
	}
}