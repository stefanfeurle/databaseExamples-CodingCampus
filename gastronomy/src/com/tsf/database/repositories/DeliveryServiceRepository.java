package com.tsf.database.repositories;

import com.tsf.database.DbConnector;
import com.tsf.database.models.DeliveryService;
import com.tsf.database.models.Restaurant;
import com.tsf.view.DeliveryServiceView;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DeliveryServiceRepository implements Repository<DeliveryService> {
    private DbConnector dbConnector = DbConnector.getInstance();
    private ArrayList<DeliveryService> deliveryTowns = new ArrayList<>();
    private Restaurant restaurant;
    private DeliveryServiceView deliveryServiceView;

    public DeliveryServiceRepository(Restaurant restaurant, DeliveryServiceView deliveryServiceView) {
        this.restaurant = restaurant;
        this.deliveryServiceView = deliveryServiceView;
    }

    //@Override
    //public DeliveryService findOne(String key) { return null;}

    @Override
    public void create(DeliveryService entity) {
        String sql = "Insert into delivery (post_code, town, minimum_order_value, price" +
                (entity.getDiscountOrderValue() > 0 ? ", discount_order_value, discount_price" : "") +
                ", company_book_number_restaurant) values (" + entity.getPostcode() + ", '" + entity.getTown() + "', " +
                entity.getMinimumOrderValue() + ", " + entity.getPrice() + ", " + (entity.getDiscountOrderValue() > 0 ? entity.getDiscountOrderValue() +
                ", " + entity.getDiscountPrice() + ", '" : "'") + restaurant.getCompanyBookNumber() + "');";
        boolean wasInsert = dbConnector.insertData(sql);
        if (!wasInsert) {
            deliveryServiceView.printOutput("Insert of Delivery Service failed!");
        }
    }

    @Override
    public void update(DeliveryService entity) {
        String sql = "Update delivery set  town = '" + entity.getTown() + "', minimum_order_value = " +
                entity.getMinimumOrderValue() + ", price = " + entity.getPrice() +
                (entity.getDiscountOrderValue() > 0 ? ", discount_order_value = " + entity.getDiscountOrderValue() +
                        ", discount_price = " + entity.getDiscountPrice() : "")  + " where company_book_number_restaurant = '" +
                entity.getCompanyBookNumber() + "' and post_code = " + entity.getPostcode();
        boolean wasUpdate = dbConnector.updateData(sql);
        if (!wasUpdate) {
            deliveryServiceView.printOutput("Update of Delivery Service failed!");
        }

    }

    @Override
    public void delete(DeliveryService entity) {
        String sql = "Delete from delivery where post_code = " + entity.getPostcode() + " and town = '" + entity.getTown() + "';";
        boolean wasDelete = dbConnector.deleteData(sql);
        if (!wasDelete) {
            deliveryServiceView.printOutput("Delete of Delivery Service failed!");
        }

    }

    public ArrayList<DeliveryService> findAll() {
        deliveryTowns.clear();
        String sql = "Select * from delivery where company_book_number_restaurant = '" + restaurant.getCompanyBookNumber() + "';";
        ResultSet resultSet = dbConnector.selectData(sql);
        if (resultSet == null) {
            deliveryServiceView.printOutput("Could not select delivery");
        }
        try {
            while (resultSet.next()) {
                int postcode = resultSet.getInt("post_code");
                String town = resultSet.getString("town");
                int minimumOrderValue = resultSet.getInt("minimum_order_value");
                int price = resultSet.getInt("price");
                int discountOrderValue = resultSet.getInt("discount_order_value");
                int discountPrice = resultSet.getInt("discount_price");
                String companyBookNumberRestaurant = resultSet.getString("company_book_number_restaurant");

                deliveryTowns.add(new DeliveryService(postcode, town, minimumOrderValue, price, discountOrderValue, discountPrice,companyBookNumberRestaurant));
            }
        } catch (SQLException ex) {
            deliveryServiceView.printOutput("Error while parsing delivery towns");
            ex.printStackTrace();
        } finally {
            dbConnector.closeConnection();
        }
        return deliveryTowns;
    }
}
