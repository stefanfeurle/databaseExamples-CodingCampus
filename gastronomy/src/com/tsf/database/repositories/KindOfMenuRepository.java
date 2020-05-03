package com.tsf.database.repositories;

import com.tsf.database.DbConnector;
import com.tsf.database.models.KindOfMenu;
import com.tsf.database.models.Restaurant;
import com.tsf.view.KindOfMenuView;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KindOfMenuRepository implements Repository<KindOfMenu> {
    private DbConnector dbConnector = DbConnector.getInstance();
    private ArrayList<KindOfMenu> kinds = new ArrayList<>();
    private Restaurant restaurant;
    private KindOfMenuView kindOfMenuView;

    public KindOfMenuRepository(Restaurant restaurant, KindOfMenuView kindOfMenuView) {
        this.restaurant = restaurant;
        this.kindOfMenuView = kindOfMenuView;
    }

    @Override
    public void create(KindOfMenu entity) {
        String sql = "Insert into kind_of_menu (name, description, has_same_addable_ingredient, " +
                "company_book_number_restaurant) values ('" + entity.getName() + "', '" + entity.getDescription() +
                "', " + entity.getHasSameExtras() + ", '" + restaurant.getCompanyBookNumber() + "');";
        boolean wasInsert = dbConnector.insertData(sql);
        if (!wasInsert) {
            kindOfMenuView.printOutput("Insert of KindOfMenu failed!");
        }
    }

    @Override
    public void update(KindOfMenu entity) {
        String sql = "Update kind_of_menu set name = '" + entity.getName() + "', description = '" +
                entity.getDescription() + "' where id = " + entity.getId() +
                " and company_book_number_restaurant = '" + entity.getCompanyBookNumber() + "';";
        boolean wasUpdate = dbConnector.updateData(sql);
        if (!wasUpdate) {
            kindOfMenuView.printOutput("Update of KindOfMenu failed!");
        }
    }

    @Override
    public void delete(KindOfMenu entity) {
        String sql = "Delete from kind_of_menu where id = " + entity.getId() + " and name = '" + entity.getName() +
                "' and company_book_number_restaurant = '" + entity.getCompanyBookNumber() + "';";
        boolean wasDelete = dbConnector.deleteData(sql);
        if (!wasDelete) {
            kindOfMenuView.printOutput("Delete of KindOfMenu failed!");
        }
    }

    @Override
    public ArrayList<KindOfMenu> findAll() {
        kinds.clear();
        String sql = "Select * from kind_of_menu where company_book_number_restaurant = '" + restaurant.getCompanyBookNumber() + "';";
        ResultSet resultSet = dbConnector.selectData(sql);
        if (resultSet == null) {
            kindOfMenuView.printOutput("Could not select Kind of Menu");
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
            kindOfMenuView.printOutput("Error while parsing kinds");
            ex.printStackTrace();
        } finally {
            dbConnector.closeConnection();
        }
        return kinds;
    }
}
