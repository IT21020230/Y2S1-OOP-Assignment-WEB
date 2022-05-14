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

import com.popcorntime.dbutil.CelebrityDBUtil;
import com.popcorntime.dbutil.MovieDBUtil;

/**
 * Servlet implementation class CelebrityControl
 */

@MultipartConfig
public class CelebrityControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CelebrityControl() {
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
		int celebID = CelebrityDBUtil.getNextID();
    	String strCelebID = request.getParameter("txtCelebrityID");
		
    	String name = request.getParameter("txtCelebName");
	    String biography = request.getParameter("txtBiography");
	    String dateOfBirth = request.getParameter("CelebDOB");
	    String gender = request.getParameter("selectGender");
	    String country = request.getParameter("selectCountry");
	    String posterImage, bannerImage;
	    
	    Part partAttrPosterImage, partAttrBannerImage;
	    InputStream isPosterImage, isBannerImage;
	    File filePosterImage, fileBannerImage;
	    FileOutputStream outputStreamPosterImage, outputStreamBannerImage;
	    int read = 0;
	    byte[] bytes;
	    boolean isSuccess; 
	    
	    if(request.getParameter("btnAddCelebrity")!=null) {
	    	partAttrPosterImage = request.getPart("posterImage");
		    isPosterImage = partAttrPosterImage.getInputStream();
		    posterImage = celebID+"_"+partAttrPosterImage.getSubmittedFileName();
		    
		    partAttrBannerImage = request.getPart("bannerImage");
		    isBannerImage = partAttrBannerImage.getInputStream();
		    bannerImage = celebID+"_"+partAttrBannerImage.getSubmittedFileName();
		    
		    isSuccess = CelebrityDBUtil.addCelebrity(name, biography, dateOfBirth, gender, country, posterImage, bannerImage);
		    
		    if(isSuccess) {
		    	filePosterImage = new File(getServletContext().getInitParameter("celebrity-poster-image-upload-path") + posterImage);
			    outputStreamPosterImage = new FileOutputStream(filePosterImage);
			 
			    read = 0;
			    bytes = new byte[1024];
			    while ((read = isPosterImage.read(bytes)) != -1) {
			    	outputStreamPosterImage.write(bytes, 0, read);
			    }
			    
			    fileBannerImage = new File(getServletContext().getInitParameter("celebrity-banner-image-upload-path") + bannerImage);
			    outputStreamBannerImage = new FileOutputStream(fileBannerImage);
			 
			    read = 0;
			    bytes = new byte[1024];
			    while ((read = isBannerImage.read(bytes)) != -1) {
			    	outputStreamBannerImage.write(bytes, 0, read);
			    }
		    }
		    RequestDispatcher requestdispatcher = request.getRequestDispatcher("celebrity?celebrity_id="+celebID);
			requestdispatcher.forward(request, response);
			
	    }else if(request.getParameter("btnUpdateCelebrity")!=null) {
	    	partAttrPosterImage = request.getPart("posterImage");
		    isPosterImage = partAttrPosterImage.getInputStream();
		    posterImage = strCelebID+"_"+partAttrPosterImage.getSubmittedFileName();
		    
		    partAttrBannerImage = request.getPart("bannerImage");
		    isBannerImage = partAttrBannerImage.getInputStream();
		    bannerImage = strCelebID+"_"+partAttrBannerImage.getSubmittedFileName();
		    
		   
		    isSuccess = CelebrityDBUtil.updateCelebrity(strCelebID, name, biography, dateOfBirth, gender, country);
		    
		    if(isSuccess) {
		    	if(partAttrPosterImage.getSize()>0) {
					File filePosterImageDelete = new File(getServletContext().getInitParameter("celebrity-poster-image-upload-path") + CelebrityDBUtil.getPosterImage(strCelebID));
					if(filePosterImageDelete.exists())
						filePosterImageDelete.delete();
						
					filePosterImage = new File(getServletContext().getInitParameter("celebrity-poster-image-upload-path") + posterImage);
				    outputStreamPosterImage = new FileOutputStream(filePosterImage);
				 
				    read = 0;
				    bytes = new byte[1024];
				    while ((read = isPosterImage.read(bytes)) != -1) {
				    	outputStreamPosterImage.write(bytes, 0, read);
				    }
				    
					CelebrityDBUtil.setPosterImage(strCelebID, posterImage);
				}
				
				if(partAttrBannerImage.getSize()>0) {
					File fileBannerImageDelete = new File(getServletContext().getInitParameter("celebrity-banner-image-upload-path") + CelebrityDBUtil.getBannerImage(strCelebID));
					if(fileBannerImageDelete.exists()) {
						fileBannerImageDelete.delete();
						
					}
					fileBannerImage = new File(getServletContext().getInitParameter("celebrity-banner-image-upload-path") + bannerImage);
				    outputStreamBannerImage = new FileOutputStream(fileBannerImage);
				 
				    read = 0;
				    bytes = new byte[1024];
				    while ((read = isBannerImage.read(bytes)) != -1) {
				    	outputStreamBannerImage.write(bytes, 0, read);
				    }
					CelebrityDBUtil.setBannerImage(strCelebID, bannerImage);
				}
		    }			
		    RequestDispatcher requestdispatcher = request.getRequestDispatcher("celebrity?celebrity_id="+strCelebID);
			requestdispatcher.forward(request, response);
	    }else if(request.getParameter("btnDeleteCelebrity")!=null) {
	    	File filePosterImageDelete = new File(getServletContext().getInitParameter("celebrity-poster-image-upload-path") + CelebrityDBUtil.getPosterImage(strCelebID));
			if(filePosterImageDelete.exists())
				filePosterImageDelete.delete();
			
			File fileBannerImageDelete = new File(getServletContext().getInitParameter("celebrity-banner-image-upload-path") + CelebrityDBUtil.getBannerImage(strCelebID));
			if(fileBannerImageDelete.exists())
				fileBannerImageDelete.delete();
			
			CelebrityDBUtil.deleteCelebrity(strCelebID);
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("movies.jsp");
			requestdispatcher.forward(request, response);
	    }
	}
}
