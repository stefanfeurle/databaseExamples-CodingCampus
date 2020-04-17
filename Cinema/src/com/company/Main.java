package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanText = new Scanner(System.in);
        Scanner scanNum = new Scanner(System.in);
        Cinema cinema = new Cinema();

        while (cinema.state == 0) {
            System.out.println("\nGÜFEL OPENAIRCINEMA MEINIGEN\n\nDas Filmerlebnis der besonderen Art!\nL ... Login\nA ... neuer Account " +
                    "erstellen!\nE ... Programm beenden\n");
            String controlLetter = scanText.nextLine();

            if (controlLetter.equalsIgnoreCase("A")) {
                System.out.println("\nIn ein paar kleinen Schritten zum eigenen Account!\nVorname:\n");
                String firstName = scanText.nextLine();
                System.out.println("Nachname:\n");
                String lastName = scanText.nextLine();
                System.out.println("E-Mail:\n");
                String email = scanText.nextLine();
                System.out.println("Telefonnummer:\n");
                String phoneNumber = scanText.nextLine();
                System.out.println("Passwort:\n");
                String password = scanText.nextLine();

                cinema.createAccount(firstName, lastName, email, phoneNumber, password);
            } else if (controlLetter.equalsIgnoreCase("L")) {
                System.out.println("\nUsername:\n");
                String userName = scanText.nextLine();
                System.out.println("Passwort:\n");
                String password = scanText.nextLine();

                cinema.loginUser(userName, password);
            } else if (controlLetter.equalsIgnoreCase("E")) {
                cinema.state = 2;
            }

            while (cinema.state == 1) {
                String date1 = "2020-05-01";
                String date2 = "2020-05-02";
                System.out.println("\nGÜFEL OPENAIRCINEMA MEINIGEN\n\nDas Filmerlebnis der besonderen Art!\nAufgrund der" +
                        " besonderen Vorkommnisse (Corona) der vergangenen Wochen und Monate \nplanen wir das Ende " +
                        "unseres Shutdowns für den 01.05.2020!\nWir würden uns nach den schwierigen letzten Wochen besonders " +
                        "über ihren (euren) Besuch \n" + cinema.name.toUpperCase() + " bei uns freuen!\nMit ein paar" +
                        " Klicks können sie ihre (eure) Karte für diesen fast besonderen Anlass bestellen!\n\nK ... " +
                        "Kinoprogramm " + date1 + "\nL ... Kinoprogramm " + date2 + "\n\nE ... Sitzung beenden\nG ... Gespeicherte Bestellungen\n");

                controlLetter = scanText.nextLine();

                if (controlLetter.equalsIgnoreCase("E")) {
                    cinema.state = 0;
                    cinema.userName = "";
                    cinema.name = "";
                } else if (controlLetter.equalsIgnoreCase("G")) {
                    while (!controlLetter.equalsIgnoreCase("Z")) {
                        System.out.println("\nGÜFEL OPENAIRCINEMA MEINIGEN\n\nU ... Überblick über deine Bestellungen\n" +
                                "B ... Bestimmte Bestellung anschauen\nS ... Stornieren einer Bestellung \nZ ... Zuürck zur Startseite\n");
                        controlLetter = scanText.nextLine();

                        if (controlLetter.equalsIgnoreCase("U")) {
                            cinema.printOrders();
                        } else if (controlLetter.equalsIgnoreCase("B")) {
                            System.out.println("\nBitte geben sie ihre Bestellnummer ein!\n");
                            int customerOrderId = scanNum.nextInt();
                            cinema.printOrder(customerOrderId);
                        } else if (controlLetter.equalsIgnoreCase("S")) {
                            System.out.println("\nBitte geben sie ihre Bestellnummer ein!\n");
                            int customerOrderId = scanNum.nextInt();
                            cinema.printOrder(customerOrderId);
                            System.out.println("\nSind sie sicher, dass sie ihre Bestellung stornieren möchten," +
                                    " dann geben sie erneut ihre Bestellnummer ein!\n");
                            int customerOrderId2 = scanNum.nextInt();
                            if (customerOrderId == customerOrderId2) {
                                cinema.cancelOrder(customerOrderId);
                            }
                        }
                    }

                } else {
                    int movieNumber = -1;
                    while (movieNumber != 0) {
                        cinema.movieCounter = 0;
                        if (controlLetter.equalsIgnoreCase("K")) {
                            cinema.printCinemaProgram(date1);
                        } else if (controlLetter.equalsIgnoreCase("L")) {
                            cinema.printCinemaProgram(date2);
                        }

                        System.out.println("\n\nWählen sie den Film ihres Interesses!\n0 ... zurück zur Startseite\n");
                        movieNumber = scanNum.nextInt();

                        if (movieNumber != 0) {
                            int timeNumber = -1;
                            while (timeNumber != 0) {
                                cinema.timeCounter = 0;
                                cinema.printMovieTimes(movieNumber);

                                System.out.println("\nWelche Vorführung bevorzugen sie?\n0 ... zurück\n");
                                timeNumber = scanNum.nextInt();
                                if (timeNumber != 0) {
                                    cinema.checkHall(timeNumber);
                                    System.out.println("\nwieviele Sitzeplätze möchten sie bestellen?\n0 ... zurück\n");
                                    int seatCounter = scanNum.nextInt();
                                    if (seatCounter != 0) {
                                        boolean isOrder = cinema.orderingSeats(seatCounter);
                                        if (isOrder) {
                                            timeNumber = 0;
                                            movieNumber = 0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


