package com.naturamity.models;

import java.util.HashMap;

public class Message {

    private int message_id;
    private int sender_id;
    private String title;
    private String message_text;
    private MessageStatus status;

    public Message(){}

    public Message(HashMap<String, Object> message_data){
        this.sender_id = (int)message_data.get("sender_id");
        this.title = (String)message_data.get("title");
        this.message_text = (String)message_data.get("message_text");
        if(message_data.containsKey("status"))this.status = (MessageStatus) message_data.get("status");
                else this.status = MessageStatus.valueOf("active");
    }

    public int getMessage_id() {
        return message_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    public int getSender_id() {
        return sender_id;
    }

    public void setSender_id(int sender_id) {
        this.sender_id = sender_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage_text() {
        return message_text;
    }

    public void setMessage_text(String message) {
        this.message_text = message;
    }

    public MessageStatus getStatus() {
        return status;
    }

    public void setStatus(MessageStatus status) {
        this.status = status;
    }
}
