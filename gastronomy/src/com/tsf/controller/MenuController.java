package com.tsf.controller;


import com.tsf.database.models.DeliveryService;
import com.tsf.database.models.Menu;
import com.tsf.database.models.Restaurant;
import com.tsf.database.repositories.MenuRepository;
import com.tsf.view.MenuView;

import java.util.ArrayList;

public class MenuController {
    private MenuView menuView;
    private MenuRepository menuRepository;
    private Restaurant restaurant;
    ArrayList<Menu> menus;
    ArrayList<DeliveryService> addMenus = new ArrayList<>();

    public MenuController(MenuView menuView, MenuRepository menuRepository, Restaurant restaurant) {
        this.menuView = menuView;
        this.menuRepository = menuRepository;
        this.restaurant = restaurant;
    }

    public void saveDataMenu() {
        menus = menuRepository.findAll();
        if (menus == null) {
            System.out.println("Update Menu failed");
        } else {
            System.out.println("Update Data Menu successful!");
        }
    }


}
