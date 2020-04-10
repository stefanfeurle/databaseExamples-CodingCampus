package com.company;

import java.util.Date;
import java.util.Scanner;
import java.util.Timer;

public class Main {

    public static void main(String[] args) {
        Scanner scanText = new Scanner(System.in);
        Scanner scanNum = new Scanner(System.in);
        Chat chat = new Chat();

        while (chat.state == 0) {
            System.out.println("\n\tMY CHAT\n\nDie moderne Art der Kommunikation!\nL ... Login\nA ... neuer Account " +
                    "erstellen!\nE ... Programm beenden\n");
            String controlLetter = scanText.nextLine();

            if (controlLetter.equalsIgnoreCase("a")) {
                System.out.println("\nIn ein paar kleinen Schritten zum eigenen Account!\nVorname:\n");
                String firstName = scanText.nextLine();
                System.out.println("Nachname:\n");
                String lastName = scanText.nextLine();
                System.out.println("E-Mail:\n");
                String email = scanText.nextLine();
                System.out.println("Passwort:\n");
                String password = scanText.nextLine();

                chat.createAccount(firstName, lastName, email, password);
            } else if (controlLetter.equalsIgnoreCase("L")) {
                System.out.println("\nUsername:\n");
                String userName = scanText.nextLine();
                System.out.println("Passwort:\n");
                String password = scanText.nextLine();

                chat.loginUser(userName, password);
            } else if (controlLetter.equalsIgnoreCase("E")) {
                chat.state = 2;
            }

            Timer timer = new Timer();
            MyTimerTask myTimerTask = new MyTimerTask(chat);

            if (chat.state == 1) {
                System.out.println("\nHallo " + chat.name + "!\nHerzlichen Willkommen auf deinem Account von MY CHAT!\n");
                timer.schedule(myTimerTask, new Date(), 10000);
            }

            while (chat.state == 1) {

                System.out.println(chat.userName + "\nS ... Neue Nachricht senden\nU ... ungelesene erhaltene Nachrichten" +
                        "\nA ... Alle erhaltenen Nachrichten\nG ... Gesendete Nachrichten\nE ... Account schließen\n");
                controlLetter = scanText.nextLine();
                System.out.println(controlLetter);

                if(controlLetter.equalsIgnoreCase("E")) {
                    chat.state = 0;

                }else if (controlLetter.equalsIgnoreCase("S")) {
                    System.out.println("An wen möchtest du eine Nachricht senden? (Username)\n");
                    String receiverUserName = scanText.nextLine();
                    System.out.println("\nNachricht: \n");
                    String message = scanText.nextLine();

                    chat.sendMessage(receiverUserName,message);

                }else if (controlLetter.equalsIgnoreCase("U")) {
                    chat.printUnreadMessages();

                }else if (controlLetter.equalsIgnoreCase("G")) {
                    System.out.println("Wieviele der letzten gesendeten Nachrichten möchten sie anschauen!\n0 ... alle\n");
                    int limitNumber = scanNum.nextInt(); // sollte Falscheingabe (keine Zahl) abfangen
                    if (limitNumber < 0) {
                        limitNumber = 10;
                    } else if (limitNumber > 100 || limitNumber == 0) {
                        limitNumber = 100;
                    }
                    chat.printSentMessages(limitNumber);

                }else if (controlLetter.equalsIgnoreCase("A")) {
                    System.out.println("Wieviele der letzten erhaltenen Nachrichten möchten sie anschauen!\n0 ... alle\n");
                    int limitNumber = scanNum.nextInt();
                    if (limitNumber < 0) {
                        limitNumber = 10;
                    } else if (limitNumber > 100 || limitNumber == 0) {
                        limitNumber = 100;
                    }
                    chat.printReceivedMessages(limitNumber);
                }
            }
            timer.cancel();
        }
    }
}
