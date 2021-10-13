package com.model;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;



public class FollowDAO extends DAO{
	int result = 0;
	
	
	
//	�Է°��� ����� ���ӳ� Ȯ���ϴ� ��� text�� ������ ������ �𸣰���
	public String FollowEmailConfirm(String email) {
		getConn();
		String get_memberid=null;
		try {
			String sql="select member_id, nickname from members where email=?";
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, email);
			
			rs=psmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("����ε� �̸��ϰ��� ���ӽ��ϴ�. �ȷο����� �����մϴ�.");
				get_memberid=rs.getString("member_id");
				
			}else {
				System.out.println("�߸��� �̸����� ���Խ��ϴ�.");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return get_memberid;
	}
		
	
	
//	�ȷο��ϴ� ���
	public int FollowHaJa(FollowVO vo) {
		getConn();
		try {
									
			String sql="insert into follow values(FOLLOW_SEQ.nextval,?,?)";
			
			psmt =conn.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(vo.getFOLLOWER_ID()));
			psmt.setInt(2, Integer.parseInt(vo.getFOLLOWING_ID()));
			
			result = psmt.executeUpdate();
					
					
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
//	�ȷο� ���±��
	public int FollowAnHe(FollowVO vo) {
		getConn();
		try {
			String sql ="delete from follow where follower_id=? and following_id=?";
			
			psmt =conn.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(vo.getFOLLOWER_ID()));
			psmt.setInt(2, Integer.parseInt(vo.getFOLLOWING_ID()));
			
			result =psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public ArrayList<FollowVO> ShowFollower(String member_id){
		ArrayList<FollowVO> followlist = new ArrayList<FollowVO>();
		getConn();
		
		try {
			String sql ="select nickname, gender from members where member_id in (select following_id from follow where follower_id=?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(member_id));
			
			
			rs=psmt.executeQuery();
			
			while (rs.next()) {
				String nickname = rs.getString("nickname");
				String gender = rs.getString("gender");
				
				FollowVO vo = new FollowVO(nickname, gender);
				followlist.add(vo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return followlist;
	}
	
	public ArrayList<FollowVO> ShowFolloweing(String member_id){
		ArrayList<FollowVO> followlist = new ArrayList<FollowVO>();
		getConn();
		
		try {
			String sql ="select nickname, gender from members where member_id in (select follower_id from follow where following_id=?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(member_id));
			
			
			rs=psmt.executeQuery();
			
			while (rs.next()) {
				String nickname = rs.getString("nickname");
				System.out.println(nickname);
				String gender = rs.getString("gender");
				System.out.println(gender);
				FollowVO vo = new FollowVO(nickname, gender);
				System.out.println(vo);
				followlist.add(vo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return followlist;
	}
}
