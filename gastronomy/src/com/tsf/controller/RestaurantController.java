package com.tsf.controller;

import com.tsf.database.models.Restaurant;
import com.tsf.database.repositories.DeliveryServiceRepository;
import com.tsf.database.repositories.KindOfMenuRepository;
import com.tsf.database.repositories.MenuRepository;
import com.tsf.database.repositories.RestaurantRepository;
import com.tsf.view.DeliveryServiceView;
import com.tsf.view.KindOfMenuView;
import com.tsf.view.MenuView;
import com.tsf.view.RestaurantView;

public class RestaurantController {
    private RestaurantRepository restaurantRepository;
    private RestaurantView restaurantView;
    private Restaurant restaurant;

    KindOfMenuView kindOfMenuView = new KindOfMenuView();
    KindOfMenuRepository kindOfMenuRepository;
    KindOfMenuController kindOfMenuController;

    DeliveryServiceView deliveryServiceView = new DeliveryServiceView();
    DeliveryServiceRepository deliveryServiceRepository;
    DeliveryServiceController deliveryServiceController;

    MenuView menuView = new MenuView();
    MenuRepository menuRepository;
    MenuController menuController;

    public RestaurantController(RestaurantView restaurantView, RestaurantRepository restaurantRepository) {
        this.restaurantView = restaurantView;
        this.restaurantRepository = restaurantRepository;
    }

    public void startGastro() {
        String controlLetter = restaurantView.printStart();
        boolean correctInsert = false;

        if (controlLetter.equalsIgnoreCase("A")) {
            String companyBookNumber = restaurantView.getCompanyBookNumber();
            if (!companyBookNumber.equalsIgnoreCase("")) {
                String password = restaurantView.createPassword();
                if (!password.equalsIgnoreCase("")) {
                    String kindOfRestaurant = restaurantView.getKindOfRestaurant();
                    String name = restaurantView.getName(kindOfRestaurant);
                    String email = restaurantView.getEmail();
                    String homepage = restaurantView.getHomepage();
                    String phoneNumber = restaurantView.getPhoneNumber();
                    int postCode = restaurantView.getPostCode();
                    String town = restaurantView.getTown();
                    String street = restaurantView.getStreet();
                    int houseNumber = restaurantView.getHouseNumber();

                    correctInsert = restaurantRepository.createAccount(companyBookNumber, kindOfRestaurant, name,
                            email, homepage, phoneNumber, postCode, town, street, houseNumber, password);
                    if (correctInsert) {
                        restaurant = new Restaurant(companyBookNumber, kindOfRestaurant, name, email, homepage,
                                phoneNumber, postCode, town, street, houseNumber, password);
                        saveDataProcess();
                    }
                }
            }
            if (!correctInsert) {
                    startGastro();
                }

        } else if (controlLetter.equalsIgnoreCase("L")) {
            String userName = restaurantView.getUserName();
            String password = restaurantView.getPassword();

            restaurant = restaurantRepository.loginUser(userName, password);
            if (restaurant == null) {
                startGastro();
            }
            saveDataProcess();

        } else if (controlLetter.equalsIgnoreCase("E")) {
        } else {
            startGastro();
        }

        kindOfMenuRepository = new KindOfMenuRepository(restaurant);
    }

    public void saveDataProcess() {
        kindOfMenuRepository = new KindOfMenuRepository(restaurant);
        kindOfMenuController = new KindOfMenuController(restaurant, kindOfMenuView, kindOfMenuRepository);
        kindOfMenuController.saveDataKindOfMenu();

        menuRepository = new MenuRepository(restaurant);
        menuController = new MenuController(restaurant, menuView, menuRepository)
        menuController.saveDataMenu();
        //kindOfMenuController.saveDataIngredient();
        deliveryServiceRepository = new DeliveryServiceRepository(restaurant);
        deliveryServiceController = new DeliveryServiceController(restaurant, deliveryServiceView, deliveryServiceRepository);
        deliveryServiceController.saveDataDeliveryService();

        selectionProcess();
    }

    public void selectionProcess() {
        String controlLetter = restaurantView.printSelectionProcess();

        if (controlLetter.equalsIgnoreCase("N")) {
            selectionProcessInput();
        }
        else if (controlLetter.equalsIgnoreCase("V")) {
            selectionProcessEditing();
        }
        else if (controlLetter.equalsIgnoreCase("A")) {
            selectionProcessOutput();
        }
        else if (controlLetter.equalsIgnoreCase("E")) {
            restaurant = null;
            startGastro();
        } else {
            selectionProcess();
        }
    }

    public void selectionProcessInput() {
        String controlLetter1 = restaurantView.printSelectionProcessInput();

        if (controlLetter1.equalsIgnoreCase("A")) {
            kindOfMenuController.inputKindOfMenu();
            selectionProcessInput();
        } else if (controlLetter1.equalsIgnoreCase("M")) {

            selectionProcessInput();
        } else if (controlLetter1.equalsIgnoreCase("I")) {

            selectionProcessInput();
        } else if (controlLetter1.equalsIgnoreCase("L")) {
            deliveryServiceController.inputDeliveryServiceTown();
            selectionProcessInput();
        } else if (controlLetter1.equalsIgnoreCase("Z")) {
            selectionProcess();
        } else {
           selectionProcessInput();
        }
    }

    public void selectionProcessEditing() {
        String controlLetter2 = restaurantView.printSelectionProcessEditing();

        if (controlLetter2.equalsIgnoreCase("A")) {

            selectionProcessEditing();
        } else if (controlLetter2.equalsIgnoreCase("M")) {

            selectionProcessEditing();
        } else if (controlLetter2.equalsIgnoreCase("I")) {

            selectionProcessEditing();
        } else if (controlLetter2.equalsIgnoreCase("L")) {

            selectionProcessEditing();
        } else if (controlLetter2.equalsIgnoreCase("D")) {

            selectionProcessEditing();
        } else if (controlLetter2.equalsIgnoreCase("Z")) {
            selectionProcess();
        } else {
            selectionProcessEditing();
        }
    }

    public void selectionProcessOutput() {
        String controlLetter3 = restaurantView.printSelectionProcessOutput();

        if (controlLetter3.equalsIgnoreCase("A")) {

            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("M")) {

            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("I")) {

            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("L")) {

            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("D")) {

            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("Z")) {
            selectionProcess();
        } else {
            selectionProcessOutput();
        }
    }
}
