package com.tsf.database.models;

public class Restaurant {
    private String companyBookNumber;
    private String kindOfRestaurant;
    private String name;
    private String email;
    private String homepage;
    private String phoneNumber;
    private int postCode;
    private String town;
    private String street;
    private int houseNumber;
    private String password;
    private String creationDate;

    public Restaurant(String companyBookNumber, String kindOfRestaurant, String name, String email, String homepage,
                      String phoneNumber, int postCode, String town, String street, int houseNumber, String password, String creationDate) {
        this.companyBookNumber = companyBookNumber;
        this.kindOfRestaurant = kindOfRestaurant;
        this.name = name;
        this.email = email;
        this.homepage = homepage;
        this.phoneNumber = phoneNumber;
        this.postCode = postCode;
        this.town = town;
        this.street = street;
        this.houseNumber = houseNumber;
        this.password = password;
        this.creationDate = creationDate;
    }

    public Restaurant(String companyBookNumber, String kindOfRestaurant, String name, String email, String homepage, String phoneNumber, int postCode, String town, String street, int houseNumber, String password) {
        this.companyBookNumber = companyBookNumber;
        this.kindOfRestaurant = kindOfRestaurant;
        this.name = name;
        this.email = email;
        this.homepage = homepage;
        this.phoneNumber = phoneNumber;
        this.postCode = postCode;
        this.town = town;
        this.street = street;
        this.houseNumber = houseNumber;
        this.password = password;
    }

    public String getCompanyBookNumber() {
        return companyBookNumber;
    }

    public String getKindOfRestaurant() {
        return kindOfRestaurant;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getHomepage() {
        return homepage;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public int getPostCode() {
        return postCode;
    }

    public String getTown() {
        return town;
    }

    public String getStreet() {
        return street;
    }

    public int getHouseNumber() {
        return houseNumber;
    }

    public String getPassword() {
        return password;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setKindOfRestaurant(String kindOfRestaurant) {
        this.kindOfRestaurant = kindOfRestaurant;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setPostCode(int postCode) {
        this.postCode = postCode;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public void setHouseNumber(int houseNumber) {
        this.houseNumber = houseNumber;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
