package com.naturamity.models;

import java.io.Serializable;
import java.util.HashMap;

public class User implements Serializable {

    private int user_id;
    private String first_name;
    private String last_name;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String address;
    private UserType user_type;

    public User(){}

    public User(HashMap<String, Object> user_data) {
        if(user_data.containsKey("user_id")){this.user_id = (int)user_data.get("user_id");}
        if(user_data.containsKey("first_name")){this.first_name = (String)user_data.get("first_name");}
        if(user_data.containsKey("last_name")){this.last_name = (String)user_data.get("last_name");}
        if(user_data.containsKey("username")){this.username = (String)user_data.get("username");}
        if(user_data.containsKey("password")){this.password = (String)user_data.get("password");}
        if(user_data.containsKey("email")){this.email = (String)user_data.get("email");}
        if(user_data.containsKey("phone")){this.phone = (String)user_data.get("phone");}
        if(user_data.containsKey("address")){this.address = (String)user_data.get("address");}
        if(user_data.containsKey("user_type")){this.user_type = (UserType)user_data.get("user_type");}
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public UserType getUser_type() {
        return user_type;
    }

    public void setUser_type(UserType user_type) {
        this.user_type = user_type;
    }
}
