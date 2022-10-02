package com.naturamity.database.dao;

import com.naturamity.database.DBConnection;
import com.naturamity.models.Product;
import com.naturamity.models.User;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import java.io.FileNotFoundException;
import java.util.ArrayList;

public class UserDAO {

    public static ArrayList<User> all_users() throws FileNotFoundException {
        String query_string = "SELECT * FROM users";
        Jdbi jdbi = DBConnection.get_connection();
        return jdbi.withHandle(handle -> {
            Query all_users_query = handle.createQuery(query_string);
            return (ArrayList<User>) all_users_query.mapToBean(User.class).list();
        });

    }

    public static User forUsername(String username){

        String select_string = "SELECT * FROM users WHERE username = :username";
        Jdbi jdbi = DBConnection.get_connection();
        return jdbi.withHandle(handle -> {
            return handle.createQuery(select_string)
                    .bind("username", username)
                    .mapToBean(User.class)
                    .findFirst().orElse(null);
        });
    }

    public static void save(User user){
        Jdbi jdbi = DBConnection.get_connection();
        jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO users VALUES (NULL, :first_name, :last_name, :username, :password, :email, :phone, :address, :user_type)")
                    .bindBean(user)
                    .execute();
        });
    }

    public static User get(int user_id){
        Jdbi jdbi = DBConnection.get_connection();
        return jdbi.withHandle(handle -> {
           return handle.createQuery("SELECT * FROM users WHERE user_id = :user_id")
                   .bind("user_id", user_id)
                   .mapToBean(User.class)
                   .one();
        });
    }

    public static void update(User user){
        Jdbi jdbi = DBConnection.get_connection();
        jdbi.useHandle(handle -> {
            handle.createUpdate("""
                    UPDATE users SET
                    first_name = :first_name,
                    last_name = :last_name,
                    username = :username,
                    password = :password,
                    email = :email,
                    phone = :phone,
                    address = :address
                    WHERE user_id = :user_id""")
            .bindBean(user)
            .execute();
        });
    }

    public static void delete(int user_id){
        Jdbi jdbi = DBConnection.get_connection();
        jdbi.useHandle(handle -> {
            handle.createUpdate("DELETE * FROM users WHERE user_id = :user_id")
                    .bindBean("user_id", user_id)
                    .execute();
        });
    }

    public static void upgrade(int user_id){
        Jdbi jdbi = DBConnection.get_connection();
        jdbi.useHandle(handle -> {
            handle.createUpdate("""
                    UPDATE users SET
                    user_type = "manager"
                    WHERE user_id = :user_id""")
                    .bindBean("user_id", user_id)
                    .execute();
        });
    }

}
