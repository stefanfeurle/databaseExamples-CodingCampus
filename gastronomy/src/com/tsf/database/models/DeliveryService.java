package com.tsf.database.models;

public class DeliveryService {
    private int postcode;
    private String town;
    private double minimumOrderValue;
    private double price;
    private double discountOrderValue;
    private double discountPrice;
    private String companyBookNumber;

    public DeliveryService(int postcode, String town, double minimumOrderValue, double price,
                           double discountOrderValue, double discountPrice, String companyBookNumber) {
        this.postcode = postcode;
        this.town = town;
        this.minimumOrderValue = minimumOrderValue;
        this.price = price;
        this.discountOrderValue = discountOrderValue;
        this.discountPrice = discountPrice;
        this.companyBookNumber = companyBookNumber;
    }

    public int getPostcode() {
        return postcode;
    }

    public String getTown() {
        return town;
    }

    public double getMinimumOrderValue() {
        return minimumOrderValue;
    }

    public double getPrice() {
        return price;
    }

    public double getDiscountOrderValue() {
        return discountOrderValue;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public String getCompanyBookNumber() {
        return companyBookNumber;
    }
}
