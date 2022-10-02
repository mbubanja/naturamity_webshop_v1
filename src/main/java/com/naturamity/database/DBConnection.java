package com.naturamity.database;

import org.jdbi.v3.core.Jdbi;

public class DBConnection {

    private static Jdbi jdbi = null;

    public static Jdbi get_connection(){
        if(jdbi == null)
            jdbi = jdbi.create("jdbc:mysql://localhost/naturamity", "root", "");
        return jdbi;
    }
}
