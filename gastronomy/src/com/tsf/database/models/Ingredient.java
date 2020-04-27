package com.tsf.database.models;

public class Ingredient {
    private String name;
    private double price;
    private boolean isRemovable;
    private boolean isAddable;
    private int menuId;
    private int id;

    public Ingredient(String name, double price, boolean isRemovable, boolean isAddable, int menuId, int id) {
        this.name = name;
        this.price = price;
        this.isRemovable = isRemovable;
        this.isAddable = isAddable;
        this.menuId = menuId;
        this.id = id;
    }

    public Ingredient(String name, double price, boolean isRemovable, boolean isAddable, int menuId) {
        this.name = name;
        this.price = price;
        this.isRemovable = isRemovable;
        this.isAddable = isAddable;
        this.menuId = menuId;
    }
}
