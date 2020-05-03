package com.tsf.view;

import com.tsf.database.models.KindOfMenu;
import com.tsf.database.models.Menu;
import java.util.InputMismatchException;
import java.util.Scanner;

public class MenuView {
    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);
    Scanner scanDou = new Scanner(System.in);
    private int counterMenu = 0;

    public int setCounterOfInputMenu(KindOfMenu kindOfMenu) {
        int counter = -1;
        while (counter < 0) {
            try {
                System.out.println("\nWieviele Menüs dieser Art (" + kindOfMenu.getName().toUpperCase() +
                        ") möchten sie eingeben! (ca.)\n");
                counter = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        if (counter > 20) {counter = 20;}
        return counter;
    }

    public String setNameOfInputMenu() {
        System.out.println("\nBitte den Namen der Speise oder des Getränkes eingeben!\n");
        return scanText.nextLine();
    }

    public String setDescriptionOfInputMenu() {
        System.out.println("\nWenn sie möchten können sie hier eine kurze Beschreibung hinterlegen!" +
                "\n(z.B. mit Putenfleisch!)\n");
        return scanText.nextLine();
    }

    public double setPriceOfInputMenu(String name) {
        double price = -1;
        while (price < 0) {
            try {
                System.out.println("Geben sie den Preis für dieses Menü (" + name + ") ein! (Komma = ,)\n");
                price = scanDou.nextDouble();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanDou = new Scanner(System.in);
            }
        }
        return price;
    }

    public void setCounterMenu(int counterMenu) {
        this.counterMenu = counterMenu;
    }

    public int outputMenu(Menu menu) {
        counterMenu++;
        int menuNameLength = 64;
        if (counterMenu <10) {menuNameLength = 65;}
        if (menu.getPrice() < 10) {
            menuNameLength++;
        }
        String name = menu.getName();
        while (name.length() < menuNameLength) {
            name += " ";
        }
        System.out.print(counterMenu < 10 ? "\n\t " : "\n\t");
        System.out.println(counterMenu + ". " + name.toUpperCase() + "\t\t" + String.format("%.2f", menu.getPrice()));
        System.out.print(menu.getDescription().equalsIgnoreCase("") ? "" : "\t    " + menu.getDescription() + "\n");
        return counterMenu;
    }

    public int getSelectionMenu(String output) {
        int selectionNumber = -1;
        while (selectionNumber < 0 || selectionNumber > counterMenu) {
            try {
                System.out.println(output);
                selectionNumber = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        return selectionNumber;
    }

    public int selectData(Menu selectedMenu) {
        int selectionNumber = -1;
        while (selectionNumber < 0 || selectionNumber > 3) {
            System.out.println("\n1. Name der Speise oder des Getränkes:\n   " + selectedMenu.getName());
            System.out.println("2. Beschreibung:\n   " + selectedMenu.getDescription());
            System.out.println("3. Preis der Speise oder des Getränkes:\n   " +
                    String.format("%.2f", selectedMenu.getPrice()) + " Euro");
            System.out.println("\nWelchen Punkt wollen sie verändern\n 0 ... zurück\n");
            try {
                selectionNumber = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        return selectionNumber;
    }

    public void printOutput(String s) {
        System.out.println(s);
    }

    public boolean askFurtherAction(String output) {
        boolean makeFurtherChange = false;
        String selectLetter = "";
        while (!selectLetter.equalsIgnoreCase("n") && !selectLetter.equalsIgnoreCase("j")) {
            System.out.println(output);
            selectLetter = scanText.nextLine();
        }
        if (selectLetter.equalsIgnoreCase("j")) {
            makeFurtherChange = true;
        }
        return makeFurtherChange;
    }
}
