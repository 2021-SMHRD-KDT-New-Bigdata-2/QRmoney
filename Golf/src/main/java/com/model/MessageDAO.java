package com.model;

import java.util.ArrayList;

public class MessageDAO extends DAO {

	// �޽��� ����
	public int insertMessage(MessageVO vo) {

		int cnt = 0;
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
	public void showMessage(String email) {
		ArrayList<MessageVO> message_list = new ArrayList<MessageVO>();
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
				message_list.add(vo);
			}
		} catch (Exception e) {
			
		} finally {

		}
	}
}
