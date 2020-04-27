package com.tsf.view;

import java.util.InputMismatchException;
import java.util.Scanner;

public class KindOfMenuView {
    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);

    public int getCounterOfInputKind() {
        int counter = 0;
        try {
        System.out.println("\nWieviele Arten von Menüs möchten sie eingeben! (ca.)\n");
        counter = scanNum.nextInt();
        } catch (InputMismatchException ignored) {
            System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
            scanNum = new Scanner(System.in);
            getCounterOfInputKind();
        }
        if (counter < 0) {counter = 0;}
        if (counter > 50) {counter = 50;}
        return counter;
    }

    public String getNameOfInputKind() {
        System.out.println("\nBitte den Namen der Art des Menüs eingeben!\n");
        return scanText.nextLine();
    }

    public String getDescriptionOfInputKind() {
        System.out.println("Wenn sie möchten können sie hier eine kurze Beschreibung hinterlegen!\n" +
                "(z.B. Alle Pizzas (26 cm) werden mit Tomatensauce und Mozzarella gemacht!)");
        return scanText.nextLine();
    }

    public boolean getSameExtrasOfInputKind(String name) {
        boolean sameExtras = false;
        System.out.println("Möchten Sie jedem Menü (jeder Speise) dieser Art " + name + " die selben Extras (Zutaten) " +
                "anbieten!\n(Später können sie auch jedem Menü (jeder Speise seperat die Extras (Zutaten) zuweisen!)" +
                "\nJ ... 1. ja\nN ... 0. nein");
        String selectLetter = scanText.nextLine();
        if (selectLetter.equalsIgnoreCase("j")) {
            sameExtras = true;
        } else if (!selectLetter.equalsIgnoreCase("n") && !selectLetter.equalsIgnoreCase("j")) {
           getSameExtrasOfInputKind(name);
        }
        return sameExtras;
    }

}
