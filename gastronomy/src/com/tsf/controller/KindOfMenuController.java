package com.tsf.controller;

import com.tsf.database.models.KindOfMenu;
import com.tsf.database.models.Restaurant;
import com.tsf.database.repositories.KindOfMenuRepository;
import com.tsf.view.KindOfMenuView;

import java.util.ArrayList;

public class KindOfMenuController {
    private KindOfMenuView kindOfMenuView;
    private KindOfMenuRepository kindOfMenuRepository;
    private Restaurant restaurant;

    private ArrayList<KindOfMenu> kinds;
    private ArrayList<KindOfMenu> addKinds = new ArrayList<>();


    public KindOfMenuController(Restaurant restaurant, KindOfMenuView kindOfMenuView, KindOfMenuRepository kindOfMenuRepository) {
        this.restaurant = restaurant;
        this.kindOfMenuView = kindOfMenuView;
        this.kindOfMenuRepository = kindOfMenuRepository;
    }

    public void saveDataKindOfMenu() {
        kinds = kindOfMenuRepository.findAll();
        if (kinds == null) {
            System.out.println("Updata Data Delivery failed");
        } else {
            System.out.println("Update Data Kind of Menu successful!");
        }
    }

    public void inputKindOfMenu() {
        addKinds.clear();
        int counter = kindOfMenuView.getCounterOfInputKind();

        for (int i = 0; i < counter; i++) {
            String name = kindOfMenuView.getNameOfInputKind();
            if (!name.equalsIgnoreCase("")) {
                String description = kindOfMenuView.getDescriptionOfInputKind();
                boolean sameExtras = kindOfMenuView.getSameExtrasOfInputKind(name);
                addKinds.add(new KindOfMenu(name, description, sameExtras));
            }
        }
        if (addKinds.size() > 0) {
            addKinds.forEach(kindOfMenu1 -> {
                kindOfMenuRepository.create(kindOfMenu1);
            });
            saveDataKindOfMenu();
        }
    }
}
