package com.tsf.database.models;

public class KindOfMenu {
    private String name;
    private String description;
    private boolean hasSameExtras;
    private String companyBookNumber;
    private int id;

    public KindOfMenu(String name, String description, boolean hasSameExtras, String companyBookNumber, int id) {
        this.name = name;
        this.description = description;
        this.hasSameExtras = hasSameExtras;
        this.companyBookNumber = companyBookNumber;
        this.id = id;
    }

    public KindOfMenu(String name, String description, boolean hasSameExtras) {
        this.name = name;
        this.description = description;
        this.hasSameExtras = hasSameExtras;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public boolean getHasSameExtras() {
        return hasSameExtras;
    }

    public String getCompanyBookNumber() {
        return companyBookNumber;
    }

    public int getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
