package com.popcorntime.dbutil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.popcorntime.content.Movie;
import com.popcorntime.plugin.DatabasePlugin;

public class MovieDBUtil implements DatabasePlugin {
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
			sql = "SELECT movie_id FROM movietb ORDER BY movie_id DESC LIMIT 1";
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				id = resultSet.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return id+1;
	}
	
	public static List<Movie> getMovie(String movieID) {
		ArrayList<Movie> movie = new ArrayList<>();
		try {
			
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			String sql = "select * from movietb where movie_id="+movieID;
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
			    int runtime = resultSet.getInt(10);
			    String rating = resultSet.getString(11);
			    String posterImage = resultSet.getString(12);
			    String bannerImage = resultSet.getString(13);
			    String trailer = resultSet.getString(14);
			    String path = resultSet.getString(15);
				
				Movie dbmovie = new Movie(id, name, description, releaseDate, budget, country, language, director, productionCompany, 
						runtime, rating, posterImage, bannerImage, trailer, path);
				movie.add(dbmovie);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return movie;	
	}
	
	public static boolean addMovie(String name, String description, String releaseDate, double budget, String country, String language, String director, 
    		String productionCompany, int runtime, String rating, String posterImage, String bannerImage, String trailer, String path) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "insert into movietb (name, description, release_date, budget, "
					+ "country, language, director, production_company, runtime, rating, poster_image, banner_image, trailer, path) "
					+ "values ('"+name+"', '"+description+"', '"+releaseDate+"', '"+budget+"', '"+country+"', '"+language+"', "
							+ "'"+director+"', '"+productionCompany+"', '"+runtime+"', '"+rating+"', '"+posterImage+"', "
									+ "'"+bannerImage+"', '"+trailer+"', '"+path+"')";
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
	
	public static boolean updateMovie(String movieID, String name, String description, String releaseDate, double budget, String country, String language, String director, 
    		String productionCompany, int runtime, String rating, String trailer) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			
			sql = "UPDATE movietb SET name = '"+name+"', description = '"+description+"', release_date = '"+releaseDate+"', budget = "+budget+", "
					+ "country = '"+country+"', language = '"+language+"', director = '"+director+"', production_company = '"+productionCompany+"', "
							+ "runtime = "+runtime+", rating = '"+rating+"', trailer = '"+trailer+"' WHERE movie_id = "+movieID+"";
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
	
	public static String getPosterImage(String movieID) {
		String posterImage=null;
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT poster_image FROM movietb WHERE movie_id="+movieID;
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				posterImage = resultSet.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return posterImage;
	}
	
	public static String getBannerImage(String movieID) {
		String bannerImage=null;
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT banner_image FROM movietb WHERE movie_id="+movieID;
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				bannerImage = resultSet.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bannerImage;
	}
	
	public static String getMoviePath(String movieID) {
		String moviePath=null;
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT path FROM movietb WHERE movie_id="+movieID;
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				moviePath = resultSet.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return moviePath;
	}

	public static void setPosterImage(String movieID, String posterImage) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "UPDATE movietb SET poster_image = '"+posterImage+"' WHERE movie_id="+movieID;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void setBannerImage(String movieID, String bannerImage) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "UPDATE movietb SET banner_image = '"+bannerImage+"' WHERE movie_id="+movieID;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void setMoviePath(String movieID, String path) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "UPDATE movietb SET path = '"+path+"' WHERE movie_id="+movieID;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void deleteMovie(String movieID) {
		try {
			String movie_ID = null;
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT movie_id FROM movietb ORDER BY movie_id DESC LIMIT 1";
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				movie_ID = resultSet.getString(1);
			}
			sql = "DELETE FROM movietb WHERE movie_id="+movieID;
			statement.executeUpdate(sql);
			if(movie_ID.equals(movieID)) {
				sql = "ALTER TABLE movietb AUTO_INCREMENT = "+movieID;
				statement.execute(sql);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void addCast(String strmovieID, String celebrityID) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "insert into moviecelebritytb (movie, celebrity) values ("+strmovieID+", "+celebrityID+")";
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}		
	}

	public static void removeCast(String strmovieID, String celebrityID) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "delete from moviecelebritytb where movie="+strmovieID+" and celebrity="+celebrityID;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}		
		
	}
}
