package com.tsf.database;

import java.sql.*;

public class DbConnector {
    private Connection connection = null;
    private Statement statement = null;
    private static final String url = "jdbc:mysql://localhost:3306/gastronomy?user=root";

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
            System.out.println("Could not build connection!");
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
            System.out.println("Could not close connection!");
            ex.printStackTrace();
        }
    }

    public boolean deleteData (String sql) {
        buildConnection();
        try {
            int result = statement.executeUpdate(sql);
            System.out.println(result == 1 ? "Delete successful (update your data)" : "No matching entry found");
            if (result == 1)  {return true;
            } else {return false;            }
        } catch (SQLException ex) {
            System.out.println("Delete failed!");
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
            System.out.println(result == 1 ? "Insert of new data successful" : "Insert failed");
            if (result == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("Insert failed");
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
            System.out.println(result == 1 ? "Update of data successful (update your data)" : "Update failed");
            if (result == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("Update failed");
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
            System.out.println("Could not selcect data!");
            ex.printStackTrace();
            closeConnection();
        }
        return null;
    }
}
