package com.popcorntime.content;

public class TVSeries extends Movie {
	private int seasons;
	
	public TVSeries(int id,String name, String description, String releaseDate, double budget, String country, String language,
			String director, String productionCompany, String rating, String posterImage,
			String bannerImage, String trailer, int seasons) {
		super(id, name, description, releaseDate, budget, country, language, director, productionCompany, rating,
				posterImage, bannerImage, trailer);
		
		this.seasons = seasons;
	}
	
	public int getSeasons() {
		return this.seasons;
	}
}
