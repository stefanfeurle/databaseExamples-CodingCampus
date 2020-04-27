package com.tsf.controller;

import com.tsf.database.models.DeliveryService;
import com.tsf.database.models.Restaurant;
import com.tsf.database.repositories.DeliveryServiceRepository;
import com.tsf.view.DeliveryServiceView;

import java.util.ArrayList;

public class DeliveryServiceController {
    private DeliveryServiceView deliveryServiceView;
    private DeliveryServiceRepository deliveryServiceRepository;
    private Restaurant restaurant;
    ArrayList<DeliveryService> deliveryTowns;
    ArrayList<DeliveryService> addDeliveryTowns = new ArrayList<>();


    public DeliveryServiceController(Restaurant restaurant, DeliveryServiceView deliveryServiceView,
                                     DeliveryServiceRepository deliveryServiceRepository) {
        this.restaurant = restaurant;
        this.deliveryServiceView = deliveryServiceView;
        this.deliveryServiceRepository = deliveryServiceRepository;
    }

    public void saveDataDeliveryService() {
        deliveryTowns = deliveryServiceRepository.findAll();
        if (deliveryTowns == null) {
            System.out.println("Update Data Delivery failed");
        } else {
            System.out.println("Update Data Delivery Service successful!");
        }
    }

    public void inputDeliveryServiceTown() {
        addDeliveryTowns.clear();
        int counter = deliveryServiceView.getCounterOfInputTown();
        for (int i = 0; i < counter; i++) {
            String town = deliveryServiceView.getTownOfInputTown();
            if (!town.equalsIgnoreCase("")) {
                int postCode = deliveryServiceView.getPostCodeOfInputTown();
                boolean isEqual = false;
                for (DeliveryService deliveryService : addDeliveryTowns) {
                    if (deliveryService.getPostcode() == postCode) {
                        isEqual = true;
                    }
                }
                for (DeliveryService deliveryService : deliveryTowns) {
                    if (deliveryService.getPostcode() == postCode) {
                        isEqual = true;
                    }
                }
                if (!isEqual) {
                    double minimumOrderValue = deliveryServiceView.getMinimumOrderValueOfInputTown();
                    double price = deliveryServiceView.getPriceOfInputTown();
                    double discountOrderValue = deliveryServiceView.getDiscountOrderValueOfInputTown();
                    double discountPrice = 0;
                    if (discountOrderValue <= minimumOrderValue) {
                        discountOrderValue = 0;
                    } else {
                        discountPrice = deliveryServiceView.getDiscountPriceOfInputTown();
                        if (discountPrice >= price) {
                            discountOrderValue = 0;
                        }
                    }
                    addDeliveryTowns.add(new DeliveryService(postCode, town, minimumOrderValue, price,
                            discountOrderValue, discountPrice, restaurant.getCompanyBookNumber()));
                }
                System.out.println("\nDiese Postleitzahl existiert schon!");
                town = "";
            }
        }
        if (addDeliveryTowns.size() > 0) {
            addDeliveryTowns.forEach(deliveryService -> {
                deliveryServiceRepository.create(deliveryService);
            });
            saveDataDeliveryService();
        }
    }
}
