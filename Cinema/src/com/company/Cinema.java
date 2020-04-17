package com.company;

import java.sql.*;;
import java.util.Scanner;

public class Cinema {
    String url = "jdbc:mysql://localhost:3306/cinema?user=root";
    Connection connection = null;
    Statement statement = null;
    String userName;
    String name;
    int state = 0;
    int changeOrderNumber = 11111;

    int movieCounter = 0;
    int timeCounter = 0;
    int [] movieIds = new int[20];
    String [] startTimes = new String[10];
    String dayOfInterest;
    int movieIdOfInterest;
    String timeOfInterest;
    int cinemaScreeningIdOfInterest;

    int hallIdOfInterest;
    String hallName;
    int rowsOfSeats;
    int seatsPerRow;

    public void createAccount(String firstName, String lastName, String email, String phoneNumber, String password){
        try {
            String userName1 = firstName.toLowerCase() + "." + lastName.toLowerCase();
            //dies funktioniert solange ein username einmal vorkommt!!...
            String sql = "Insert into customer (username, password, first_name, last_name, email, phone_number)" +
                    "values ('" + userName1 + "', '" + password + "', '" + firstName + "', '" + lastName +
                    "', '" + email + "', '" + phoneNumber + "');";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            int update = statement.executeUpdate(sql);
            if (update == 1) {
                System.out.println("Hallo " + firstName + "!\nWICHTIG -dein Username ist\n" + userName1 + "\n(Account erfolgreich erstellt!)\n");
                state = 1;
                name = firstName;
                userName = userName1;
            }
            statement.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void loginUser(String userName1, String password) {
        try {
            String sql = "Select username, password, first_name from customer";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                String userN = resultset.getString("username");
                String passW = resultset.getString("password");
                String firstName = resultset.getString("first_name");

                if (userN.equals(userName1) && passW.equals(password)) {
                    userName = userName1;
                    name = firstName;
                    state = 1;
                }
            }
            statement.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void printCinemaProgram(String date) {
        try {
            dayOfInterest = date;
            String movieTitle = "";
            String sql = "Select movie.id, movie.title, movie.description, movie.duration, movie.age_limit, start_time from ";
            sql += "cinema_screening inner join movie on cinema_screening.movie_id = movie.id where date = '" + dayOfInterest;
            sql += "' order by movie.age_limit, movie.title;";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                int movieId = resultset.getInt("movie.id");
                String title = resultset.getString("movie.title");
                String description = resultset.getString("movie.description");
                int duration = resultset.getInt("movie.duration");
                int ageLimit = resultset.getInt("movie.age_limit");
                String startTime = resultset.getTime("start_time").toString();

                if (movieCounter == 0) {
                    System.out.println( "\nGÜFEL OPENAIRCINEMA MEINIGEN\n\nDas Kinoprogramm vom ** " + date + " ** für" +
                            " das Kinoerlebnis der besonderen Art!\n");
                }
                if (!title.equalsIgnoreCase(movieTitle)) {
                    movieCounter++;
                    System.out.print("\n" + movieCounter + ". " + title.toUpperCase() + " (" + duration + " min, ab "
                            + ageLimit + " J., " + description + ")   " + startTime.substring(0, 5));
                    movieTitle = title;
                    movieIds[movieCounter] = movieId;
                } else {
                    System.out.print(", " + startTime.substring(0, 5));
                }
            }
            statement.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void printMovieTimes(int movienumber) {
        try {
            movieIdOfInterest = movieIds[movienumber];
            String sql = "Select movie.title, movie.description, movie.duration, movie.age_limit, start_time from ";
            sql += "cinema_screening inner join movie on cinema_screening.movie_id = movie.id where date = '" + dayOfInterest;
            sql += "' and movie.id = '" + movieIdOfInterest + "' group by start_time;";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                String title = resultset.getString("movie.title");
                String description = resultset.getString("movie.description");
                int duration = resultset.getInt("movie.duration");
                int ageLimit = resultset.getInt("movie.age_limit");
                String startTime = resultset.getTime("start_time").toString();

                if (timeCounter == 0) {
                    System.out.println("\nGÜFEL OPENAIRCINEMA MEINIGEN\n" + title.toUpperCase() + " (" + duration + " min, ab " + ageLimit + " J., " + description + ")\n");
                }
                timeCounter++;
                System.out.println(timeCounter + ". " + startTime.substring(0, 5));
                startTimes[timeCounter] = startTime;
            }
            statement.close();
        }catch(SQLException ex) {
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void checkHall(int timeNumber) {
        try {
            timeOfInterest = startTimes[timeNumber];
            String sql = "Select hall.id, hall.name, hall.rows_of_seats, hall.seats_per_row, cinema_screening.id from ";
            sql += "cinema_screening inner join hall on cinema_screening.hall_id = hall.id ";
            sql += "where date = '" + dayOfInterest + "' and movie_id = " + movieIdOfInterest + " and start_time = '";
            sql += timeOfInterest + "';";

            //System.out.println(dayOfInterest + movieIdOfInterest + timeOfInterest);

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                hallIdOfInterest = resultset.getInt("hall.id");
                hallName = resultset.getString("hall.name");
                rowsOfSeats = resultset.getInt("hall.rows_of_seats");
                seatsPerRow = resultset.getInt("hall.seats_per_row");
                cinemaScreeningIdOfInterest = resultset.getInt("cinema_screening.id");
            }
            //System.out.println(hallIdOfInterest + ", " + hallName + ", " + rowsOfSeats + ", " + seatsPerRow + ", " + cinemaScreeningOfInterest);
            // dies funktioniert nur so lange, wie eine Aufführung zu einer bestimmten Zeit ist!!!
            statement.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            }catch(SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void printCinemaHall() {
        try {
            boolean isPrint = false;
            String sql = "Select id, is_free from seats where cinema_screening_id = " + cinemaScreeningIdOfInterest;

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                int seatId = resultset.getInt("id");
                boolean isFree = resultset.getBoolean("is_free");

                isPrint = true;
                System.out.print(seatId == 1 ? "\n\t|" : "|");
                if (isFree) {
                    System.out.print(seatId < 10 ? " " + seatId + "|" : seatId + "|");
                } else {
                    System.out.print("XX|");
                }
                System.out.print(seatId%seatsPerRow == 0 ? "\n\t" : "");
            }
            System.out.println();
            statement.close();
            // wäre so etwas besser direkt auf der Datenbank zu machen? Wenn so etwas geht, wie geht so etwas?
            if (!isPrint) {
                int id = 0;
                for (int i = 1; i <= rowsOfSeats; i++) {
                    for (int j = 1; j <= seatsPerRow; j++){
                        id++;
                        sql = "insert into seats(id, row_number, seat_per_row, is_free, cinema_screening_id) values (";
                        sql += id + ", " + i + ", " + j + ", 1, " + cinemaScreeningIdOfInterest + ");";

                        statement = connection.createStatement();
                        statement.executeUpdate(sql);
                        statement.close();
                    }
                }
                printCinemaHall();
            }
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public boolean orderingSeats(int seatCounter) {
        Scanner scan = new Scanner(System.in);
        boolean isOrdering = false;
        int orderId = 0;
        int freeSeats = 0;
        printCinemaHall();
        try {
            String sql = "SELECT sum(is_free = 1) FROM `seats` WHERE cinema_screening_id = " + cinemaScreeningIdOfInterest;

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                freeSeats = resultset.getInt("sum(is_free = 1)");
            }
            statement.close();
            if (freeSeats == 0) {
                System.out.println("\nSorry! Es sind keine Sitzplätze mehr frei!\n");
                seatCounter = 0;
            }
            if (freeSeats < seatCounter && freeSeats > 0) {
                if (freeSeats == 1) {
                    System.out.println("\nEs ist nur noch ein Sitzplatz frei!\n");
                } else {
                    System.out.println("\nEs sind nur noch " + freeSeats + " Sitzplätze frei!\n");
                }
                seatCounter = freeSeats;
            }

            for (int i = 0; i < seatCounter; i++) {
                if (i > 0){
                    printCinemaHall();
                }
                if (i == 0 && seatCounter == 1) {
                    System.out.println("Welchen Sitzplatz wählen sie aus!\n0 ... Abbruch\n");
                } else {
                    System.out.println("Wählen sie den " + (i + 1) + ". Sitzplatz aus!\n0 ... Abbruch\n");
                }
                int seatNumber = scan.nextInt();

                if (seatNumber == 0) {
                    i = seatCounter;
                } else {
                    sql = "Select is_free from seats where cinema_screening_id = " + cinemaScreeningIdOfInterest;
                    sql += " and id = " + seatNumber;
                    boolean isFree = false;

                    connection = DriverManager.getConnection(url);
                    statement = connection.createStatement();
                    resultset = statement.executeQuery(sql);

                    while (resultset.next()) {
                        isFree = resultset.getBoolean("is_free");
                    }
                    statement.close();
                    if (isFree) {
                        isOrdering = true;
                        if (i == 0) {
                            sql = "Insert into ticket_order(customer_username, is_cancelled) values ('";
                            sql += userName + "', 0);";

                            statement = connection.createStatement();
                            statement.executeUpdate(sql);
                            statement.close();

                            sql = "Select id from ticket_order where customer_username = '" + userName;
                            sql += "' order by creation_date desc limit 1;";

                            statement = connection.createStatement();
                            resultset = statement.executeQuery(sql);

                            while (resultset.next()) {
                                orderId = resultset.getInt("id");
                            }
                            statement.close();
                        }
                        sql = "Update seats set is_free = 0, ticket_order_id = " + orderId + " where cinema_screening_id = ";
                        sql += cinemaScreeningIdOfInterest + " and id = " + seatNumber;

                        statement = connection.createStatement();
                        statement.executeUpdate(sql);
                        statement.close();

                    } else {
                        i--;
                        System.out.println("Falsche Eingabe! Entweder ist der Platz besetzt oder nicht vorhanden!");
                    }
                }
            }
        }catch(SQLException ex){
                    ex.printStackTrace();
                }finally {
                    try {
                        if (statement != null) {
                            statement.close();
                        }
                    }catch(SQLException ex) {
                        ex.printStackTrace();
                    }
                }
        if (isOrdering) {
            printOrder((orderId + changeOrderNumber));
        }
        return isOrdering;
    }

    public void cancelOrder(int customerOrderId) {
        try {
            int orderId = customerOrderId - changeOrderNumber;
            String sql = "update ticket_order set is_cancelled = 1 where id = " + orderId;
            statement = connection.createStatement();
            statement.executeUpdate(sql);
            statement.close();

            sql = "UPDATE `seats` SET is_free = 1 WHERE ticket_order_id = " + orderId;
            statement = connection.createStatement();
            statement.executeUpdate(sql);
            statement.close();

        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }



    }

    public void printOrder(int customerOrderId) {
         int orderId = customerOrderId - changeOrderNumber;
         boolean isHeadlinePrinted = false;

         try {
             String sql = "Select date, start_time, seats.row_number, seats.seat_per_row, hall.id, hall.name, movie.title " +
                     "from cinema_screening " +
                     "inner join seats on cinema_screening.id = seats.cinema_screening_id " +
                     "inner join hall on cinema_screening.hall_id = hall.id " +
                     "inner join movie on cinema_screening.movie_id =  movie.id " +
                     "inner join ticket_order on seats.ticket_order_id = ticket_order.id " +
                     "where seats.ticket_order_id = " + orderId + " and ticket_order.is_cancelled = 0;";

             connection = DriverManager.getConnection(url);
             statement = connection.createStatement();
             ResultSet resultset = statement.executeQuery(sql);

             while (resultset.next()) {
                 String date = resultset.getDate("date").toString();
                 String time = resultset.getTime("start_time").toString();
                 int seatRowNumber = resultset.getInt("seats.row_number");
                 int seatPerRow = resultset.getInt("seats.seat_per_row");
                 int hallId = resultset.getInt("hall.id");
                 String hallName = resultset.getString("hall.name");
                 String movieTitle = resultset.getString("movie.title");

                 if (!isHeadlinePrinted) {
                     isHeadlinePrinted = true;
                     System.out.println("\nBESTELLUNG:\nNr.:  " + customerOrderId + "   (Diese Nummer ist wichtig!)\n\nFilm:  "
                             + movieTitle + "\n" + date + " " + time.substring(0, 5) + " in Saal " + hallId + " (" + hallName + ")");
                 }
                 System.out.println("Reihe: " + seatRowNumber + " Platz: " + seatPerRow);
             }
             statement.close();
         }catch(SQLException ex){
             ex.printStackTrace();
         }finally {
             try {
                 if (statement != null) {
                     statement.close();
                 }
             } catch (SQLException ex) {
                 ex.printStackTrace();
             }
         }
    }
    public void printOrders() {
        boolean isHeadlinePrinted = false;

        try {
            String sql = "Select id, creation_date, is_cancelled from ticket_order " +
                    "where customer_username = '" + userName + "' order by creation_date desc limit 20;";

            connection = DriverManager.getConnection(url);
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                int orderId = resultset.getInt("id");
                String date = resultset.getDate("creation_date").toString();
                String time = resultset.getTime("creation_date").toString();
                boolean isCancelled = resultset.getBoolean("is_cancelled");

                if (!isHeadlinePrinted) {
                   isHeadlinePrinted = true;
                   System.out.println("\n" + userName + "\nIHRE BESTELLUNGEN:\n");
                }
                System.out.print((orderId + changeOrderNumber) + "   " + date + " " + time);
                System.out.println(isCancelled ? "    STORNO" : "");
            }
            statement.close();
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
