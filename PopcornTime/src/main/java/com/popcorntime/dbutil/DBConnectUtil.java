package com.popcorntime.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectUtil {
	private static String dburl = "jdbc:mysql://localhost:3306/popcorntimedb?autoReconnect=true&useSSL=false";
	private static String dbuser = "root";
	private static String dbpassword = "@sdfg12345";
	private static Connection connection;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dburl, dbuser, dbpassword);
		}
		catch (Exception e) {
			System.out.println("Database connection is not success!!!");
		}
		return connection;
	}
}
