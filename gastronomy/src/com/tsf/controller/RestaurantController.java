package com.tsf.controller;

import com.tsf.database.models.Restaurant;
import com.tsf.database.repositories.*;
import com.tsf.view.*;

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

    IngredientView ingredientView = new IngredientView();
    IngredientRepository ingredientRepository;
    IngredientController ingredientController;

    MenuView menuView = new MenuView();
    MenuRepository menuRepository;
    MenuController menuController;

    public RestaurantController(RestaurantView restaurantView, RestaurantRepository restaurantRepository) {
        this.restaurantView = restaurantView;
        this.restaurantRepository = restaurantRepository;
    }

    public void startGastro() {
        String controlLetter = restaurantView.printStart();
        if (controlLetter.equalsIgnoreCase("A")) {
            inputAccount();
        } else if (controlLetter.equalsIgnoreCase("L")) {
            String userName = restaurantView.setUserName();
            String password = restaurantView.setPassword();

            restaurant = restaurantRepository.loginUser(userName, password);
            if (restaurant == null) {
                startGastro();
            }
            saveDataProcess();
        } else if (controlLetter.equalsIgnoreCase("E")) {
        } else {
            startGastro();
        }
    }

    private void inputAccount() {
        boolean correctInsert = false;
        String companyBookNumber = restaurantView.setCompanyBookNumber();
        if (!companyBookNumber.trim().equalsIgnoreCase("")) {
            String password = restaurantView.createPassword();
            if (!password.trim().equalsIgnoreCase("")) {
                String kindOfRestaurant = restaurantView.setKindOfRestaurant();
                String name = restaurantView.setName(kindOfRestaurant);
                String email = restaurantView.setEmail();
                String homepage = restaurantView.setHomepage();
                String phoneNumber = restaurantView.setPhoneNumber();
                restaurantView.printOutput("Nur noch ihre Anschrift!");
                int postCode = restaurantView.setPostCode();
                String town = restaurantView.setTown();
                String street = restaurantView.setStreet();
                int houseNumber = restaurantView.setHouseNumber();

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
    }

    public void saveDataProcess() {
        kindOfMenuRepository = new KindOfMenuRepository(restaurant, kindOfMenuView);
        kindOfMenuController = new KindOfMenuController(kindOfMenuView, kindOfMenuRepository, restaurant);
        kindOfMenuController.saveDataKindOfMenu();

        menuRepository = new MenuRepository(restaurant, menuView);
        menuController = new MenuController(menuView, menuRepository,  kindOfMenuController);
        menuController.saveDataMenu();

        ingredientRepository = new IngredientRepository(restaurant, ingredientView);
        ingredientController = new IngredientController(ingredientView, ingredientRepository,  kindOfMenuController, menuController);
        ingredientController.saveDataIngredient();

        deliveryServiceRepository = new DeliveryServiceRepository(restaurant, deliveryServiceView);
        deliveryServiceController = new DeliveryServiceController(restaurant, deliveryServiceView, deliveryServiceRepository);
        deliveryServiceController.saveDataDeliveryService();

        selectionProcess();
    }

    private void editingRestaurant() {
        boolean hasToUpdate = false;
        boolean makeFurtherChange = true;

        while (makeFurtherChange) {
            restaurantView.outputDataRestaurant(restaurant);
            int selectNumber = restaurantView.selectData();
            if (selectNumber == 1 || selectNumber == 12) {
                restaurantView.printOutput("Dieses Datenfeld ist nicht veränderbar!");
            } else if (selectNumber == 2) {
                hasToUpdate = editingKindOfRestaurant(hasToUpdate);
            } else if (selectNumber == 3) {
                hasToUpdate = editingName(hasToUpdate);
            } else if (selectNumber == 4) {
                hasToUpdate = editingEmail(hasToUpdate);
            } else if (selectNumber == 5) {
                hasToUpdate = editingHomepage(hasToUpdate);
            } else if (selectNumber == 6) {
                hasToUpdate = editingPhoneNumber(hasToUpdate);
            } else if (selectNumber == 7) {
                hasToUpdate = editingPostCode(hasToUpdate);
            } else if (selectNumber == 8) {
                hasToUpdate = editingTown(hasToUpdate);
            } else if (selectNumber == 9) {
                hasToUpdate = editingStreet(hasToUpdate);
            } else if (selectNumber == 10) {
                hasToUpdate = editingHouseNumber(hasToUpdate);
            } else if (selectNumber == 11) {
                hasToUpdate = editingPassword(hasToUpdate);
            }
            if (selectNumber != 0) {
                makeFurtherChange = restaurantView.askFurtherChange();
            } else {
                makeFurtherChange = false;
            }
        }
        if (hasToUpdate) {
            restaurantRepository.update(restaurant);
        }
    }

    private boolean editingPassword(boolean hasToUpdate) {
        String password = restaurantView.setPassword();
        if (!password.trim().equalsIgnoreCase(restaurant.getPassword()) && !password.trim().equalsIgnoreCase("")) {
            restaurant.setPassword(password);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private boolean editingHouseNumber(boolean hasToUpdate) {
        int houseNumber = restaurantView.setHouseNumber();
        if (houseNumber != restaurant.getHouseNumber()) {
            restaurant.setHouseNumber(houseNumber);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private boolean editingStreet(boolean hasToUpdate) {
        String street = restaurantView.setStreet();
        if (!street.trim().equalsIgnoreCase(restaurant.getStreet()) && !street.trim().equalsIgnoreCase("")) {
            restaurant.setStreet(street);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private boolean editingTown(boolean hasToUpdate) {
        String town = restaurantView.setTown();
        if (!town.trim().equalsIgnoreCase(restaurant.getTown()) && !town.trim().equalsIgnoreCase("")) {
            restaurant.setTown(town);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private boolean editingPostCode(boolean hasToUpdate) {
        int postCode = restaurantView.setPostCode();
        if (postCode != restaurant.getPostCode()) {
            restaurant.setPostCode(postCode);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private boolean editingPhoneNumber(boolean hasToUpdate) {
        String phoneNumber = restaurantView.setPhoneNumber();
        if (!phoneNumber.trim().equalsIgnoreCase(restaurant.getPhoneNumber()) && !phoneNumber.trim().equalsIgnoreCase("")) {
            restaurant.setPhoneNumber(phoneNumber);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private boolean editingHomepage(boolean hasToUpdate) {
        String homepage = restaurantView.setHomepage();
        if (!homepage.trim().equalsIgnoreCase(restaurant.getHomepage()) && !homepage.trim().equalsIgnoreCase("")) {
            restaurant.setHomepage(homepage);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private boolean editingEmail(boolean hasToUpdate) {
        String email = restaurantView.setEmail();
        if (!email.trim().equalsIgnoreCase(restaurant.getEmail()) && !email.trim().equalsIgnoreCase("")) {
            restaurant.setEmail(email);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private boolean editingName(boolean hasToUpdate) {
        String name = restaurantView.setName(restaurant.getKindOfRestaurant());
        if (!name.trim().equalsIgnoreCase(restaurant.getName()) && !name.trim().equalsIgnoreCase("")) {
            restaurant.setName(name);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private boolean editingKindOfRestaurant(boolean hasToUpdate) {
        String kindOfRestaurant = restaurantView.setKindOfRestaurant();
        if (!kindOfRestaurant.trim().equalsIgnoreCase(restaurant.getKindOfRestaurant()) && !kindOfRestaurant.trim().equalsIgnoreCase("")) {
            restaurant.setKindOfRestaurant(kindOfRestaurant);
            hasToUpdate = true;
        } else {
            restaurantView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
        return hasToUpdate;
    }

    private void outputMenuOfRestaurant() {
        menuView.setCounterMenu(0);
        restaurantView.printOutput("\t SPEISEKARTE " + restaurant.getName().toUpperCase());
        kindOfMenuController.getKinds().forEach(kindOfMenu -> {
            restaurantView.outputKindForMenuOfRestaurant(kindOfMenu);
            menuController.getMenus().forEach(menu -> {
                if (kindOfMenu.getId() == menu.getKindId()) {
                    menuView.outputMenu(menu);
                    ingredientController.outputInfoIngredients(menu);
                }
            });
        });
    }

    public void selectionProcess() {
        String controlLetter = restaurantView.printSelectionProcess();

        if (controlLetter.equalsIgnoreCase("N")) {
            selectionProcessInput();
        } else if (controlLetter.equalsIgnoreCase("V")) {
            selectionProcessEditing();
        } else if (controlLetter.equalsIgnoreCase("A")) {
            selectionProcessOutput();
        } else if (controlLetter.equalsIgnoreCase("L")) {
            selectionProcessDelete();
        } else if (controlLetter.equalsIgnoreCase("E")) {
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
            menuController.inputMenu();
            selectionProcessInput();
        } else if (controlLetter1.equalsIgnoreCase("I")) {
            String output1 = "\nIn welcher der oben genannten Arten von Speisen wollen sie einem Menü ZUTATEN " +
                    "zuordnen!\n 0. zurück\n";
            String output2 = "Wollen sie weitere Zutaten hinzufügen!";
            String selectionWord = "Input";
            ingredientController.selectKindAndMenuForIngredient(output1, output2, selectionWord);
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
            kindOfMenuController.editingKindOfMenu();
            selectionProcessEditing();
        } else if (controlLetter2.equalsIgnoreCase("M")) {
            menuController.editingMenu();
            selectionProcessEditing();
        } else if (controlLetter2.equalsIgnoreCase("I")) {
            String output1 = "\nIn welcher der oben genannten Arten von Speisen wollen sie in einem Menü ZUTATEN " +
                    "bearbeiten!\n 0. zurück\n";
            String output2 = "Wollen sie weitere Zutaten bearbeiten!";
            String selectionWord = "Editing";
            ingredientController.selectKindAndMenuForIngredient(output1, output2, selectionWord);
            selectionProcessEditing();
        } else if (controlLetter2.equalsIgnoreCase("L")) {
            deliveryServiceController.editingDeliveryService();
            selectionProcessEditing();
        } else if (controlLetter2.equalsIgnoreCase("D")) {
            editingRestaurant();
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
            kindOfMenuController.outputKindsOfMenu();
            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("M")) {
            menuController.outputMenusOfKind();
            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("I")) {
            String output1 = "\nIn welcher der oben genannten Arten von Speisen wollen sie von einem Menü die " +
                    "ZUTATEN ausgeben!\n 0. zurück\n";
            String output2 = "Wollen sie weitere Zutaten ausgeben!";
            String selectionWord = "Output";
            ingredientController.selectKindAndMenuForIngredient(output1, output2, selectionWord);
            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("G")) {
            outputMenuOfRestaurant();
            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("L")) {
            deliveryServiceController.outputDeliveryService();
            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("D")) {
            restaurantView.outputDataRestaurant(restaurant);
            selectionProcessOutput();
        } else if (controlLetter3.equalsIgnoreCase("Z")) {
            selectionProcess();
        } else {
            selectionProcessOutput();
        }
    }

    private void selectionProcessDelete() {
        String controlLetter4 = restaurantView.printSelectionProcessDelete();

        if (controlLetter4.equalsIgnoreCase("A")) {
            menuController.deleteKindOfMenu();
            selectionProcessDelete();
        } else if (controlLetter4.equalsIgnoreCase("M")) {
            String output1 = "\nIn welcher der oben genannten Arten von Speisen wollen sie ein Menü löschen!\n 0. zurück\n";
            String output2 = "Möchten Sie weitere Datensätze löschen!";
            String selectionWord = "DeleteMenu";
            ingredientController.selectKindAndMenuForIngredient(output1, output2, selectionWord);
            selectionProcessDelete();
        } else if (controlLetter4.equalsIgnoreCase("I")) {
            String output1 = "\nIn welcher der oben genannten Arten von Speisen wollen sie ZUTATEN in einem Menü " +
                    "löschen!\n 0. zurück\n";
            String output2 = "Wollen sie weitere Zutaten löschen!";
            String selectionWord = "Delete";
            ingredientController.selectKindAndMenuForIngredient(output1, output2, selectionWord);
            selectionProcessDelete();
        } else if (controlLetter4.equalsIgnoreCase("L")) {
            deliveryServiceController.deleteDeliveryTown();
            selectionProcessDelete();
        } else if (controlLetter4.equalsIgnoreCase("Z")) {
            selectionProcess();
        } else {
            selectionProcessDelete();
        }
    }
}
