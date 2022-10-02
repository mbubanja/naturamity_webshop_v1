package com.naturamity.database.dao;

import com.naturamity.database.DBConnection;
import com.naturamity.models.*;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import java.io.FileNotFoundException;
import java.util.ArrayList;

public class OrderDAO {

    public static void save(User user, ArrayList<OrderProduct> order_products)throws FileNotFoundException {
        Jdbi jdbi = DBConnection.get_connection();
        try {
            jdbi.useHandle(handle -> {
                handle.createUpdate("INSERT INTO orders (order_id, date, customer_id) VALUES(NULL, NOW(), :customer_id)")
                        .bind("customer_id", user.getUser_id()).execute();
            });
            int order_id = get_order_id();

            for (OrderProduct order_product : order_products) {
                jdbi.useHandle(handle -> {
                    handle.createUpdate("INSERT INTO order_products VALUES(:order_id, :product_id, :product_name, :product_price, :quantity)")
                            //.bind(0, order_id)
                            .bind("order_id", order_id)
                            //.bindBean(order_product)
                            .bind("product_id", order_product.getProduct_id())
                            .bind("product_name", order_product.getProduct_name())
                            .bind("product_price", order_product.getProduct_price())
                            .bind("quantity", order_product.getQuantity())
                            .execute();
                });
            }
        } catch (Exception ex) {ex.printStackTrace();}
        }


    public static int get_order_id(){
        Jdbi jdbi = DBConnection.get_connection();
        Order order = jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM orders ORDER BY order_id DESC LIMIT 1")
                    .mapToBean(Order.class)
                    .one();
        });
        return order.getOrder_id();
    }

    public static ArrayList<Order> get_all(){
        Jdbi jdbi = DBConnection.get_connection();
        return jdbi.withHandle(handle -> {
            Query all_orders_query = handle.createQuery("SELECT * FROM orders");
            return (ArrayList<Order>) all_orders_query.mapToBean(Order.class).list();
        });
    }

    public static int get_customer_id(int order_id){
        Order order = get_for_id(order_id);
        return order.getCustomer_id();
    }

    public static Order get_for_id(int order_id){
        Jdbi jdbi = DBConnection.get_connection();
        Order order= jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM orders WHERE order_id = :order_id")
                    .bind("order_id", order_id)
                    .mapToBean(Order.class)
                    .one();
        });
        return order;
    }

    public static void finish_order(int order_id) throws FileNotFoundException{
        Order order = get_for_id(order_id);
        order.setStatus(OrderStatus.finished);
        update(order);
    }

    public static void update(Order order) throws FileNotFoundException {
        Jdbi jdbi = DBConnection.get_connection();
        jdbi.useHandle(handle -> {
            handle.createUpdate("""
                    UPDATE orders SET
                    status = :status
                    WHERE order_id = :order_id""")
                    .bindBean(order)
                    .execute();
        });
    }
}
