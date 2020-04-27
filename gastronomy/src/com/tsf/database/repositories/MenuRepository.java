package com.tsf.database.repositories;

import com.tsf.database.DbConnector;
import com.tsf.database.models.DeliveryService;
import com.tsf.database.models.Menu;
import com.tsf.database.models.Restaurant;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MenuRepository implements Repository<Menu> {
    private DbConnector dbConnector = DbConnector.getInstance();
    private ArrayList<Menu> menus = new ArrayList<>();
    private Restaurant restaurant;

    public MenuRepository(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    @Override
    public ArrayList<Menu> findAll() {
        menus.clear();
        String sql = "Select * from menu inner join kind_of_menu on kind_of_menu.id = menu.kind_of_menu_id " +
                "where menu_of_kind.company_book_number_restaurant = '" + restaurant.getCompanyBookNumber() + "';";
        ResultSet resultSet = dbConnector.selectData(sql);
        if (resultSet == null) {
            System.out.println("Could not select menu");
        }
        try {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                int kindOfMenuId = resultSet.getInt("kind_of_menu_id");

                menus.add(new Menu(name, description, price, kindOfMenuId, id));
            }
        } catch (SQLException ex) {
            System.out.println("Error while parsing menus");
            ex.printStackTrace();
        } finally {
            dbConnector.closeConnection();
        }
        return menus;
    }

    @Override
    public Menu findOne(String key) {
        return null;
    }

    @Override
    public void create(Menu entity) {

    }

    @Override
    public void update(Menu entity) {

    }
}
