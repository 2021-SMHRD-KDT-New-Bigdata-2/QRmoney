package com.model;

import java.util.ArrayList;

public class FieldDAO extends DAO {
	ArrayList<FieldVO> fields = new ArrayList<FieldVO>();
	
	public ArrayList<FieldVO> getFieldList() {
		getConn();
		try {
			String sql = "select * from field";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int field_id = rs.getInt(1);
				String name = rs.getString(2);
				String membership = rs.getString(3);
				String hole = rs.getString(4);
				String address = rs.getString(5);
				String tel = rs.getString(6);
				String caddyfee = rs.getString(7);
				String cartfee = rs.getString(8);
				String weekfee = rs.getString(9);
				String weekendfee = rs.getString(10);
				String sitelink = rs.getString(11);
				
				FieldVO vo = new FieldVO(field_id, name, membership, hole, address, tel, caddyfee, cartfee, weekfee, weekendfee, sitelink);
				
				fields.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return fields;
	}
}
