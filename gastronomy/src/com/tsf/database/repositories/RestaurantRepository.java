package com.tsf.database.repositories;

import com.tsf.database.DbConnector;
import com.tsf.database.models.Restaurant;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RestaurantRepository {
    private DbConnector dbConnector;

    public RestaurantRepository() {
        this.dbConnector = DbConnector.getInstance();
    }

    public Restaurant loginUser(String userName, String password) {
        ResultSet resultSet = dbConnector.selectData("Select * from restaurant where company_book_number = '" +
                userName + "' and password = '" + password + "';");
         Restaurant restaurant = null;
        if (resultSet == null) {
            System.out.println("\nFalscher Username oder Passwort\n");
            return null;
        }
        try {
            while (resultSet.next()) {
                String companyBookNumber = resultSet.getString("company_book_number");
                String kindOfRestaurant = resultSet.getString("kind_of_restaurant");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String homepage = resultSet.getString("homepage");
                String phoneNumber = resultSet.getString("phone_number");
                int postCode = resultSet.getInt("post_code");
                String town = resultSet.getString("town");
                String street = resultSet.getString("street");
                int houseNumber = resultSet.getInt("house_number");
                String passWord = resultSet.getString("password");
                String creationDate = resultSet.getDate("creation_date").toString();
                String creationTime = resultSet.getTime("creation_date").toString();

                restaurant = new Restaurant(companyBookNumber, kindOfRestaurant, name, email, homepage,
                        phoneNumber, postCode, town, street, houseNumber, passWord, creationDate + " " + creationTime);
            }
        } catch (SQLException ex) {
            System.out.println("Error while parsing restaurant");
            ex.printStackTrace();
        } finally {
            dbConnector.closeConnection();
        }
        return restaurant;
    }

    public boolean createAccount(String companyBookNumber, String kindOfRestaurant, String name, String email,
                              String homepage, String phoneNumber, int postCode, String town, String street,
                              int houseNumber, String password) {

        String sql = "Insert into restaurant (company_book_number, kind_of_restaurant, name, email, homepage, " +
                "phone_number, post_code, town, street, house_number, password) values ('" + companyBookNumber +
                "', '" + kindOfRestaurant + "', '" + name + "', '" + email + "', '" + homepage + "', '" + phoneNumber +
                "', " + postCode + ", '" + town + "', '" + street + "', " + houseNumber + ", '" + password + "');";
        return dbConnector.insertData(sql);
    }
}



