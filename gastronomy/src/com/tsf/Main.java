package com.tsf;

import com.tsf.controller.RestaurantController;
import com.tsf.database.models.Restaurant;
import com.tsf.database.repositories.RestaurantRepository;
import com.tsf.view.RestaurantView;

public class Main {

    public static void main(String[] args) {

        RestaurantView restaurantView = new RestaurantView();
        RestaurantRepository restaurantRepository = new RestaurantRepository();
        RestaurantController restaurantController = new RestaurantController(restaurantView,restaurantRepository);

        restaurantController.startGastro();
        /*DbConnector conn = new DbConnector();
        ResultSet set = conn.getResultSet("select * from menu");
        ArrayList<Menu> menus = new ArrayList<>();
        while (true){
            try {
                if (!set.next()) break;
                Menu menu = new Menu(set.getInt("id"), set.getString("name"), 7.0);
                menus.add(menu);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

        Menu menu = new Menu(0, "Pizza a la Stefan", 12.0);
        String insertString = menu.getInsert();
        conn.insert(insertString);

        Menu menu = new Menu(0, "Pizza a la Stefan", 12.0);
        Ingredient ing = new Ingredient();


        ArrayList<Repository> list = new ArrayList<>();
        list.add(menu);
        list.add(ing);

        for (Repository statement: list) {
            statement.getInsert();
            /*
            conn.insertData(statement.getInsert())
             */
        /*}

        Gastro gastro = new Gastro();
        KindOfMenuManager kindManager = new KindOfMenuManager();
        while (gastro.state == 0) {
            Scanner scanText = new Scanner(System.in);
            Scanner scanNum = new Scanner(System.in);
            System.out.println("\nGASTRO\n\nVorarlbergs Gastronomieprogramm\nDamit sind sie sicher auf der Überholspur!" +
                    "\nL ... Login\nA ... Account erstellen!\nE ... Programm beenden\n");
            String controlLetter = scanText.nextLine();

            if (controlLetter.equalsIgnoreCase("A")) {
                inputAccount(scanText, scanNum, gastro);
            } else if (controlLetter.equalsIgnoreCase("L")) {
                inputLogin(scanText, gastro);
            } else if (controlLetter.equalsIgnoreCase("E")) {
                gastro.state = 2;
            }

            while (gastro.state == 1) {
                printSelectionMenu();
                int controlNumber = scanText.nextInt();

                if (controlNumber == 0) {
                    gastro.state = 0;
                    gastro.companyBookNumber = "";
                    gastro.nameRestaurant = "";
                } else if (controlNumber == 1) {
                    kindManager.inputKindOfMenu();
                } else if (controlNumber == 2) {
                    gastro.inputMenu();
                } else if (controlNumber == 3) {
                    gastro.inputIngredient();
                } else if (controlNumber == 4) {
                    gastro.inputDeliveryTowns ();
                } else if (controlNumber == 5) {
                    gastro.editingKindOfMenu();
                }
            }
        }
    }

    public static void printSelectionMenu() {
        System.out.println("\nGASTRO\n\nVorarlbergs Gastronomieprogramm\n(Beim ersten Einstieg bitten wir sie bei" +
                " 1. zu starten!)\n\n1. Eingabe von Arten der Menüs (Speise)\n   (quasi wie in ihrer Speisekarte z.b Vorspeise," +
                " Hauptspeise, Pizza, Getränke ...)\n2. Eingabe von Menüs (Speisen)\n3. Eingabe von Zutaten\n   (z.B " +
                "Zutaten welche entfernt werden könnten oder kostenpflichtige Extras)\n4. Eingabe von Lieferorten und " +
                "deren Konditionen\n\n5. Bearbeiten vorhandener Arten von Menüs\n6. Bearbeiten vorhandener Menüs\n7. " +
                "Bearbeiten von Lieferorten und deren Konditionen\n8. Bearbeiten ihrer Daten\n\n9. Ausgabe diverser Art " +
                "(Speisekarte oder Lieferorte)\n0. Beenden ihrer Sitzung\n");
    }

    public static void inputLogin(Scanner scanText, Gastro gastro) {
        System.out.println("\nUsername:\n");
        String userName = scanText.nextLine();
        System.out.println("Passwort:\n");
        String password = scanText.nextLine();

        gastro.loginUser(userName, password);
    }

    public static void inputAccount(Scanner scanText, Scanner scanNum, Gastro gastro) {
        System.out.println("\nHerzlich Willkommen!\nWir freuen uns über das Interesse ihres Unternehmens an " +
                "unserem Programm!\nBis zum Zugang sind nur noch ein paar kleine Schritte notwendig!\nBitte " +
                "geben sie ihre Firmenbuchnummer ein!\n");
        String companyBookNumber = scanText.nextLine();
        System.out.println("Für ihre zukünftigen Logins brauchen sie ein Passwort!\n");
        String password = scanText.nextLine();
        System.out.println("Art des Lokales (z.B. Gasthaus, Pizzeria, Restaurant ...\n");
        String kindOfRestaurant = scanText.nextLine();
        System.out.println("Name des " +kindOfRestaurant + "\n");
        String name = scanText.nextLine();
        System.out.println("E-Mail:\n");
        String email = scanText.nextLine();
        System.out.println("Link der Homepage\n");
        String homepage = scanText.nextLine();
        System.out.println("Telefonnummer:\n");
        String phoneNumber = scanText.nextLine();
        System.out.println("Nur noch die Anschrift ihres Unternehmens!\nPostleizahl\n");
        int postCode = scanNum.nextInt();
        System.out.println("Ortschaft/Stadt\n");
        String town = scanText.nextLine();
        System.out.println("Straße\n");
        String street = scanText.nextLine();
        System.out.println("Hausnummer\n");
        int houseNumber = scanNum.nextInt();
        //Account account = new Account(companyBookNumber);
        //account.saveAccount();

        gastro.createAccount(companyBookNumber, kindOfRestaurant, name, email, homepage,  phoneNumber, postCode,
                town, street, houseNumber, password);*/
    }
}

