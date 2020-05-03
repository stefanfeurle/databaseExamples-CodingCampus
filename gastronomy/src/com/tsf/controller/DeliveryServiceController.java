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

    private ArrayList<DeliveryService> deliveryTowns;
    private ArrayList<DeliveryService> addDeliveryTowns = new ArrayList<>();
    private ArrayList<DeliveryService> updateDeliveryTowns = new ArrayList<>();
    private ArrayList<DeliveryService> deleteDeliveryTowns = new ArrayList<>();

    private int[] postcodes = new int[101];
    private DeliveryService selectedTown;


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
        int counter = deliveryServiceView.setCounterOfInputTown();
        for (int i = 0; i < counter; i++) {
            String town = deliveryServiceView.setTownOfInputTown();
            if (!town.trim().equalsIgnoreCase("")) {
                int postCode = deliveryServiceView.setPostCodeOfInputTown();
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
                    double minimumOrderValue = deliveryServiceView.setMinimumOrderValueOfInputTown();
                    double price = deliveryServiceView.setPriceOfInputTown();
                    double discountOrderValue = deliveryServiceView.setDiscountOrderValueOfInputTown();
                    double discountPrice = 0;
                    if (discountOrderValue <= minimumOrderValue) {
                        discountOrderValue = 0;
                    } else {
                        discountPrice = deliveryServiceView.setDiscountPriceOfInputTown();
                        if (discountPrice >= price) {
                            discountOrderValue = 0;
                        }
                    }
                    addDeliveryTowns.add(new DeliveryService(postCode, town, minimumOrderValue, price,
                            discountOrderValue, discountPrice, restaurant.getCompanyBookNumber()));
                } else {
                    System.out.println("\nDiese Postleitzahl existiert schon!");
                    town = "";
                }
            }
        }
        if (addDeliveryTowns.size() > 0) {
            addDeliveryTowns.forEach(deliveryService -> {
                deliveryServiceRepository.create(deliveryService);
            });
            saveDataDeliveryService();
        }
    }

    public void outputDeliveryService() {
        deliveryServiceView.setCounterTown(0);
        deliveryTowns.forEach(deliveryService -> {
            int counterTown = deliveryServiceView.outputTown(deliveryService);
            postcodes[counterTown] = deliveryService.getPostcode();
        });
    }

    public DeliveryService selectionTown(String output) {
        int selectionNumber = deliveryServiceView.getSelectionTown(output);
        if (selectionNumber == 0) {
            selectedTown = null;
        } else  if (selectionNumber > 0) {
            deliveryTowns.forEach(deliveryService -> {
                if (postcodes[selectionNumber] == deliveryService.getPostcode()) {
                    selectedTown = deliveryService;
                }
            });
        }
        return selectedTown;
    }

    public void editingDeliveryService() {
        updateDeliveryTowns.clear();
        boolean makeFurtherChange = true;

        while (makeFurtherChange) {
            outputDeliveryService();
            selectedTown = selectionTown("\nWelchen Datensatz vom Lieferservice möchten sie bearbeiten!\n0 ... zurück\n");
            if (selectedTown != null) {
                int selectionNumber = -1;
                while (selectionNumber != 0) {
                    selectionNumber = deliveryServiceView.selectData(selectedTown);
                    if (selectionNumber == 2) {
                        editingTown();
                    } else if (selectionNumber == 1) {
                        deliveryServiceView.printOutput("Dieser Datensatz kann nicht bearbeitet werden, sondern nur gelöscht!");
                    } else if (selectionNumber == 3) {
                        editingMinimumOrderValue();
                    } else if (selectionNumber == 4) {
                        editingPrice();
                    } else if (selectionNumber == 5) {
                        editingDiscountOrderValue();
                    } else if (selectionNumber == 6) {
                        editingDiscountPrice();
                    }
                    makeFurtherChange = deliveryServiceView.askFurtherAction
                            ("\nWollen sie noch ihren Lieferservice bearbeiten!\nJ ... ja\nN ... nein\n");
                    if (!makeFurtherChange) {
                        selectionNumber = 0;
                        selectedTown = null;
                    }
                }
            } else {
                makeFurtherChange = false;
            }
        }
        if (updateDeliveryTowns.size() > 0) {
            updateDeliveryTowns.forEach(deliveryService -> {
                deliveryServiceRepository.update(deliveryService);
            });
            saveDataDeliveryService();
        }
    }

    private void editingDiscountPrice() {
        double discountPrice = deliveryServiceView.setDiscountPriceOfInputTown();
        if (discountPrice >= selectedTown.getPrice()) {
            selectedTown.setDiscountOrderValue(0);
            selectedTown.setDiscountPrice(0);
            deliveryServiceView.printOutput("\nDer Rabattpreis war höher als der Normalpreis!\n" +
                    "(Rabattbestellwertgrenze und Rabattpreis wurden auf Null gesetzt!)");
        }
        if (selectedTown.getDiscountOrderValue() == 0) {
            discountPrice = 0;
            deliveryServiceView.printOutput("\nBitte zuerst die Rabattbestellwertgrenze definieren!\n");
        }
        if (discountPrice != selectedTown.getDiscountPrice()) {
            selectedTown.setDiscountPrice(discountPrice);
            updateDeliveryTowns.add(selectedTown);
        } else {
            deliveryServiceView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    private void editingDiscountOrderValue() {
        double discountOrderValue = deliveryServiceView.setDiscountOrderValueOfInputTown();
        if (discountOrderValue <= selectedTown.getMinimumOrderValue()) {
            discountOrderValue = 0;
            selectedTown.setDiscountPrice(0);
            deliveryServiceView.printOutput("\nDie Rabattbestellwertgrenze war niedriger als der Mindestbestellwert!" +
                    "\n(Rabattbestellwertgrenze und Rabattpreis wurden auf Null gesetzt!)\n");
        }
        if (discountOrderValue != selectedTown.getDiscountOrderValue()) {
            selectedTown.setDiscountOrderValue(discountOrderValue);
            updateDeliveryTowns.add(selectedTown);
        } else {
            deliveryServiceView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    private void editingPrice() {
        double price = deliveryServiceView.setPriceOfInputTown();
        if (price != selectedTown.getPrice()) {
            selectedTown.setPrice(price);
            updateDeliveryTowns.add(selectedTown);
        } else {
            deliveryServiceView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    private void editingMinimumOrderValue() {
        double minimumOrderValue = deliveryServiceView.setMinimumOrderValueOfInputTown();
        if (minimumOrderValue != selectedTown.getMinimumOrderValue()) {
            selectedTown.setMinimumOrderValue(minimumOrderValue);
            updateDeliveryTowns.add(selectedTown);
        } else {
            deliveryServiceView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    private void editingTown() {
        String town = deliveryServiceView.setTownOfInputTown();
        if (!town.trim().equalsIgnoreCase(selectedTown.getTown()) && !town.trim().equalsIgnoreCase("")) {
            selectedTown.setTown(town);
            updateDeliveryTowns.add(selectedTown);
        } else {
            deliveryServiceView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    public void deleteDeliveryTown() {
        deleteDeliveryTowns.clear();
        boolean makeFurtherDeletes = true;

        while (makeFurtherDeletes) {
            outputDeliveryService();
            selectedTown = selectionTown("\nWelchen Datensatz vom Lieferservice möchten sie löschen!\n0 ... zurück\n");
            if (selectedTown != null) {
                boolean areYouSure = deliveryServiceView.askFurtherAction("Sind sie sicher, dass sie " +
                        selectedTown.getTown().toUpperCase() + " als Lieferort löschen möchten!\nJ ... ja\nN ... nein\n");
                if (areYouSure) {
                    deleteDeliveryTowns.add(selectedTown);
                    deliveryTowns.remove(selectedTown);
                }
                makeFurtherDeletes = deliveryServiceView.askFurtherAction
                        ("Möchten Sie weitere Datensätze löschen!\nJ ... ja\nN ... nein\n");
            } else {
                makeFurtherDeletes = false;
            }
        }
        if (deleteDeliveryTowns.size() > 0) {
            deleteDeliveryTowns.forEach(deliveryService -> {
                deliveryServiceRepository.delete(deliveryService);
            });
            saveDataDeliveryService();
        }
    }
}
