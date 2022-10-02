package com.naturamity.database.dao;

import com.naturamity.database.DBConnection;
import com.naturamity.models.Product;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import java.io.FileNotFoundException;
import java.util.ArrayList;

public class ProductDAO {

    public static ArrayList<Product> all_products() throws FileNotFoundException{
        String query_string = "SELECT * FROM products";
        Jdbi jdbi = DBConnection.get_connection();
        return jdbi.withHandle(handle -> {
            Query all_products_query = handle.createQuery(query_string);
            return (ArrayList<Product>) all_products_query.mapToBean(Product.class).list();
        });

    }

    public static Product get(int product_id) throws FileNotFoundException {
        Jdbi jdbi = DBConnection.get_connection();
        return jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products WHERE product_id = :product_id")
                    .bind("product_id", product_id)
                    .mapToBean(Product.class)
                    .one();

        });
    }

    public static void save(Product product){
        Jdbi jdbi = DBConnection.get_connection();
        jdbi.useHandle(handle -> {
            handle.createUpdate("INSERT INTO products VALUES (NULL, :name, :description, :image, :net_weight, :price, :category)")
                    .bindBean(product)
                    .execute();
        });
    }

    public static void update(Product product) throws FileNotFoundException {
        Jdbi jdbi = DBConnection.get_connection();
        jdbi.useHandle(handle -> {
            handle.createUpdate("""
                    UPDATE products SET
                    name = :name,
                    description = :description, 
                    image = :image, 
                    net_weight = :net_weight, 
                    price = :price,
                    category = :category
                    WHERE product_id = :product_id""")
                    .bindBean(product)
                    .execute();
        });
    }

    public static void delete(int product_id) throws FileNotFoundException {
        Jdbi jdbi = DBConnection.get_connection();
        jdbi.useHandle(handle -> {
            handle.createUpdate("DELETE FROM products WHERE product_id = :product_id")
                    .bind("product_id", product_id)
                    .execute();
        });

    }
}
