package com.popcorntime.content;

public class Movie {
	private int id;
	private String name;
    private String description;
    private String releaseDate;
    private double budget;
    private String country;
    private String language;
    private String director;
    private String productionCompany;
    private int runtime;
    private String rating;
    private String posterImage;
    private String bannerImage;
    private String trailer;
    private String path;
    
    public Movie(int id, String name, String description, String releaseDate, double budget, String country, String language, String director, 
    		String productionCompany, String rating, String posterImage, String bannerImage, String trailer) {
    	this.id = id;
    	this.name = name;
    	this.description = description;
    	this.releaseDate = releaseDate;
    	this.budget = budget;
    	this.country = country;
    	this.language = language;
    	this.director = director;
    	this.productionCompany = productionCompany;
    	this.rating = rating;
    	this.posterImage = posterImage;
    	this.bannerImage = bannerImage;
    	this.trailer = trailer;
    }
    
    public Movie(int id, String name, String description, String releaseDate, double budget, String country, String language, String director, 
    		String productionCompany, int runtime, String rating, String posterImage, String bannerImage, String trailer, String path) {
    	this.id = id;
    	this.name = name;
    	this.description = description;
    	this.releaseDate = releaseDate;
    	this.budget = budget;
    	this.country = country;
    	this.language = language;
    	this.director = director;
    	this.productionCompany = productionCompany;
    	this.runtime = runtime;
    	this.rating = rating;
    	this.posterImage = posterImage;
    	this.bannerImage = bannerImage;
    	this.trailer = trailer;
    	this.path = path;
    }
    
    public Movie(String name, String description, String releaseDate, double budget, String country, String language, String director, 
    		String productionCompany, int runtime, String rating, String posterImage, String bannerImage, String trailer, String path) {
    	this.name = name;
    	this.description = description;
    	this.releaseDate = releaseDate;
    	this.budget = budget;
    	this.country = country;
    	this.language = language;
    	this.director = director;
    	this.productionCompany = productionCompany;
    	this.runtime = runtime;
    	this.rating = rating;
    	this.posterImage = posterImage;
    	this.bannerImage = bannerImage;
    	this.trailer = trailer;
    	this.path = path;
    }

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public double getBudget() {
		return budget;
	}

	public String getCountry() {
		return country;
	}

	public String getLanguage() {
		return language;
	}

	public String getDirector() {
		return director;
	}

	public String getProductionCompany() {
		return productionCompany;
	}

	public int getRuntime() {
		return runtime;
	}

	public String getRating() {
		return rating;
	}

	public String getPosterImage() {
		return posterImage;
	}

	public String getBannerImage() {
		return bannerImage;
	}

	public String getTrailer() {
		return trailer;
	}

	public String getPath() {
		return path;
	} 
}
