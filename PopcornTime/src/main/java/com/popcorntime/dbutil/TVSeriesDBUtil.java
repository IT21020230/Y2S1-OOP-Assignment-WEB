package com.popcorntime.dbutil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.popcorntime.content.TVSeries;
import com.popcorntime.plugin.DatabasePlugin;

public class TVSeriesDBUtil implements DatabasePlugin {
	private static boolean isSuccess = false;
	private static Connection connection = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;
	private static String sql = null;
	private static int resultSetInt;
	
	public static int getNextID() {
		int id = 0;
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT tvseries_id FROM tvseriestb ORDER BY tvseries_id DESC LIMIT 1";
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				id = resultSet.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return id+1;
	}
	
	public static List<TVSeries> getTVShow(String tvshowID) {
		ArrayList<TVSeries> tvseries = new ArrayList<>();
		try {
			
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			String sql = "select * from tvseriestb where tvseries_id="+tvshowID+";";
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {				
				int id = resultSet.getInt(1);
				String name = resultSet.getString(2);
			    String description = resultSet.getString(3);
			    String releaseDate = resultSet.getString(4);
			    double budget = resultSet.getDouble(5);
			    String country = resultSet.getString(6);
			    String language = resultSet.getString(7);
			    String director = resultSet.getString(8);
			    String productionCompany = resultSet.getString(9);
			    String rating = resultSet.getString(10);
			    String posterImage = resultSet.getString(11);
			    String bannerImage = resultSet.getString(12);
			    String trailer = resultSet.getString(13);
			    int seasons = resultSet.getInt(14);
				
				TVSeries dbtvshow = new TVSeries(id, name, description, releaseDate, budget, country, language, director, productionCompany, 
						rating, posterImage, bannerImage, trailer, seasons);
				tvseries.add(dbtvshow);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return tvseries;	
	}
	
	public static boolean addTVSeries(String name, String description, String releaseDate, double budget, String country, String language, String director, 
    		String productionCompany, String rating, String posterImage, String bannerImage, String trailer, int seasons) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "insert into tvseriestb (name, description, release_date, budget, "
					+ "country, language, director, production_company, rating, poster_image, banner_image, trailer, seasons) "
					+ "values ('"+name+"', '"+description+"', '"+releaseDate+"', '"+budget+"', '"+country+"', '"+language+"', "
							+ "'"+director+"', '"+productionCompany+"', '"+rating+"', '"+posterImage+"', "
									+ "'"+bannerImage+"', '"+trailer+"', '"+seasons+"')";
			resultSetInt = statement.executeUpdate(sql);
			if (resultSetInt>0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static boolean updateTVSeries(String tvShowID, String name, String description, String releaseDate, double budget, String country, String language, String director, 
    		String productionCompany, String rating, String trailer, int seasons) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			
			sql = "UPDATE tvseriestb SET name = '"+name+"', description = '"+description+"', release_date = '"+releaseDate+"', budget = "+budget+", "
					+ "country = '"+country+"', language = '"+language+"', director = '"+director+"', production_company = '"+productionCompany+"', "
							+ "seasons = "+seasons+", rating = '"+rating+"', trailer = '"+trailer+"' WHERE tvseries_id = "+tvShowID+"";
			resultSetInt = statement.executeUpdate(sql);
			if (resultSetInt>0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static String getPosterImage(String tvShowID) {
		String posterImage=null;
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT poster_image FROM tvseriestb WHERE tvseries_id="+tvShowID;
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				posterImage = resultSet.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return posterImage;
	}
	
	public static String getBannerImage(String tvShowID) {
		String bannerImage=null;
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT banner_image FROM tvseriestb WHERE tvseries_id="+tvShowID;
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				bannerImage = resultSet.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bannerImage;
	}
	
	public static void setPosterImage(String tvShowID, String posterImage) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "UPDATE tvseriestb SET poster_image = '"+posterImage+"' WHERE tvseries_id="+tvShowID;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void setBannerImage(String tvShowID, String bannerImage) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "UPDATE tvseriestb SET banner_image = '"+bannerImage+"' WHERE tvseries_id="+tvShowID;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteTVSeries(String tvShowID) {
		try {
			String tvShow_ID = null;
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT tvseries_id FROM tvseriestb ORDER BY tvseries_id DESC LIMIT 1";
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				tvShow_ID = resultSet.getString(1);
			}
			sql = "DELETE FROM tvseriestb WHERE tvseries_id="+tvShowID;
			statement.executeUpdate(sql);
			if(tvShow_ID.equals(tvShowID)) {
				sql = "ALTER TABLE tvseriestb AUTO_INCREMENT = "+tvShowID;
				statement.execute(sql);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static boolean addEpisode(String episode, String season, String tvshow, String path) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "insert into episodetb (episode, season, tvshow, path) "
					+ "values ('"+episode+"', '"+season+"', '"+tvshow+"', '"+path+"')";
			resultSetInt = statement.executeUpdate(sql);
			if (resultSetInt>0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}

	public static boolean updateEpisode(String episode, String season, String strTVShowID, String previousEpisode, String previousSeason) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			
			sql = "UPDATE episodetb SET episode = "+episode+", season = "+season+", tvshow = "+strTVShowID+" "
					+ "WHERE tvshow = "+strTVShowID+" and season = "+previousSeason+" and episode = "+previousEpisode;
			resultSetInt = statement.executeUpdate(sql);
			if (resultSetInt>0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}

	public static String getEpisodePath(String strTVShowID, String previousEpisode, String previousSeason) {
		String episodePath=null;
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT path FROM episodetb "
					+ "WHERE tvshow = "+strTVShowID+" and season = "+previousSeason+" and episode = "+previousEpisode;
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				episodePath = resultSet.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return episodePath;
	}

	public static void setEpisodePath(String strTVShowID, String episode, String season, String path) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "UPDATE episodetb SET path = '"+path+"' WHERE tvshow = "+strTVShowID+" and season = "+season+" and episode = "+episode;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void deleteEpisode(String strTVShowID, String previousEpisode, String previousSeason) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "DELETE FROM episodetb WHERE tvshow = "+strTVShowID+" and season = "+previousSeason+" and episode = "+previousEpisode;
			statement.executeUpdate(sql);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public static void addCast(String strTVShowID, String celebrityID) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "insert into tvshowcelebritytb (tvshow, celebrity) values ("+strTVShowID+", "+celebrityID+")";
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}

	public static void removeCast(String strTVShowID, String celebrityID) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "delete from tvshowcelebritytb where tvshow="+strTVShowID+" and celebrity="+celebrityID;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}
}
