package com.popcorntime.dbutil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.popcorntime.content.Celebrity;

public class CelebrityDBUtil {
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
			sql = "SELECT celebrity_id FROM celebritytb ORDER BY celebrity_id DESC LIMIT 1";
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				id = resultSet.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return id+1;
	}
	
	public static List<Celebrity> getCelebrity(String celebrityID) {
		ArrayList<Celebrity> celebrity = new ArrayList<>();
		try {
			
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			String sql = "select * from celebritytb where celebrity_id="+celebrityID+";";
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {				
				int id = resultSet.getInt(1);
				String name = resultSet.getString(2);
			    String biography = resultSet.getString(3);
			    String dateOfBirth = resultSet.getString(4);
			    String gender = resultSet.getString(5);
			    String country = resultSet.getString(6);
			    String posterImage = resultSet.getString(7);
			    String bannerImage = resultSet.getString(8);
			    
				
			    Celebrity dbceleb = new Celebrity(id, name, biography, dateOfBirth, gender, country, posterImage, bannerImage);
			    celebrity.add(dbceleb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return celebrity;	
	}
	
	public static boolean addCelebrity(String name, String biography, String dateOfBirth, String gender, String country,
			String posterImage, String bannerImage) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "insert into celebritytb (name, biography, dob, gender, "
					+ "country, poster_image, banner_image) "
					+ "values ('"+name+"', '"+biography+"', '"+dateOfBirth+"', '"+gender+"', '"+country+"', "
							+ "'"+posterImage+"', "
									+ "'"+bannerImage+"')";
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
	
	public static boolean updateCelebrity(String celebrityID, String name, String biography, String dateOfBirth, String gender, String country) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			
			sql = "UPDATE celebritytb SET name = '"+name+"', biography = '"+biography+"', dob = '"+dateOfBirth+"', gender = '"+gender+"', "
					+ "country = '"+country+"' WHERE celebrity_id = "+celebrityID+"";
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

	public static String getPosterImage(String celebrityID) {
		String posterImage=null;
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT poster_image FROM celebritytb WHERE celebrity_id="+celebrityID;
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				posterImage = resultSet.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return posterImage;
	}
	
	public static String getBannerImage(String celebrityID) {
		String bannerImage=null;
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT banner_image FROM celebritytb WHERE celebrity_id="+celebrityID;
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				bannerImage = resultSet.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bannerImage;
	}

	public static void setPosterImage(String celebrityID, String posterImage) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "UPDATE celebritytb SET poster_image = '"+posterImage+"' WHERE celebrity_id="+celebrityID;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void setBannerImage(String celebrityID, String bannerImage) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "UPDATE celebritytb SET banner_image = '"+bannerImage+"' WHERE celebrity_id="+celebrityID;
			resultSetInt = statement.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void deleteCelebrity(String celebrityID) {
		try {
			String celebrity_ID = null;
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT celebrity_id FROM celebritytb ORDER BY celebrity_id DESC LIMIT 1";
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				celebrity_ID = resultSet.getString(1);
			}
			sql = "DELETE FROM celebritytb WHERE celebrity_id="+celebrityID;
			statement.executeUpdate(sql);
			if(celebrity_ID.equals(celebrityID)) {
				sql = "ALTER TABLE celebritytb AUTO_INCREMENT = "+celebrityID;
				statement.execute(sql);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
