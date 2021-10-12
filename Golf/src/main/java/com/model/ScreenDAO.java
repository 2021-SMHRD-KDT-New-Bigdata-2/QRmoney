package com.model;

import java.util.ArrayList;

public class ScreenDAO extends DAO{
	ArrayList<ScreenVO> screens = new ArrayList<ScreenVO>();
	
	public ArrayList<ScreenVO> getScreenList() {
		getConn();
		try {
			String sql = "select * from screen";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int screen_id = rs.getInt(1);
				String name = rs.getString(2);
				String address = rs.getString(3);
				String tel = rs.getString(4);
				String company = rs.getString(5);
				
				ScreenVO vo = new ScreenVO(screen_id, name, address, tel, company);
				
				screens.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return screens;
	}
	
	public int getScreenIDbyName(String name) {
		int location = 0;
		
		getConn();
		try {
			String sql = "select * from screen where name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				location = rs.getInt("screen_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return location;
	}
}
