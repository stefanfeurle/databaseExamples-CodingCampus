package com.tsf.database.repositories;

import com.tsf.database.DbConnector;
import com.tsf.database.models.Menu;
import com.tsf.database.models.Restaurant;
import com.tsf.view.MenuView;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MenuRepository implements Repository<Menu> {
    private DbConnector dbConnector = DbConnector.getInstance();
    private ArrayList<Menu> menus = new ArrayList<>();
    private Restaurant restaurant;
    private MenuView menuView;

    public MenuRepository(Restaurant restaurant, MenuView menuView) {
        this.restaurant = restaurant;
        this.menuView = menuView;
    }

    @Override
    public ArrayList<Menu> findAll() {
        menus.clear();
        String sql = "Select * from menu inner join kind_of_menu on kind_of_menu.id = menu.kind_of_menu_id " +
                "where kind_of_menu.company_book_number_restaurant = '" + restaurant.getCompanyBookNumber() + "';";
        ResultSet resultSet = dbConnector.selectData(sql);
        if (resultSet == null) {
            menuView.printOutput("Could not select menu");
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
            menuView.printOutput("Error while parsing menus");
            ex.printStackTrace();
        } finally {
            dbConnector.closeConnection();
        }
        return menus;
    }

    @Override
    public void create(Menu entity) {
        String sql = "Insert into menu (name, description, price, kind_of_menu_id) values ('" + entity.getName() +
                "', '" + entity.getDescription() + "', " + entity.getPrice() + ", " + entity.getKindId() + ");";
        boolean wasInsert = dbConnector.insertData(sql);
        if (!wasInsert) {
            menuView.printOutput("Insert of Menu failed!");
        }
    }

    @Override
    public void update(Menu entity) {
        String sql = "Update menu set name = '" + entity.getName() + "', description = '" +
                entity.getDescription() + "', price = " + entity.getPrice() + " where id = " + entity.getId() +
                " and kind_of_menu_id = " + entity.getKindId() + ";";
        boolean wasUpdate = dbConnector.updateData(sql);
        if (!wasUpdate) {
            menuView.printOutput("Update of Menu failed!");
        }
    }

    @Override
    public void delete(Menu entity) {
        String sql = "Delete from menu where id = " + entity.getId() + " and name = '" + entity.getName() +
                "' and kind_of_menu_id = " + entity.getKindId() + ";";
        boolean wasDelete = dbConnector.deleteData(sql);
        if (!wasDelete) {
            menuView.printOutput("Delete of Menu failed!");
        }
    }
}
