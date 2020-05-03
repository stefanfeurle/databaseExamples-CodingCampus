package com.tsf.view;

import com.tsf.database.models.KindOfMenu;
import java.util.InputMismatchException;
import java.util.Scanner;

public class KindOfMenuView {
    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);
    private int counterKind = 0;

    public int setCounterOfInputKind() {
        int counter = -1;
        while (counter < 0) {
            try {
                System.out.println("\nWieviele Arten von Menüs möchten sie eingeben! (ca.)\n");
                counter = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        if (counter > 20) {counter = 20;}
        return counter;
    }

    public String setNameOfInputKind() {
        System.out.println("\nBitte den Namen der Art des Menüs eingeben!\n");
        return scanText.nextLine();
    }

    public String setDescriptionOfInputKind() {
        System.out.println("Wenn sie möchten können sie hier eine kurze Beschreibung hinterlegen!\n" +
                "(z.B. Alle Pizzas (26 cm) werden mit Tomatensauce und Mozzarella gemacht!)");
        return scanText.nextLine();
    }

    public boolean setSameExtrasOfInputKind(String name) {
        boolean hasSameExtras = false;
        System.out.println("Möchten Sie jedem Menü (jeder Speise) dieser Art " + name + " die selben Extras (Zutaten) " +
                "anbieten!\n(Später können sie auch jedem Menü (jeder Speise) seperat die Extras (Zutaten) zuweisen!)" +
                "\nJ ... ja\nN ... nein\n");
        String selectLetter = scanText.nextLine();
        if (selectLetter.equalsIgnoreCase("j")) {
            hasSameExtras = true;
        } else if (!selectLetter.equalsIgnoreCase("n") && !selectLetter.equalsIgnoreCase("j")) {
           setSameExtrasOfInputKind(name);
        }
        return hasSameExtras;
    }

    public void setCounterKind(int counterKind) {
        this.counterKind = counterKind;
    }

    public int getSelectionKind(String output) {
        int selectionNumber = -1;
        while(selectionNumber < 0 || selectionNumber > counterKind ) {
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

    public int outputKind(KindOfMenu kind){
        counterKind++;
        System.out.print(counterKind < 10 ? "\n " : "\n");
        System.out.print(counterKind + ". " + kind.getName().toUpperCase());
        System.out.println(kind.getHasSameExtras() ? " (alle Gerichte haben die selben Extras)" : "");
        System.out.print(kind.getDescription().trim().equalsIgnoreCase("") ? "" : "    " +
                kind.getDescription() + "\n");
        return counterKind;
    }

    public int selectData(KindOfMenu selectedKind) {
        int selectionNumber = -1;
        while(selectionNumber < 0 || selectionNumber > counterKind ) {
            System.out.println("\n1. Name der Art von Gerichten:\n   " + selectedKind.getName());
            System.out.println("2. Beschreibung:\n   " + selectedKind.getDescription());
            System.out.println("3. Gemeinsame Extras für alle Speisen dieser Art:\n   " +
                    (selectedKind.getHasSameExtras() ? "JA" : "NEIN"));
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

    public void printOutput(String output) {
        System.out.println(output);
    }

    public boolean askFurtherChange(String output) {
        boolean madeFurtherChange = false;
        String selectLetter = "";
        while ((!selectLetter.equalsIgnoreCase("n") && !selectLetter.equalsIgnoreCase("j"))) {
            System.out.println(output);
            selectLetter = scanText.nextLine();
            if (selectLetter.equalsIgnoreCase("j")) {
                madeFurtherChange = true;
            }
        }
        return madeFurtherChange;
    }
}
