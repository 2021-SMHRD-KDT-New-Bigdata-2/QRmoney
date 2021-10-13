package com.model;

import java.util.ArrayList;

public class MessageDAO extends DAO {

	int cnt = 0;
	// �޽��� ����
	public int insertMessage(MessageVO vo) {

		getConn();

		try {
			String sql = "insert into messages values(messages_seq.nextval, ?, ?, ?, sysdate)";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, vo.getSender_id());
			psmt.setInt(2, vo.getReceive_id());
			psmt.setString(3, vo.getMessage());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// ������ �� �޼��� Ȯ���ϱ�
	public ArrayList<MessageVO> showMessage(String email) {
		ArrayList<MessageVO> messageList = new ArrayList<MessageVO>();
		getConn();

		try {
			String sql = "select * from messages where receiver_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, email);
			rs = psmt.executeQuery();

			// sender_id => nickname���� �����ϱ� 
			while (rs.next()) {
				int sender_id = rs.getInt("sender_id");
				int receiver_id = rs.getInt("receiver_id");
				String message = rs.getString("message");
				String message_date = rs.getString("message_date");

				MessageVO vo = new MessageVO(sender_id, receiver_id, message, message_date);
				messageList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return messageList;
	}
	
	// �޼��� ��ü �����ϱ�
	public int deleteAll(String email){
		
		getConn();
		
		try {
			String sql = "delete from messages where receiver_id=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			
			cnt = psmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	// �޼��� ���� �����ϱ� 
	public int deleteOne(String num) {
		
		getConn();
		
		try {
			
			String sql = "delete from messages where message_id=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, num);
			
			cnt = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
