package com.popcorntime.dbutil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.popcorntime.plugin.DatabasePlugin;
import com.popcorntime.role.User;

public class UserDBUtil implements DatabasePlugin{
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
			sql = "SELECT user_id FROM usertb ORDER BY user_id DESC LIMIT 1";
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				id = resultSet.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return id+1;
	}
	
	public static boolean validateUser(String username, String password) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			String sql = "select * from usertb where username='"+username+"' and password='"+password+"'";
			resultSet = statement.executeQuery(sql);
			
			if (resultSet.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<User> getUser(String username) {
		ArrayList<User> user = new ArrayList<>();
		try {
			
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			String sql = "select * from usertb where username='"+username+"'";
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String email = resultSet.getString(2);
				String confirmedUsername = resultSet.getString(3);
				String password = resultSet.getString(4);
				String role = resultSet.getString(5);
				User dbuser = new User(id, email, confirmedUsername, password, role);
				user.add(dbuser);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;	
	}

	
	public static boolean registertUser(String email, String username, String password) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			String sql = "insert into usertb (email, username, password, role) "
					+ "values ('"+email+"', '"+username+"', '"+password+"', 'u')";
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

	public static boolean addUser(String email, String role, String username, String password) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			String sql = "insert into usertb (email, role, username, password) "
								+ "values ('"+email+"', '"+role+"', '"+username+"', '"+password+"')";
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

	public static boolean updateUser(String strUserID, String email, String role, String username, String password) {
		try {
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			
			sql = "UPDATE usertb SET email = '"+email+"', role = '"+role+"', username = '"+username+"', password = '"+password+"' WHERE user_id = "+strUserID+"";
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

	public static void deleteUser(String strUserID) {
		try {
			String user_ID = null;
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			sql = "SELECT user_id FROM usertb ORDER BY user_id DESC LIMIT 1";
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				user_ID = resultSet.getString(1);
			}
			sql = "DELETE FROM usertb WHERE user_id="+strUserID;
			statement.executeUpdate(sql);
			if(user_ID.equals(strUserID)) {
				sql = "ALTER TABLE usertb AUTO_INCREMENT = "+strUserID;
				statement.execute(sql);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static String getRole(String username) {
		String role = null;
		try {
			role = null;
			connection = DBConnectUtil.getConnection();
			statement = connection.createStatement();
			String sql = "select role from usertb where username='"+username+"'";
			resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				role = resultSet.getString("role");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return role;	
	}

	

}
