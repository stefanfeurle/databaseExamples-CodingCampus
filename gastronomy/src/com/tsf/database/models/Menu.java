package com.tsf.database.models;

public class Menu {
    private String name;
    private String description;
    private double price;
    private int kindId;
    private int id;

    public Menu(String name, String description, double price, int kindId, int id) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.kindId = kindId;
        this.id = id;
    }

    public Menu(String name, String description, double price, int kindId) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.kindId = kindId;
    }
}
