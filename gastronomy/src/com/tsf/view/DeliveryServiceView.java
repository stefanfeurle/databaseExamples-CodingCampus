package com.tsf.view;

import java.util.InputMismatchException;
import java.util.Scanner;

public class DeliveryServiceView {
    Scanner scanText = new Scanner(System.in);
    Scanner scanNum = new Scanner(System.in);
    Scanner scanDou = new Scanner(System.in);

    public int getCounterOfInputTown() {
        int counter = 0;
        try {
            System.out.println("Sie können hier ihre Lieferorte anlegen. Weiters bitten wir ihnen an einen Mindestbestellwert " +
                    "(Preisgrenze ab der \nsie liefern können) mit dem Lieferpreis einzutragen. Außerdem können sie einen " +
                    "Rabattbestellwert (Preisgrenze ab dem sie \ngünstiger liefern wollen) mit dem dazugehörigen Lieferpreis " +
                    "zu verwenden. D.h.z.Bsp. ab einer Bestellung von 10 Euro (Minimum) \nliefern sie für 5 Euro und ab 40 " +
                    "Euro (Rabatt) ist die Lieferung gratis. \n\nWICHTIG! Wenn sie den Minimumpreis oder Rabattpreis nicht " +
                    "verwenden wollen, geben sie einfach 0 ein!\n\nWieviele Lieferorte möchten sie hinterlegen!\n0 ...zurück");
            counter = scanNum.nextInt();
        } catch (InputMismatchException ignored) {
            System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
            scanNum = new Scanner(System.in);
            getCounterOfInputTown();
        }
        if (counter < 0) {counter = 0;}
        if (counter > 50) {counter = 50;}
        return counter;
    }

    public String getTownOfInputTown() {
        System.out.println("\nBitte geben sie einen Lieferort ein!\n");
        return scanText.nextLine();
    }

    public int getPostCodeOfInputTown() {
        int postCode = 0;
        try {
            System.out.println("\nPostleitzahl:\n");
            postCode = scanNum.nextInt();
        } catch (InputMismatchException ignored) {
            System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
            scanNum = new Scanner(System.in);
            getPostCodeOfInputTown();
        }
        if (postCode < 1) {getPostCodeOfInputTown();}
        return postCode;
    }

    public double getMinimumOrderValueOfInputTown(){
        double minimumOrderValue = 0;
        try {
            System.out.println("\nMindestbestellwert (Komma = ,): \n");
            minimumOrderValue = scanDou.nextDouble();
        } catch (InputMismatchException ignored) {
            System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
            scanNum = new Scanner(System.in);
            getMinimumOrderValueOfInputTown();
        }
        if (minimumOrderValue < 0) {minimumOrderValue = 0;}
        return minimumOrderValue;
    }

    public double getPriceOfInputTown() {
        double price = 0;
        try {
            System.out.println("\nLieferpreis ab Mindestbestellwert (Komma = ,): \n");
            price = scanDou.nextDouble();
        } catch (InputMismatchException ignored) {
            System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
            scanNum = new Scanner(System.in);
            getPriceOfInputTown();
        }
        if (price < 0) {
            price = 0;
        }
        return price;
    }

    public double getDiscountOrderValueOfInputTown(){
        double discountOrderValue = 0;
        try {
            System.out.println("\nRabattbestellwertgrenze (Komma = ,): \n");
            discountOrderValue = scanDou.nextDouble();
        } catch (InputMismatchException ignored) {
            System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
            scanNum = new Scanner(System.in);
            getDiscountOrderValueOfInputTown();
        }
        if (discountOrderValue < 0) {discountOrderValue = 0;}
        return discountOrderValue;
    }

    public double getDiscountPriceOfInputTown() {
        double price = 0;
        try {
            System.out.println("\nLieferpreis ab Rabattbestellwert (Komma = ,): \n");
            price = scanDou.nextDouble();
        } catch (InputMismatchException ignored) {
            System.out.println("Da ist ihnen eine falsche Eingabe passiert!");
            scanNum = new Scanner(System.in);
            getPriceOfInputTown();
        }
        if (price < 0) {
            price = 0;
        }
        return price;
    }

}
