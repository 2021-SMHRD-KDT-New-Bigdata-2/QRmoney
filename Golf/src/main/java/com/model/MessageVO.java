package com.model;

public class MessageVO {
	// �޼��� ���̺�
	
	// �ʵ�
	private int message_id;
	private int sender_id;
	private String receiver_id;
	private String message;
	private String message_date;
	private String sender_nick;
	
	// getter �޼��� 
	public int getMessage_id() {
		return message_id;
	}
	
	public int getSender_id() {
		return sender_id;
	}


	public String getReceive_id() {
		return receiver_id;
	}


	public String getMessage() {
		return message;
	}


	public String getMessage_date() {
		return message_date;
	}

	public String getSender_nick() {
		return sender_nick;
	}

	// ������

	public MessageVO(int sender_id, String receiver_id, String message) {
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.message = message;
	}
	
	public MessageVO(int message_id, String message, String message_date, String sender_nick) {
		super();
		this.message_id = message_id;
		this.message = message;
		this.message_date = message_date;
		this.sender_nick = sender_nick;
	}

	
}
