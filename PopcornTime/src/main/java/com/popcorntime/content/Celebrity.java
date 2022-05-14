package com.popcorntime.content;

public class Celebrity {
	private int id;
	private String name;
    private String biography;
    private String dateOfBirth;
    private String gender;
    private String country;
    private String posterImage;
    private String bannerImage;
    
    public Celebrity(int id, String name, String biography, String dateOfBirth, String gender, String country, 
    		String posterImage, String bannerImage) {
    	this.id = id;
    	this.name = name;
    	this.biography = biography;
    	this.dateOfBirth = dateOfBirth;
    	this.gender = gender;
    	this.country = country;
    	this.posterImage = posterImage;
    	this.bannerImage = bannerImage;
    }

	
    public Celebrity(String name, String biography, String dateOfBirth, String gender, 
    		String country, String posterImage, String bannerImage) {
    	this.name = name;
    	this.biography = biography;
    	this.dateOfBirth = dateOfBirth;
    	this.gender = gender;
    	this.country = country;
    	this.posterImage = posterImage;
    	this.bannerImage = bannerImage;
    }
    
    public int getId() {
		return id;
	}
    
	public String getName() {
		return name;
	}
	
	public String getBiography() {
		return biography;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public String getGender() {
		return gender;
	}

	public String getCountry() {
		return country;
	}

	public String getPosterImage() {
		return posterImage;
	}

	public String getBannerImage() {
		return bannerImage;
	}
}
