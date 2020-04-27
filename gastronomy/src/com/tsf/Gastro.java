package com.tsf;

import com.tsf.database.models.KindOfMenu;
import com.tsf.database.repositories.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;

public class Gastro {
    String url = "jdbc:mysql://localhost:3306/gastronomy?user=root";
    Connection connection = null;
    Statement statement = null;

    int state = 0;
    String companyBookNumber;
    String nameRestaurant;

    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);
    Scanner scanDou = new Scanner(System.in);

    int counterKind = 0;
    int counterMenu = 0;

    int[] idKinds = new int[20];
    int[] idMenus = new int[200];

    int selectNumberKind = 0;
    int selectNumberMenu = 0;

    ArrayList<Repository> list = new ArrayList<>();

    public void addList(KindOfMenu kind) {
        list.add((Repository) kind);
    }


    public void createAccount(String companyBookNumber1, String kindOfRestaurant, String name, String email,
                              String homepage, String phoneNumber, int postCode, String town, String street,
                              int houseNumber, String password) {
        //Menu menu = new Menu(0, "", 0.0);

        /*
        insert into menu ...
         */
        try {
            String sql = "Insert into restaurant (company_book_number, kind_of_restaurant, name, email, homepage, " +
                    "phone_number, post_code, town, street, house_number, password) values ('" + companyBookNumber1 +
                    "', '" + kindOfRestaurant + "', '" + name + "', '" + email + "', '" + homepage + "', '" + phoneNumber +
                    "', " + postCode + ", '" + town + "', '" + street + "', " + houseNumber + ", '" + password + "');";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            int update = statement.executeUpdate(sql);
            if (update == 1) {
                System.out.println("Herzlich Willkommen!\nWICHTIG -ihr Username ist ihre UID-Nummer (" +
                        companyBookNumber1 + ")\n(Account erfolgreich erstellt!)\n");
                state = 1;
                companyBookNumber = companyBookNumber1;
                nameRestaurant = name;
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
                String name = resultset.getString("name");

                if (companyBookNumber1.equals(userName) && passWord.equals(password)) {
                    companyBookNumber = companyBookNumber1;
                    nameRestaurant = name;
                    state = 1;
                }
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
            System.out.println("Möchten Sie jedem Menü (jeder Speise) dieser Art " + name + " die selben Extras (Zutaten) " +
                    "anbieten!\n(Später können sie auch jedem Menü (jeder Speise seperat die Extras (Zutaten) zuweisen!)" +
                    "\n1. ja\n0. nein");
            int controlNumber = scanNum.nextInt();
            String sql = "Insert into kind_of_menu (name, description, has_same_addable_ingredient) values " +
                    "('" + name + "', '" + description + "', '" + controlNumber + "');";

            if (!nameRestaurant.equalsIgnoreCase("")) {
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
        selectKind();
        if (selectNumberKind != 0) {
            System.out.println("Wieviele Menüs (Speisen) wollen sie dieser Art zuordnen!\n");
            int counter = scanNum.nextInt();

            for (int i = 0; i < counter; i++) {
                System.out.println("Bitte den Namen des Menüs (Speise) eingeben!\n");
                String name = scanText.nextLine();

                if (!name.equalsIgnoreCase("")) {
                    System.out.println("Wenn sie möchten können sie hier eine kurze Beschreibung hinterlegen!\n" +
                            "(z.B. mit Putenfleisch!)\n");
                    String description = scanText.nextLine();
                    System.out.println("Geben sie den Preis für dieses Menü ein! (Komma = ,)\n");
                    double price = scanDou.nextDouble();
                    String sql = "insert into menu (name, description, price, kind_of_menu_id, company_book_number_restaurant) " +
                            "values ('" + name + "', '" + description + "', " + price + ", "
                            + idKinds[selectNumberKind] + ", '" + companyBookNumber + "');";
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
    }

    public void inputIngredient() {
        selectKind();
        int selectNumber = -1;
        if (selectNumberKind == 0) {
            selectNumber = 0;
        } else {
            selectMenu();
        }
        if (selectNumberMenu == 0) {
            selectNumber = 0;
        }
        while (selectNumber != 0) {
            System.out.println("Sie können (müssen aber nicht) jetzt auf drei verschiedene Arten Zutaten hinterlegen!" +
                    "\n1. Zutaten des Menüs (reine Information)\n2. Zutaten, die von der Speise entfernt werden könnten" +
                    "\n3. Zutaten, die als Extras hinzugefügt werden könnten" +
                    "\n   (wie sie schon gesehen haben, können diese auch über eine ganze Art von Speisen angeboten werden," +
                    "\n   aber dafür müssen sie unter Art von Speisen dies bejaht haben oder noch machen)\n0. Abbruch\n");
            selectNumber = scanNum.nextInt();
            if (selectNumber == 3) {
                selectNumber = checkSameIngredient(selectNumber);
                System.out.print(selectNumber == 4 ? "Keine Eingabe mehr möglich (nur noch unter Bearbeitung änderbar)\n\n" : "");
            }

            if (selectNumber > 0 && selectNumber < 4) {
                System.out.println("\nWieviele Zutaten möchten sie hinterlegen!\n");
                int counter = scanNum.nextInt();

                for (int i = 0; i < counter; i++) {
                    boolean isRemoveable = false;
                    boolean isAddable = false;
                    System.out.print("Geben sie eine Zutat ein! ");
                    if (selectNumber == 1) {
                        System.out.println("(reine Information!)\n");
                    } else if (selectNumber == 2) {
                        System.out.println("(entfernbare Zutat!)\n");
                        isRemoveable = true;
                    } else {
                        System.out.println("(hinzufügbare Zutat)\n");
                        isAddable = true;
                    }
                    String name = scanText.nextLine();
                    if (!name.equalsIgnoreCase("")) {
                        double price = 0;
                        if (selectNumber == 3) {
                            System.out.println("\nHier können sie ihrer hinzufügbaren Zutat einen Preis geben, ansonsten 0! (Komma = ,)\n");
                            price = scanDou.nextDouble();
                        }
                        String sql = "Insert into ingredient (name, " + (selectNumber == 3 && price != 0 ? "price, " : "") +
                                "is_removeable, is_addable, menu_id) values ('" + name + "', " +
                                (selectNumber == 3 && price != 0 ? price + ", " : "") + isRemoveable + ", " + isAddable
                                + ", " + idMenus[selectNumberMenu] + ");";
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
        }
    }

    public void inputDeliveryTowns () {
        System.out.println("Sie können hier ihre Lieferorte anlegen. Weiters bitten wir ihnen an einen Mindestbestellwert " +
                "(Preisgrenze ab der \nsie liefern können) mit dem Lieferpreis einzutragen. Außerdem können sie einen " +
                "Rabattbestellwert (Preisgrenze ab dem sie \ngünstiger liefern wollen) mit dem dazugehörigen Lieferpreis " +
                "zu verwenden. D.h.z.Bsp. ab einer Bestellung von 10 Euro (Minimum) \nliefern sie für 5 Euro und ab 40 " +
                "Euro (Rabatt) ist die Lieferung gratis. \n\nWICHTIG! Wenn sie den Minimumpreis oder Rabattpreis nicht " +
                "verwenden wollen, geben sie einfach 0 ein!\n\nWieviele Lieferorte möchten sie hinterlegen!\n0 ...zurück");
        int counter = scanNum.nextInt();

        if (counter != 0) {
            for (int i = 0; i < counter; i++) {
                System.out.println("\nBitte geben sie einen Lieferort ein!\n");
                String town = scanText.nextLine();
                if (!town.equalsIgnoreCase("")) {
                    System.out.println("\nPostleitzahl:\n");
                    int postCode = scanNum.nextInt();
                    System.out.println("\nMindestbestellwert (Komma = ,): \n");
                    double minimumOrderValue = scanDou.nextDouble();
                    if (minimumOrderValue < 0) {
                        minimumOrderValue = 0;
                    }
                    System.out.println("\nLieferpreis ab Mindestbestellwert (Komma = ,): \n");
                    double price = scanDou.nextDouble();
                    if (price < 0) {
                        price = 0;
                    }
                    System.out.println("\nRabattbestellwertgrenze (Komma = ,): \n");
                    double discountOrderValue = scanDou.nextDouble();
                    double discountPrice = 0;
                    if (discountOrderValue <= minimumOrderValue) {
                        discountOrderValue = 0;
                    } else {
                        System.out.println("\nLieferpreis ab Rabattbestellwert (Komma = ,): \n");
                        discountPrice = scanDou.nextDouble();
                        if (discountPrice >= price) {discountOrderValue = 0;}
                        if (discountPrice < 0) {discountPrice = 0;}
                    }
                    String sql = "Insert into delivery (post_code, town, minimum_order_value, price" +
                            (discountOrderValue > 0 ? ", discount_order_value, discount_price" : "") +
                            ", company_book_number_restaurant) values (" + postCode + ", '" + town + "', " +
                            minimumOrderValue + ", " + price + ", " + (discountOrderValue > 0 ? discountOrderValue +
                            ", " + discountPrice + ", '" : "'") + companyBookNumber + "');";

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
    }

    public void editingKindOfMenu() {
        selectKind();
        try {
            String sql = "Select * from kind_of_menu where id = " + idKinds[selectNumberKind];

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            String name = "";
            String description = "";
            boolean hasSameExtras = false;

            while (resultset.next()) {
                name = resultset.getString("name");
                description = resultset.getString("description");
                hasSameExtras = resultset.getBoolean("has_same_addable_ingredient");
            }
            statement.close();
            int selectNumber = -1;
            while (selectNumber != 0) {
                selectNumber = -1;
                while (selectNumber < 0 || selectNumber > 3) {
                    System.out.println("\n1. Name der Art von Gerichten:\n   " + name);
                    System.out.println("\n2. Beschreibung:\n   " + description);
                    System.out.println("\n3. Gemeinsame Extras für alle Speisen dieser Art:\n   " + (hasSameExtras ? "JA" : "NEIN"));
                    System.out.println("\nWelchen Punkt wollen sie verändern\n 0 ... zurück\n");
                    selectNumber = scanNum.nextInt();
                }
                if (selectNumber == 1 ) {
                    System.out.println("\nBitte den neuen Namen der Art des Menüs eingeben!\n");
                    name = scanText.nextLine();
                } else if (selectNumber == 2) {
                    System.out.println("Bitte die geänderte Beschreibung der Art des Menüs eingeben!\n");
                    description = scanText.nextLine();
                } else if (selectNumber == 3) {
                    if (hasSameExtras) {
                        System.out.println("Möchten sie wirklich von gemeinsamen Extras für alle Speisen dieser Art " +
                                name + " verzichten. Dadurch werden die für alle Speisen gemeinsam eventuell angelegten Zutaten" +
                                " gelöscht!");
                    } else {
                        System.out.println("Möchten sie wirklich auf gemeinsame Extras für alle Speisen dieser Art " +
                                name + " umstellen. Dadurch werden alle eventuell angelegten Zutaten für Speisen" +
                                " dieser Art gelöscht!");
                    }
                    System.out.println("1. ja\n0. nein");
                    int controlNumber = scanNum.nextInt();
                    if (controlNumber == 1 ) {
                        System.out.println("ändern");
                    }
                }
            }

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

    public void printKindOfMenu() {
        counterKind = 1;
        try {
            String sql = "Select * from kind_of_menu;";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                int id = resultset.getInt("id");
                String name = resultset.getString("name");
                String description = resultset.getString("description");
                boolean hasSameExtras = resultset.getBoolean("has_same_addable_ingredient");

                System.out.print(counterKind < 10 ? " " : "");
                System.out.print(counterKind + ". " + name.toUpperCase());
                System.out.println(hasSameExtras ? " (alle Gerichte haben die selben Extras)" : "");
                System.out.println(description.equalsIgnoreCase("") ? "" : "    " + description + "\n");
                idKinds[counterKind] = id;
                counterKind++;
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
    }

    public void printMenuOfKind() {
        counterMenu = 1;
        try {
            String sql = "Select * from menu where kind_of_menu_id = " + idKinds[selectNumberKind];

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                int id = resultset.getInt("id");
                String name = resultset.getString("name");
                String description = resultset.getString("description");
                double price = resultset.getDouble("price");

                System.out.print(counterMenu < 10 ? " " : "");
                System.out.println(counterMenu + ". " + name.toUpperCase() + "\t\t" + price);
                System.out.println(description.equalsIgnoreCase("") ? "" : "    " + description + "\n");
                idMenus[counterMenu] = id;
                counterMenu++;
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
    }

    public void selectKind() {
        selectNumberKind = -1;
        while (selectNumberKind < 0 || selectNumberKind >= counterKind) {
            printKindOfMenu();
            System.out.println("Welche der oben genannten Arten von Speisen wollen sie bearbeiten!\n 0. zurück\n");
            selectNumberKind = scanNum.nextInt();
        }
    }

    public void selectMenu() {
        selectNumberMenu = -1;
        while (selectNumberMenu < 0 || selectNumberMenu >= counterMenu) {
            printMenuOfKind();
            System.out.println("Welche der oben genannten Menüs (Speisen) wollen sie bearbeiten!\n 0. Abbruch\n");
            selectNumberMenu = scanNum.nextInt();
        }
    }

    public int checkSameIngredient(int checkNumber) {
        String sql = "Select name, has_same_addable_ingredient from kind_of_menu where id = " + idKinds[selectNumberKind];

        try {
            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            String name = "";
            boolean hasSameExtras = false;

            while (resultset.next()) {
                name = resultset.getString("name");
                hasSameExtras = resultset.getBoolean("has_same_addable_ingredient");
            }
            statement.close();

            if (hasSameExtras) {
                System.out.println(name + " --> hat für alle Speisen die selben Extras (Eingabe in Arten von Menüs (Speisen)");
                sql = "select is_addable from ingredient inner join menu on ingredient.menu_id = menu.id " +
                        "where menu.kind_of_menu_id = " + idKinds[selectNumberKind];
                statement = connection.createStatement();
                resultset = statement.executeQuery(sql);
                boolean hasBeenEntered = false;

                while (resultset.next()) {
                    hasBeenEntered = resultset.getBoolean("is_addable");
                }
                statement.close();
                if (hasBeenEntered) {
                    System.out.println("Diese Extras wurden bereits eingetragen!");
                    checkNumber = 4;
                }
            }
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
        return checkNumber;
    }
}
