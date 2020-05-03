package com.tsf.view;

import com.tsf.database.models.KindOfMenu;
import com.tsf.database.models.Restaurant;
import java.util.InputMismatchException;
import java.util.Scanner;

public class RestaurantView {
    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);

    public String printStart() {
        System.out.println("\nGASTRO\n\nVorarlbergs Gastronomieprogramm\nDamit sind sie sicher auf der Überholspur!" +
                "\nL ... Login\nA ... Account erstellen\nE ... Programm beenden\n");
        return scanText.nextLine();
    }

    public String printSelectionProcess() {
        System.out.println("\nGASTRO\n\nVorarlbergs Gastronomieprogramm\n(Beim ersten Einstieg bitten wir sie bei" +
                " der Eingabe von neuen Daten zu starten!)\n\nN ... Eingabe von neuen Daten\nV ... Bearbeiten von vorhandenen Daten\n" +
                "A ... Ausgabe von Daten\nL ... Löschen von Daten\n\nE ... Beenden ihrer Sitzung\n");
        return scanText.nextLine();
    }

    public String printSelectionProcessInput() {
        System.out.println("\nNEUE DATEN EINGEBEN\n\nA ... Neue Arten von Menüs (Speisen und Getränke) erstellen " +
                "(START bei Ersteinstieg)\n      (quasi wie in ihrer " +
                "Speisekarte z.b Vorspeise, Hauptspeise, Pizza, Getränke ...)\nM ... Neue Menüs (Speisen) erstellen\n" +
                "I ... Eingabe von neuen Zutaten\n      (z.B Zutaten welche bei einer Bestellung entfernt werden " +
                "könnten oder kostenpflichtige Extras)\nL ... Eingabe von neuen Lieferorten und " +
                "deren Konditionen\n\nZ ... zurück\n");
        return scanText.nextLine();
    }

    public String printSelectionProcessEditing() {
        System.out.println("\nBEARBEITUNG VON DATEN\n\nA ... Bearbeiten vorhandener Arten von Menüs\nM ... " +
                "Bearbeiten vorhandener Menüs\nI ... Bearbeiten von Zutaten\nL ... Bearbeiten von Lieferorten und " +
                "deren Konditionen\nD ... Bearbeiten ihrer Daten\n\nZ ... zurück\n");
        return scanText.nextLine();
    }

    public String printSelectionProcessOutput() {
        System.out.println("\nAUSGABE VON DATEN\n\nA ... Ausgabe der Arten von Menüs\nM ... Ausgabe von Menüs " +
                "bestimmter Arten\nI ... Ausgabe von Zutaten bestimmter Menüs\nG ... Ausgabe ihrer gesamten " +
                "Speisekarte\nL ... Ausgabe der Lieferorte und deren Konditionen\nD ... Ausgabe ihrer Daten" +
                "\n\nZ ... zurück\n");
        return scanText.nextLine();
    }

    public String printSelectionProcessDelete() {
        System.out.println("\nLÖSCHEN VON DATEN\n\nA ... Löschen von Arten von Menüs\nM ... Löschen von Menüs \nI ... " +
                "Löschen von Zutaten\nL ... Löschen von Lieferorten und deren Konditionen\n\nZ ... zurück\n");
        return scanText.nextLine();
    }

    public void outputDataRestaurant(Restaurant restaurant) {
        System.out.println("\n\t\t" + restaurant.getName().toUpperCase() + "\n");
        System.out.println(" 1. Firmenbuchnummer:                  " + restaurant.getCompanyBookNumber());
        System.out.println(" 2. Art von Restaurant:                " + restaurant.getKindOfRestaurant());
        System.out.println(" 3. Name:                              " + restaurant.getName());
        System.out.println(" 4. E-Mail:                            " + restaurant.getEmail());
        System.out.println(" 5. Homepage:                          " + restaurant.getHomepage());
        System.out.println(" 6. Telefonnummer:                     " + restaurant.getPhoneNumber());
        System.out.println(" 7. Postleitzahl:                      " + restaurant.getPostCode());
        System.out.println(" 8. Stadt/Ort:                         " + restaurant.getTown());
        System.out.println(" 9. Straße:                            " + restaurant.getStreet());
        System.out.println("10. Hausnummer:                        " + restaurant.getHouseNumber());
        System.out.println("11. Passwort:                          ********");
        System.out.println("12. Datum der Erstellung des Accounts: " + restaurant.getCreationDate() + "\n");
    }

    public String setUserName() {
        System.out.println("\nUsername:\n");
        return scanText.nextLine();
    }

    public String setPassword() {
        System.out.println("Passwort:\n");
        return scanText.nextLine();
    }

    public String setCompanyBookNumber() {
        System.out.println("\nHerzlich Willkommen!\nWir freuen uns über das Interesse ihres Unternehmens an " +
                "unserem Programm!\nBis zum Zugang sind nur noch ein paar kleine Schritte notwendig!\nBitte " +
                "geben sie ihre Firmenbuchnummer ein!\n");
        return scanText.nextLine();

    }public String createPassword() {
        System.out.println("Für ihre zukünftigen Logins brauchen sie ein Passwort!\n");
        return scanText.nextLine();
    }

    public String setKindOfRestaurant() {
        System.out.println("Art des Lokales (z.B. Gasthaus, Pizzeria, Restaurant ...\n");
        return scanText.nextLine();
    }

    public String setName(String kindOfRestaurant) {
        System.out.println("Name des " + kindOfRestaurant + "\n");
        return scanText.nextLine();
    }

    public String setEmail() {
        System.out.println("E-Mail:\n");
        return scanText.nextLine();
    }
    public String setHomepage() {
        System.out.println("Link der Homepage\n");
        return scanText.nextLine();
    }

    public String setPhoneNumber() {
        System.out.println("Telefonnummer:\n");
        return scanText.nextLine();
    }

    public int setPostCode() {
        int postCode = 0;
        while (postCode < 1) {
            try {
                System.out.println("Postleizahl\n");
                postCode = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        return postCode;
    }

    public String setTown() {
        System.out.println("Ortschaft/Stadt\n");
        return scanText.nextLine();
    }

    public String setStreet() {
        System.out.println("Straße\n");
        return scanText.nextLine();
    }

    public int setHouseNumber() {
        int houseNumber = 0;
        while (houseNumber < 1) {
            try {
                System.out.println("Hausnummer\n");
                houseNumber = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        return houseNumber;
    }

    public int selectData() {
        int selectionNumber = -1;
        while (selectionNumber < 0 || selectionNumber > 12) {
            System.out.println("\nWelchen Punkt wollen sie verändern\n 0 ... keine\n");
            try {
                selectionNumber = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        return selectionNumber;
    }

    public void printOutput(String output) {
        System.out.println(output);
    }

    public boolean askFurtherChange() {
        boolean madeFurtherChange = false;
        System.out.println("\nWollen sie weitere Datenfelder bearbeiten!\nJ ... ja\nN ... nein\n");
        String selectLetter = scanText.nextLine();
        if (selectLetter.equalsIgnoreCase("j")) {
            madeFurtherChange = true;
        } else if (!selectLetter.equalsIgnoreCase("n") && !selectLetter.equalsIgnoreCase("j")) {
            askFurtherChange();
        }
        return madeFurtherChange;
    }

    public void outputKindForMenuOfRestaurant(KindOfMenu kind) {
        System.out.println("\n" + kind.getName().toUpperCase());
        System.out.print(kind.getDescription().trim().equalsIgnoreCase("") ? "" : "(" +
                kind.getDescription() + ")\n");
    }
}
