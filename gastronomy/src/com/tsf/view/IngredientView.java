package com.tsf.view;

import com.tsf.database.models.Ingredient;
import com.tsf.database.models.Menu;
import java.util.InputMismatchException;
import java.util.Scanner;

public class IngredientView {
    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);
    Scanner scanDou = new Scanner(System.in);
    private int counterIngredient = 0;

    public int selectInputIngredient(Menu selectedMenu) {
        int selectionNumber = -1;
        while (selectionNumber < 0 || selectionNumber > 3) {
            System.out.println("Sie können (müssen aber nicht) jetzt auf drei verschiedene Arten Zutaten hinterlegen!" +
                    "\n1. Zutaten des Menüs " + selectedMenu.getName() + " (reine Information)" +
                    "\n2. Zutaten, die von der Speise entfernt werden könnten" +
                    "\n3. Zutaten, die als Extras(mit oder ohne Preis) hinzugefügt werden könnten" +
                    "\n   (wie sie schon gesehen haben, können diese auch über eine ganze Art von Speisen angeboten werden," +
                    "\n   aber dafür müssen sie unter Art von Speisen dies bejaht haben oder noch machen)\n0. Abbruch\n");
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


    public int setCounterOfInputIngredient() {
        int counter = -1;
        while (counter < 0) {
            try {
                System.out.println("\nWieviele Zutaten möchten sie hinterlegen!\n");
                counter = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        if (counter > 20) {counter = 20;}
        return counter;
    }

    public String setNameOfInputIngredient(int selectionNumber) {
        System.out.print("\nGeben sie eine Zutat ein! ");
        if (selectionNumber == 1) {
            System.out.println("(reine Information! (kurzer Text möglich))\n");
        } else if (selectionNumber == 2) {
            System.out.println("(entfernbare Zutat!)\n");
        } else {
            System.out.println("(hinzufügbare Zutat)\n");
        }

        return scanText.nextLine();
    }

    public double setPriceOfInputIngredient() {
        double price = -1;
        while (price < 0) {
            try {
                System.out.println("Wenn sie möchten können sie dieser Zutat einen Preis geben!\n(kein Preis = 0 / Komma = ,)\n");
                price = scanDou.nextDouble();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanDou = new Scanner(System.in);
            }
        }
        return price;
    }

    public boolean askFurtherAction(String output1) {
        boolean makeFurtherChange = false;
        String selectLetter = "";
        while (!selectLetter.equalsIgnoreCase("n") && !selectLetter.equalsIgnoreCase("j")) {
            System.out.println("\n" + output1 + "\nJ ... ja\nN ... nein\n");
            selectLetter = scanText.nextLine();
        }
        if (selectLetter.equalsIgnoreCase("j")) {
            makeFurtherChange = true;
        }
        return makeFurtherChange;
    }

    public int outputIngredients(Ingredient ingredient) {
        counterIngredient++;
        System.out.print(counterIngredient < 10 ? "\t " : "\t");
        System.out.print(counterIngredient + ". " + ingredient.getName() + " (");
        System.out.print(ingredient.getPrice() > 0 ? String.format("%.2f", ingredient.getPrice()) + " €/" : "");
        if (!ingredient.isRemovable() && !ingredient.isAddable()) {
            System.out.println("Zutat zur reinen Info)");
        } else if (ingredient.isRemovable() && !ingredient.isAddable()) {
            System.out.println("Entfernbare Zutat)");
        } else {
            System.out.println("Hinzufügbare Zutat)");
        }
        return counterIngredient;
    }

    public int getSelectionIngredient(String output) {
        int selectionNumber = -1;
        while (selectionNumber < 0 || selectionNumber > counterIngredient) {
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

    public String selectData(Ingredient selectedIngredient) {
        String selectionLetter = "";
        while (!selectionLetter.equalsIgnoreCase("N") && !selectionLetter.equalsIgnoreCase("P")
                && !selectionLetter.equalsIgnoreCase("Z")) {
            System.out.println("\nN ... Name der Zutat:\n   " + selectedIngredient.getName());
            System.out.println("P ... Preis der Zutat:\n   " +
                    String.format("%.2f", selectedIngredient.getPrice()) + " Euro");
            System.out.println("\nWelchen Punkt wollen sie verändern\n Z ... zurück\n");
            selectionLetter = scanText.nextLine();
        }
        return selectionLetter;
    }

    public String setNewNameIngredient() {
        System.out.println("\nBitte den neuen Namen der Zutat eingeben!\n");
        return scanText.nextLine();
    }

    public void setCounterIngredient(int counterIngredient) {
        this.counterIngredient = counterIngredient;
    }

    public int getCounterIngredient() {
        return counterIngredient;
    }
}
