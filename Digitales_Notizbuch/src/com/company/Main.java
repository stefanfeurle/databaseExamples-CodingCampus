package com.company;

import com.mysql.cj.protocol.Resultset;

import java.sql.*;

public class Main {

    public static void main(String[] args) {
        Connection connection = null;
        String url = "jdbc:mysql://localhost:3306/digital_notebook?user=root";

        Statement statement = null;

        try{
            connection = DriverManager.getConnection(url);
            System.out.println("Connacted to Database!");

            String sql = "Select * from notebook";
            statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                String topic = resultset.getString("topic");
                String model = resultset.getString("model");
                String note = resultset.getString("note");
                String operationManualLink = resultset.getString("link_operation_manual");
                String purchaseDate = resultset.getDate("date_of_purchase").toString();
                int warrantyPeriod = resultset.getInt("warranty_period");
                System.out.println(topic.toUpperCase() + "\n" + model + ", Kaufdatum: " + purchaseDate + ", Garantie " +
                        warrantyPeriod + " Jahre\nLink Bedienungsanleitung: " + operationManualLink + "\n\n" +note + "\n\n");
            }
            statement.close();

            sql = "Insert into notebook (topic, model, note, link_operation_manual, date_of_purchase, warranty_period)";
            sql += " Values ('Tiefkühlschrank', 'Liebherr GNP2313 Comfort NoFrost','Art:Stand\nEnergieeffizienz: A++\n";
            sql += "Nutzinhalt Gefrierteil (in Liter):185 l\nBetriebslautstärke:42 dB\nEnergieverbrauch/Jahr:206 kWh\n";
            sql += "Ausstattung:Temperatur-Digital-Anzeige, Abtauautomatik, NoFrost, Türanschlag wechselbar\n";
            sql += "Breite (mm):600\nHöhe (mm):1447\nTiefe (mm):630','https://d25jbgvg9kmxad.cloudfront.net/catalogue/";
            sql += "sckakfpbzcktywfp/HAU_BA_B2B_708198604_de_2020-02-06-00-37-39.pdf', '2020-03-25', 2)";

            statement = connection.createStatement();
            System.out.println(statement.executeUpdate(sql));
            statement.close();

            sql = "Delete from notebook where topic = 'Tiefkühlschrank' and id > 7";
            statement = connection.createStatement();
            System.out.println(statement.executeUpdate(sql));
            statement.close();

        }catch(SQLException ex) {
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
}
