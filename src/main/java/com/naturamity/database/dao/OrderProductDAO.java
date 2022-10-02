package com.naturamity.database.dao;

import com.naturamity.database.DBConnection;
import com.naturamity.models.OrderProduct;
import org.jdbi.v3.core.Jdbi;

import java.util.ArrayList;
import java.util.List;

public class OrderProductDAO {

    public static ArrayList<OrderProduct> all_for_order(int order_id){
        Jdbi jdbi = DBConnection.get_connection();
        List list = jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM order_products WHERE order_id = :order_id")
                    .bind("order_id", order_id)
                    .mapToBean(OrderProduct.class).list();
        });
        return (ArrayList<OrderProduct>)list;
    }
}
