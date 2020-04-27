package com.tsf.database.repositories;

import com.tsf.database.DbConnector;
import com.tsf.database.models.KindOfMenu;
import com.tsf.database.models.Restaurant;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KindOfMenuRepository implements Repository<KindOfMenu> {
    private DbConnector dbConnector = DbConnector.getInstance();
    private ArrayList<KindOfMenu> kinds = new ArrayList<>();
    private Restaurant restaurant;

    public KindOfMenuRepository(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    @Override
    public KindOfMenu findOne(String key) {
        int id = Integer.parseInt(key);
        return null;
    }

    @Override
    public void create(KindOfMenu entity) {
        String sql = "Insert into kind_of_menu (name, description, has_same_addable_ingredient, " +
                "company_book_number_restaurant) values ('" + entity.getName() + "', '" + entity.getDescription() +
                "', " + entity.getHasSameExtras() + ", '" + entity.getCompanyBookNumber() + "');";
        boolean wasInsert = dbConnector.insertData(sql);
        if (!wasInsert) {
            System.out.println("Insert of KindOfMenu failed!");
        }
    }

    @Override
    public void update(KindOfMenu entity) {

    }

    @Override
    public ArrayList<KindOfMenu> findAll() {
        kinds.clear();
        String sql = "Select * from kind_of_menu where company_book_number_restaurant = '" + restaurant.getCompanyBookNumber() + "';";
        ResultSet resultSet = dbConnector.selectData(sql);
        if (resultSet == null) {
            System.out.println("Could not select Kind of Menu");
        }
        try {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                boolean hasSameExtras = resultSet.getBoolean("has_same_addable_ingredient");
                String companyBookNumberRestaurant = resultSet.getString("company_book_number_restaurant");

                kinds.add(new KindOfMenu(name, description, hasSameExtras, companyBookNumberRestaurant,id));
            }
        } catch (SQLException ex) {
            System.out.println("Error while parsing kinds");
            ex.printStackTrace();
        } finally {
            dbConnector.closeConnection();
        }
        return kinds;
    }
}
