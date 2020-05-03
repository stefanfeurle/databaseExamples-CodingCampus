package com.tsf;

import com.tsf.controller.RestaurantController;
import com.tsf.database.repositories.RestaurantRepository;
import com.tsf.view.RestaurantView;

public class Main {

    public static void main(String[] args) {

        RestaurantView restaurantView = new RestaurantView();
        RestaurantRepository restaurantRepository = new RestaurantRepository(restaurantView);
        RestaurantController restaurantController = new RestaurantController(restaurantView, restaurantRepository);

        restaurantController.startGastro();
    }
}

