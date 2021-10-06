package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO {
	
	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected ResultSet rs = null;
	
	protected void getConn() {
		// 데이터베이스 연결 메소드
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
		String user = "campus_k1_1006";
		String password = "smhrd1";

		conn = DriverManager.getConnection(url, user, password);
		} catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	protected void close() {
		// 데이터베이스 객체 close 메소드
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
