package com.company;

import java.sql.*;
import java.util.Scanner;

public class Gastro {
    String url = "jdbc:mysql://localhost:3306/gastronomy?user=root";
    Connection connection = null;
    Statement statement = null;

    int state = 0;
    String companyBookNumber;
    String name;

    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);

    int counterKind = 0;

    int [] idKinds = new int[20];

    public void createAccount (String companyBookNumber1, String kindOfRestaurant, String name1,  String email,
                              String homepage,  String phoneNumber,  int postCode, String town, String street,
                              int houseNumber, String password) {
        try {
            String sql = "Insert into restaurant (company_book_number, kind_of_restaurant, name, email, homepage, " +
                    "phone_number, post_code, town, street, house_number, password) values ('" + companyBookNumber1 +
                    "', '" + kindOfRestaurant + "', '" + name1 + "', '" + email + "', '" + homepage + "', '" + phoneNumber +
                    "', " + postCode + ", '" + town + "', '" + street + "', " + houseNumber + ", '" + password + "');";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            int update = statement.executeUpdate(sql);
            if (update == 1) {
                System.out.println("Herzlich Willkommen!\nWICHTIG -ihr Username ist ihre UID-Nummer (" +
                        companyBookNumber1 + ")\n(Account erfolgreich erstellt!)\n");
                state = 1;
                companyBookNumber = companyBookNumber1;
                name = name1;
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

    public void loginUser(String userName, String password) {
        try {
            String sql = "Select company_book_number, password, name from restaurant";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                String companyBookNumber1 = resultset.getString("company_book_number");
                String passWord = resultset.getString("password");
                String name1 = resultset.getString("name");

                if (companyBookNumber1.equals(userName) && passWord.equals(password)) {
                    companyBookNumber = companyBookNumber1;
                    name = name1;
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

    public void inputKindOfMenu() {
        System.out.println("Wieviele Arten von Menüs möchten sie eingeben! (ca.)");
        int counter = scanNum.nextInt();

        for (int i = 0; i < counter; i++) {
            System.out.println("\nBitte den Namen der Art des Menüs eingeben!");
            String name = scanText.nextLine();
            System.out.println("Wenn sie möchten können sie hier eine kurze Beschreibung hinterlegen!\n" +
                    "(z.B. Alle Pizzas (26 cm) werden mit Tomatensauce und Mozzarella gemacht!)");
            String description = scanText.nextLine();
            System.out.println("Möchten Sie jedem Menü (jeder Speise) der Art " + name + " die selben Extras (Zutaten) " +
                    "anbieten!\n(Später können sie auch jedem Menü (jeder Speise seperat die Extras (Zutaten) zuweisen!)" +
                    "\n1. ja\n0. nein");
            int controlNumber = scanNum.nextInt();
            String sql = "Insert into kind_of_menu (name, description, has_same_addable_ingredient) values " +
                    "('" + name + "', '" + description + "', '" + controlNumber + "');";

            if (!name.equalsIgnoreCase("")) {
                try {
                    connection = DriverManager.getConnection(url);
                    statement = connection.createStatement();
                    statement.executeUpdate(sql);
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
            }
        }
    }

    public void inputMenu() {
        int selectNumber = 0;
        while (selectNumber < 1 || selectNumber >= counterKind) {
            printKindOfMenu();
            System.out.println("Welche der oben genannten Arten von Speisen wollen sie ihre(n) Speise(n) zuordnen!\n 0. Neue Art\n");
            selectNumber = scanNum.nextInt();
            if (selectNumber == 0) {
                inputKindOfMenu();
            }
        }


    }

    public void printKindOfMenu() {
        counterKind = 1;
        try {
            String sql = "Select * from kind_of_menu;";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                int id = resultset.getInt("id");
                String name1 = resultset.getString("name");
                String description = resultset.getString("description");
                boolean hasSameExtras = resultset.getBoolean("has_same_addable_ingredient");

                System.out.print(counterKind < 10 ? " " : "");
                System.out.print(counterKind + ". " + name1.toUpperCase());
                System.out.println(hasSameExtras ? " (alle Gerichte haben die selben Extras)" : "");
                System.out.println(description.equalsIgnoreCase("") ?"" : "    " + description + "\n");
                idKinds[counterKind] = id;
                counterKind++;
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
}
