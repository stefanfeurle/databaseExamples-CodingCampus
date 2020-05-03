package com.tsf.database;

import com.tsf.view.RestaurantView;
import java.sql.*;

public class DbConnector {
    private Connection connection = null;
    private Statement statement = null;
    private static final String url = "jdbc:mysql://localhost:3306/gastronomy?user=root";
    RestaurantView restaurantView = new RestaurantView();

    private static DbConnector instance = null;
    private DbConnector() {}

    public static DbConnector getInstance() {
        if (instance == null) {
            instance = new DbConnector();
        }
        return instance;
    }

    private void buildConnection() {
        try {
            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
        } catch (SQLException ex) {
            restaurantView.printOutput("Could not build connection!");
            ex.printStackTrace();
        }
    }

    public void closeConnection() {
        try {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            restaurantView.printOutput("Could not close connection!");
            ex.printStackTrace();
        }
    }

    public boolean deleteData (String sql) {
        buildConnection();
        try {
            int result = statement.executeUpdate(sql);
            if (result == 1)  {
                restaurantView.printOutput("Delete successful (update your data)");
                return true;
            } else {
                restaurantView.printOutput("No matching entry found");
                return false;            }
        } catch (SQLException ex) {
            restaurantView.printOutput("Delete failed!");
            ex.printStackTrace();
            return false;
        } finally {
            closeConnection();
        }
    }

    public boolean insertData (String sql) {
        buildConnection();
        try {
            int result = statement.executeUpdate(sql);
            if (result == 1) {
                restaurantView.printOutput("Insert of new data successful (update your data)");
                return true;
            } else {
                restaurantView.printOutput("Insert failed");
                return false;
            }
        } catch (SQLException ex) {
            restaurantView.printOutput("Insert failed");
            ex.printStackTrace();
            return false;
        } finally {
            closeConnection();
        }
    }

    public boolean updateData (String sql) {
        buildConnection();
        try {
            int result = statement.executeUpdate(sql);
            if (result == 1) {
                restaurantView.printOutput("Update of data successful (update your data)");
                return true;
            } else {
                restaurantView.printOutput("Update failed");
                return false;
            }
        } catch (SQLException ex) {
            restaurantView.printOutput("Update failed");
            ex.printStackTrace();
            return false;
        } finally {
            closeConnection();
        }
    }

    public ResultSet selectData (String sql) {
        buildConnection();
        try {
            return statement.executeQuery(sql);
        } catch (SQLException ex) {
            restaurantView.printOutput("Could not selcect data!");
            ex.printStackTrace();
            closeConnection();
        }
        return null;
    }
}
