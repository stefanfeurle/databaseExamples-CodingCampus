package com.tsf.view;

import com.tsf.database.models.DeliveryService;
import java.util.InputMismatchException;
import java.util.Scanner;

public class DeliveryServiceView {
    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);
    Scanner scanDou = new Scanner(System.in);
    private int counterTown = 0;

    public int setCounterOfInputTown() {
        int counter = -1;
        while (counter < 0) {
            try {
                System.out.println("Sie können hier ihre Lieferorte anlegen. Weiters bitten wir ihnen an einen " +
                        "Mindestbestellwert (Preisgrenze ab der \nsie liefern können) mit dem Lieferpreis einzutragen. " +
                        "Außerdem können sie einen Rabattbestellwert (Preisgrenze ab dem sie \ngünstiger liefern wollen) " +
                        "mit dem dazugehörigen Lieferpreis zu verwenden. D.h.z.Bsp. ab einer Bestellung von 10 Euro " +
                        "(Minimum) \nliefern sie für 5 Euro und ab 40 Euro (Rabatt) ist die Lieferung gratis. " +
                        "\n\nWICHTIG! Wenn sie den Minimumpreis oder Rabattpreis nicht verwenden wollen, geben sie " +
                        "einfach 0 ein!\n\nWieviele Lieferorte möchten sie hinterlegen!\n0 ...zurück");
                counter = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        if (counter > 50) {counter = 50;}
        return counter;
    }

    public String setTownOfInputTown() {
        System.out.println("\nBitte geben sie den Lieferort ein!\n");
        return scanText.nextLine();
    }

    public int setPostCodeOfInputTown() {
        int postCode = 0;
        while (postCode < 1) {
            try {
                System.out.println("\nPostleitzahl:\n");
                postCode = scanNum.nextInt();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanNum = new Scanner(System.in);
            }
        }
        return postCode;
    }

    public double setMinimumOrderValueOfInputTown(){
        double minimumOrderValue = -1;
        while (minimumOrderValue < 0) {
            try {
                System.out.println("\nMindestbestellwert (Komma = ,): \n");
                minimumOrderValue = scanDou.nextDouble();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanDou = new Scanner(System.in);
            }
        }
        return minimumOrderValue;
    }

    public double setPriceOfInputTown() {
        double price = -1;
        while (price < 0) {
            try {
                System.out.println("\nLieferpreis ab Mindestbestellwert (Komma = ,): \n");
                price = scanDou.nextDouble();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanDou = new Scanner(System.in);
            }
        }
        return price;
    }

    public double setDiscountOrderValueOfInputTown(){
        double discountOrderValue = -1;
        while (discountOrderValue < 0) {
            try {
                System.out.println("\nRabattbestellwertgrenze (Komma = ,): \n");
                discountOrderValue = scanDou.nextDouble();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanDou = new Scanner(System.in);
            }
        }
        return discountOrderValue;
    }

    public double setDiscountPriceOfInputTown() {
        double price = -1;
        while (price < 0) {
            try {
                System.out.println("\nLieferpreis ab Rabattbestellwert (Komma = ,): \n");
                price = scanDou.nextDouble();
            } catch (InputMismatchException ignored) {
                System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
                scanDou = new Scanner(System.in);
            }
        }
        return price;
    }

    public void setCounterTown(int counterTown) {
        this.counterTown = counterTown;
    }

    public int outputTown(DeliveryService deliveryService) {
        counterTown++;
        if (counterTown == 1) {
            System.out.println("\n\tORTE und PREISE für den LIEFERSERVICE\n");
        }
        System.out.print(counterTown < 10 ? "\n " : "\n");
        System.out.println(counterTown + ". " + deliveryService.getTown().toUpperCase() + " (" +
                deliveryService.getPostcode() + ")\n    Ab dem Mindestbestellwert von " +
                String.format("%.2f", deliveryService.getMinimumOrderValue()) + " Euro kostet die Lieferung " +
                String.format("%.2f", deliveryService.getPrice()) + " Euro.");
        System.out.print(deliveryService.getDiscountOrderValue() == 0 ? "" : "    " + "Ab dem Rabattbestellwert  von " +
                String.format("%.2f", deliveryService.getDiscountOrderValue()) + " Euro kostet die Lieferung " +
                String.format("%.2f", deliveryService.getDiscountPrice()) + " Euro.\n");
        return counterTown;
    }

    public int getSelectionTown(String output) {
        int selectionNumber = -1;
        while (selectionNumber < 0 || selectionNumber > counterTown) {
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

    public int selectData(DeliveryService selectedTown) {
        int selectionNumber = -1;
        while (selectionNumber < 0 || selectionNumber > 6) {
            System.out.println("1. Postleitzahl:                       " + selectedTown.getPostcode());
            System.out.println("2. Lieferort:                          " + selectedTown.getTown());
            System.out.println("3. Mindestbestellwertgrenze:           " + String.format("%.2f", selectedTown.getMinimumOrderValue()));
            System.out.println("4. Preis ab Mindestbestellwertgrenze:  " + String.format("%.2f", selectedTown.getPrice()));
            System.out.println("5. Rabattbestellwertgrenze:            " + String.format("%.2f", selectedTown.getDiscountOrderValue()));
            System.out.println("6. Preis ab Rabattbestellwertgrenze:   " + String.format("%.2f", selectedTown.getDiscountPrice()));
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
