package com.naturamity.database.dao;

import com.naturamity.database.DBConnection;
import com.naturamity.models.Message;
import com.naturamity.models.Product;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import java.io.FileNotFoundException;
import java.util.ArrayList;

public class MessageDAO {

    public static ArrayList<Message> all_messages() throws FileNotFoundException {
        String query_string = "SELECT * FROM messages";
        Jdbi jdbi = DBConnection.get_connection();
        return jdbi.withHandle(handle -> {
            Query all_messages_query = handle.createQuery(query_string);
            return (ArrayList<Message>) all_messages_query.mapToBean(Message.class).list();
        });
    }

    public static void save(Message message){
        Jdbi jdbi = DBConnection.get_connection();
        jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO messages VALUES (NULL, :sender_id, :title, :message_text, :status)")
                    .bindBean(message)
                    .execute();
        });
    }

    public static Message get(int message_id) throws FileNotFoundException {
        Jdbi jdbi = DBConnection.get_connection();
        return jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM messages WHERE message_id = :message_id")
                    .bind("message_id", message_id)
                    .mapToBean(Message.class)
                    .one();

        });
    }
}
