package com.tsf.database.repositories;

import com.tsf.database.DbConnector;
import com.tsf.database.models.Ingredient;
import com.tsf.database.models.Restaurant;
import com.tsf.view.IngredientView;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class IngredientRepository implements Repository<Ingredient> {
    private DbConnector dbConnector = DbConnector.getInstance();
    private ArrayList<Ingredient> ingredients = new ArrayList<>();
    private Restaurant restaurant;
    private IngredientView ingredientView;

    public IngredientRepository(Restaurant restaurant, IngredientView ingredientView) {
        this.restaurant = restaurant;
        this.ingredientView = ingredientView;
    }

    @Override
    public ArrayList<Ingredient> findAll() {
        ingredients.clear();
        String sql = "SELECT * FROM `ingredient` inner join menu on menu.id = ingredient.menu_id " +
                "inner join kind_of_menu on kind_of_menu.id = menu.kind_of_menu_id " +
                "WHERE kind_of_menu.company_book_number_restaurant = '" + restaurant.getCompanyBookNumber() + "';";
        ResultSet resultSet = dbConnector.selectData(sql);
        if (resultSet == null) {
            ingredientView.printOutput("Could not select ingredient");
        }
        try {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                boolean isRemovable = resultSet.getBoolean("is_removable");
                boolean isAddable = resultSet.getBoolean("is_addable");
                int menuId = resultSet.getInt("menu_id");

                ingredients.add(new Ingredient(name, price, isRemovable, isAddable, menuId , id));
            }
        } catch (SQLException ex) {
            ingredientView.printOutput("Error while parsing ingredients");
            ex.printStackTrace();
        } finally {
            dbConnector.closeConnection();
        }
        return ingredients;
    }

    @Override
    public void create(Ingredient entity) {
        String sql = "Insert into ingredient (name, price, is_removable, is_addable, menu_id) values ('" + entity.getName() +
                "', " + entity.getPrice() + ", " + entity.isRemovable() + ", " + entity.isAddable() + ", " + entity.getMenuId() + ");";
        boolean wasInsert = dbConnector.insertData(sql);
        if (!wasInsert) {
            ingredientView.printOutput("Insert of Ingredient failed!");
        }

    }

    @Override
    public void update(Ingredient entity) {
        String sql = "Update ingredient set name = '" + entity.getName() + "', price = " + entity.getPrice() +
                " where id = " + entity.getId() + " and menu_id = " + entity.getMenuId() + ";";
        boolean wasUpdate = dbConnector.updateData(sql);
        if (!wasUpdate) {
            ingredientView.printOutput("Update of Ingredient failed!");
        }
    }

    @Override
    public void delete(Ingredient entity) {
        String sql = "Delete from ingredient where id = " + entity.getId() + " and name = '" + entity.getName() +
                "' and menu_id = " + entity.getMenuId();
        boolean wasDelete = dbConnector.deleteData(sql);
        if (!wasDelete) {
            ingredientView.printOutput("Delete of Ingredient failed!");
        }
    }
}
