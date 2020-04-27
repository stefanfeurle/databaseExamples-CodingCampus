package com.tsf.view;

import com.tsf.controller.RestaurantController;

import java.util.InputMismatchException;
import java.util.Scanner;

public class RestaurantView {
    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);

    public String printStart() {
        System.out.println("\nGASTRO\n\nVorarlbergs Gastronomieprogramm\nDamit sind sie sicher auf der Überholspur!" +
                "\nL ... Login\nA ... Account erstellen!\nE ... Programm beenden\n");
        return scanText.nextLine();
    }

    public String printSelectionProcess() {
        System.out.println("\nGASTRO\n\nVorarlbergs Gastronomieprogramm\n(Beim ersten Einstieg bitten wir sie bei" +
                " der Eingabe von neuen Daten zu starten!)\n\nN ... Eingabe von neuen Daten\nV ... Bearbeiten von vorhandenen Daten\n" +
                "A ... Ausgabe von Daten\n\nE ... Beenden ihrer Sitzung\n");
        return scanText.nextLine();
    }

    public String printSelectionProcessInput() {
        System.out.println("\nA ... Neue Arten von Menüs (Speisen und Getränke) erstellen\n      (quasi wie in ihrer " +
                "Speisekarte z.b Vorspeise, Hauptspeise, Pizza, Getränke ...)\nM ... Neue Menüs (Speisen) erstellen\n" +
                "I ... Eingabe von neuen Zutaten\n      (z.B Zutaten welche bei einer Bestellung entfernt werden " +
                "könnten oder kostenpflichtige Extras)\nL ... Eingabe von neuen Lieferorten und " +
                "deren Konditionen\n\nZ ... zurück\n");
        return scanText.nextLine();
    }

    public String printSelectionProcessEditing() {
        System.out.println("\nA ... Bearbeiten vorhandener Arten von Menüs\nM ... Bearbeiten vorhandener Menüs\nI ... " +
                "Bearbeiten von Zutaten\nL ... Bearbeiten von Lieferorten und deren Konditionen\n" +
                "D ... Bearbeiten ihrer Daten\n\nZ ... zurück\n");
        return scanText.nextLine();
    }

    public String printSelectionProcessOutput() {
        System.out.println("\nA ... Ausgabe der Arten von Menüs\nM ... Ausgabe von Menüs bestimmter Arten\nI ... " +
                "Ausgabe von Zutaten bestimmter Menüs\nG ... Ausgabe ihrer gesamten Speisekarte\nL ... Ausgabe der Lieferorte und deren Konditionen\n" +
                "D ... Ausgabe ihrer Daten\n\nZ ... zurück\n");
        return scanText.nextLine();
    }

    public String getUserName() {
        System.out.println("\nUsername:\n");
        return scanText.nextLine();
    }

    public String getPassword() {
        System.out.println("Passwort:\n");
        return scanText.nextLine();
    }

    public String getCompanyBookNumber() {
        System.out.println("\nHerzlich Willkommen!\nWir freuen uns über das Interesse ihres Unternehmens an " +
                "unserem Programm!\nBis zum Zugang sind nur noch ein paar kleine Schritte notwendig!\nBitte " +
                "geben sie ihre Firmenbuchnummer ein!\n");
        return scanText.nextLine();

    }public String createPassword() {
        System.out.println("Für ihre zukünftigen Logins brauchen sie ein Passwort!\n");
        return scanText.nextLine();
    }

    public String getKindOfRestaurant() {
        System.out.println("Art des Lokales (z.B. Gasthaus, Pizzeria, Restaurant ...\n");
        return scanText.nextLine();
    }

    public String getName(String kindOfRestaurant) {
        System.out.println("Name des " + kindOfRestaurant + "\n");
        return scanText.nextLine();
    }

    public String getEmail() {
        System.out.println("E-Mail:\n");
        return scanText.nextLine();
    }
    public String getHomepage() {
        System.out.println("Link der Homepage\n");
        return scanText.nextLine();
    }

    public String getPhoneNumber() {
        System.out.println("Telefonnummer:\n");
        return scanText.nextLine();
    }

    public int getPostCode() {
        int postCode = 0;
        try {
        System.out.println("Nur noch die Anschrift ihres Unternehmens!\nPostleizahl\n");
        postCode = scanNum.nextInt();
        } catch (InputMismatchException ignored) {
            System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
            scanNum = new Scanner(System.in);
            getPostCode();
        }
        if (postCode < 1) {getPostCode();}
        return postCode;
    }

    public String getTown() {
        System.out.println("Ortschaft/Stadt\n");
        return scanText.nextLine();
    }

    public String getStreet() {
        System.out.println("Straße\n");
        return scanText.nextLine();
    }

    public int getHouseNumber() {
        int houseNumber = 0;
        try {
        System.out.println("Hausnummer\n");
        houseNumber = scanNum.nextInt();
        } catch (InputMismatchException ignored) {
            System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
            scanNum = new Scanner(System.in);
            getHouseNumber();
        }
        if (houseNumber < 1) {getPostCode();}
        return houseNumber;
    }
}
