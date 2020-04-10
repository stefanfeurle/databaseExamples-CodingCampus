package com.company;

import java.sql.*;

public class Chat {
    String url = "jdbc:mysql://localhost:3306/chat?user=root";
    Connection connection = null;
    Statement statement = null;
    String userName = "";
    String name = "";
    int state = 0;

    public void createAccount(String firstName, String lastName, String email, String password){
        try {
            String userName1 = firstName.toLowerCase() + "." + lastName.toLowerCase();
            //sollte wahrscheinlich kontrollieren, ob dieser unsername schon einmal vorkommt...
            String sql = "Insert into user (user_name, password, first_name, last_name, email) values ('" + userName1 + "', '";
            sql += password + "', '" + firstName + "', '" + lastName + "', '" + email + "');";

            connection = DriverManager.getConnection(url);
            //System.out.println("Connacted to Database!");
            statement = connection.createStatement();
            int update = statement.executeUpdate(sql);
            if (update == 1) {
                System.out.println("Hallo " + firstName + "!\nWICHTIG -dein Username ist\n" + userName1 + "\n(Account erfolgreich erstellt!)\n");
                state = 1;
                name = firstName;
                userName = userName1;
            }
            statement.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void loginUser(String userName1, String password) {
        try {
            String sql = "Select user_name, password, first_name from user";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                String userN = resultset.getString("user_name");
                String passW = resultset.getString("password");
                String firstName = resultset.getString("first_name");

                if (userN.equals(userName1) && passW.equals(password)) {
                    userName = userName1;
                    name = firstName;
                    state = 1;
                }
            }
            statement.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public boolean checkUnreadMessage() {
        boolean isUnread = false;
        try {
            String sql = "Select is_unread from received_message where is_unread = 1 and ";
            sql += "user_user_name = '" + userName + "';";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                isUnread = resultset.getBoolean("is_unread");
            }
            statement.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return isUnread;
    }

    public void sendMessage(String receiverUserName, String message) {
        try {
            String sql = "Select user_name from user";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            boolean correctReceiver = false;

            while (resultset.next()) {
                String userN = resultset.getString("user_name");

                if (userN.equals(receiverUserName) ) {
                   correctReceiver = true;
                }
            }
            statement.close();
            if (!correctReceiver) {
                System.out.println("\nVersenden war nicht möglich, eventuell weil der Username des Empfängers nicht richtig ist!\n");
            } else {
                sql = "Insert into received_message (sender, message, is_unread, user_user_name) values ('" + userName + "', '";
                sql += message + "', 1, '" + receiverUserName + "');";

                statement = connection.createStatement();
                statement.executeUpdate(sql);
                statement.close();

                sql = "Insert into sent_message (receiver, message, user_user_name) values ('" + receiverUserName;
                sql += "', '" + message + "', '" + userName + "');";

                statement = connection.createStatement();
                statement.executeUpdate(sql);
                statement.close();
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void printUnreadMessages() {
        try {
            boolean noUnreadMessage = true;
            String sql = "Select sender, creation_date, message from received_message where is_unread = 1 and ";
            sql += "user_user_name = '" + userName + "';";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                String sender = resultset.getString("sender");
                String date = resultset.getDate("creation_date").toString();
                String time = resultset.getTime("creation_date").toString();
                String message = resultset.getString("message");

                System.out.println("\nAbsender:\t " + sender);
                System.out.println(date + " " + time + "\nNachricht:\n" + message +"\n");
                noUnreadMessage = false;
            }
            statement.close();
            if (noUnreadMessage) {
                System.out.println("\nKeine ungelesenen Nachrichten\n");
            } else {
                sql = "update received_message set is_unread = 0 where user_user_name = '" + userName + "';";

                statement = connection.createStatement();
                statement.executeUpdate(sql);
                statement.close();
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void printReceivedMessages(int limitNumber) {
        try {
            boolean noMessage = true;
            String sql = "Select sender, creation_date, message from received_message where user_user_name = '";
            sql += userName + "' order by creation_date desc limit " + limitNumber + ";";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                String sender = resultset.getString("sender");
                String date = resultset.getDate("creation_date").toString();
                String time = resultset.getTime("creation_date").toString();
                String message = resultset.getString("message");

                System.out.println("\nAbsender:\t " + sender);
                System.out.println(date + " " + time + "\nNachricht:\n" + message +"\n");
                noMessage = false;
            }
            statement.close();
            if (noMessage) {
                System.out.println("\nKeine erhaltenen Nachrichten\n");
            } else {
                sql = "update received_message set is_unread = 0 where user_user_name = '" + userName + "';";

                statement = connection.createStatement();
                statement.executeUpdate(sql);
                statement.close();
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    public void printSentMessages(int limitNumber) {
        try {
            boolean noMessage = true;
            String sql = "Select receiver, creation_date, message from sent_message where user_user_name = '";
            sql += userName + "' order by creation_date desc limit " + limitNumber + ";";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                String receiver = resultset.getString("receiver");
                String date = resultset.getDate("creation_date").toString();
                String time = resultset.getTime("creation_date").toString();
                String message = resultset.getString("message");

                System.out.println("\nGesendet an:\t " + receiver);
                System.out.println(date + " " + time + "\nNachricht:\n" + message +"\n");
                noMessage = false;
            }
            statement.close();
            if (noMessage) {
                System.out.println("\nKeine gesendeten Nachrichten\n");
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
