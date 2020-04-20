package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Gastro gastro = new Gastro();
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
                    gastro.name = "";
                } else if (controlNumber == 1) {
                    gastro.inputKindOfMenu();
                } else if (controlNumber == 2) {
                    gastro.inputMenu();
                }
            }
        }
    }

    public static void printSelectionMenu() {
        System.out.println("\nGASTRO\n\nVorarlbergs Gastronomieprogramm\n(Beim ersten Einstieg bitten wir sie bei" +
                " 1. zu starten!)\n\n1. Eingabe von Arten der Menüs (Speise)\n   (quasi wie in ihrer Speisekarte z.b Vorspeise," +
                " Hauptspeise, Pizza, Getränke ...)\n2. Eingabe von Menüs (Speisen)\n   (ev. inkl. Zutaten, Zutaten welche entfernt werden" +
                " könnten oder kostenpflichtige Extras)\n3. Eingabe von Lieferorten und deren Konditionen\n\n" +
                "4. Bearbeiten vorhandener Arten von Menüs\n5. Bearbeiten vorhandener Menüs\n6. Bearbeiten von " +
                "Lieferorten und deren Konditionen\n7. Bearbeiten ihrer Daten\n\n8. Ausgabe ihrer Menüs (Speisekarte)" +
                "\n9. Ausgabe ihrer Lieferorte\n0. Beenden ihrer Sitzung\n");
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

        gastro.createAccount(companyBookNumber, kindOfRestaurant, name, email, homepage,  phoneNumber, postCode,
                town, street, houseNumber, password);
    }
}

