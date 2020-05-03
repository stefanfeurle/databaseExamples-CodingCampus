package com.tsf.controller;

import com.tsf.database.models.KindOfMenu;
import com.tsf.database.models.Menu;
import com.tsf.database.repositories.MenuRepository;
import com.tsf.view.MenuView;
import java.util.ArrayList;

public class MenuController {
    private MenuView menuView;
    private MenuRepository menuRepository;
    private KindOfMenuController kindOfMenuController ;

    private ArrayList<Menu> menus;
    private ArrayList<Menu> addMenus = new ArrayList<>();
    private ArrayList<Menu> updateMenus = new ArrayList<>();

    private KindOfMenu selectedKind;
    private int[] idMenus = new int[100];
    private Menu selectedMenu;

    public MenuController(MenuView menuView, MenuRepository menuRepository,  KindOfMenuController kindOfMenuController) {
        this.menuView = menuView;
        this.menuRepository = menuRepository;
        this.kindOfMenuController = kindOfMenuController;
    }

    public void saveDataMenu() {
        menus = menuRepository.findAll();
        if (menus == null) {
            System.out.println("Update Menu failed");
        } else {
            System.out.println("Update Data Menu successful!");
        }
    }

    public void inputMenu() {
        addMenus.clear();
        boolean isFirstRUn = true;
        while (selectedKind != null || isFirstRUn) {
            String output = "";
            if (isFirstRUn) {
                output = "\nWelcher Nummer der oben genannten Arten von Speisen wollen sie ihr Menü (Speise) zuordnen!\n 0. zurück\n";
            } else {
                output = "\nWollen sie weitere Menüs eingeben!\nWenn ja, von welcher der oben genannten Arten von Speisen!\n 0. zurück\n";
            }
            isFirstRUn = false;
            selectedKind = kindOfMenuController.selectKindOfMenu(output);
            if (selectedKind != null) {
                int counter = menuView.setCounterOfInputMenu(selectedKind);
                for (int i = 0; i < counter; i++) {
                    String name = menuView.setNameOfInputMenu();
                    if (!name.trim().equalsIgnoreCase("")) {
                        String description = menuView.setDescriptionOfInputMenu();
                        double price = menuView.setPriceOfInputMenu(name);
                        addMenus.add(new Menu(name, description, price, selectedKind.getId()));
                    }
                }
            }
        }
        if (addMenus.size() > 0) {
            addMenus.forEach(Menu1 -> {
                menuRepository.create(Menu1);
            });
            saveDataMenu();
        }
    }

    public void outputMenusOfKind() {
        String output = "\nVon welcher Nummer der oben genannten Arten von Speisen wollen sie ihr Menü ausgeben!\n0 ... zurück\n";
        selectedKind = kindOfMenuController.selectKindOfMenu(output);
        if (selectedKind != null) {
            menuView.setCounterMenu(0);
            menus.forEach(menu -> {
                if (selectedKind.getId() == menu.getKindId()) {
                    int counterKind = menuView.outputMenu(menu);
                    idMenus[counterKind] = menu.getId();
                }
            });
        }
    }

    public void editingMenu() {
        updateMenus.clear();
        String output = "\nWollen sie noch ein Menü bearbeiten!\nJ ... ja\nN ... nein\n";
        boolean makeFurtherChange;
        boolean isFirstRunKind = true;
        while ((selectedKind != null || isFirstRunKind) ) {
            isFirstRunKind = false;
            String output1 = "\nIn welcher der oben genannten Arten von Speisen wollen sie ein Menü bearbeiten!\n 0. zurück\n";
            selectedKind = kindOfMenuController.selectKindOfMenu(output1);
            if (selectedKind != null) {
                boolean isFirstRunMenu = true;
                while (selectedMenu != null || isFirstRunMenu) {
                    isFirstRunMenu = false;
                    selectedMenu = selectMenu(selectedKind);
                    if (selectedMenu != null) {
                        int selectionNumber = -1;
                        while (selectionNumber != 0) {
                            selectionNumber = menuView.selectData(selectedMenu);
                            if (selectionNumber == 1) {
                                editingName();
                            } else if (selectionNumber == 2) {
                                editingDescription();
                            } else if (selectionNumber == 3) {
                                editingPrice();
                            }
                            makeFurtherChange = menuView.askFurtherAction(output);
                            if (!makeFurtherChange) {
                                selectionNumber = 0;
                                selectedMenu = null;
                                selectedKind = null;
                            }
                        }
                    }
                }
                if (selectedKind != null) {
                    makeFurtherChange = menuView.askFurtherAction(output);
                    if (!makeFurtherChange) {
                        selectedMenu = null;
                        selectedKind = null;
                    }
                }
            }
        }
        if (updateMenus.size() > 0) {
            updateMenus.forEach(menu -> {
                menuRepository.update(menu);
            });
            saveDataMenu();
        }
    }

    public void editingPrice() {
        double price = menuView.setPriceOfInputMenu(selectedMenu.getName());
        if (price != selectedMenu.getPrice()) {
            selectedMenu.setPrice(price);
           updateMenus.add(selectedMenu);
        } else {
            menuView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    public void editingDescription() {
        String description = menuView.setDescriptionOfInputMenu();
        if (!description.trim().equalsIgnoreCase(selectedMenu.getDescription())) {
            selectedMenu.setDescription(description);
            updateMenus.add(selectedMenu);
        } else {
            menuView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
     }

    public void editingName() {
        String name = menuView.setNameOfInputMenu();
        if (!name.trim().equalsIgnoreCase(selectedMenu.getName()) && !name.trim().equalsIgnoreCase("")) {
            selectedMenu.setName(name);
            updateMenus.add(selectedMenu);
        } else {
            menuView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    public Menu selectMenu(KindOfMenu selectedKind) {
        menuView.setCounterMenu(0);
        menus.forEach(menu -> {
            if (selectedKind.getId() == menu.getKindId()) {
                int counterMenu = menuView.outputMenu(menu);
                idMenus[counterMenu] = menu.getId();
            }
        });
        int selectionNumber = menuView.getSelectionMenu("\nWählen sie ein Menü aus!\n0 ... zurück\n");
        if (selectionNumber == 0) {
            selectedMenu = null;
        } else  if (selectionNumber > 0) {
            menus.forEach(menu -> {
                if (idMenus[selectionNumber] == menu.getId()) {
                    selectedMenu = menu;
                }
            });
        }
        return selectedMenu;
    }

    public ArrayList<Menu> getMenus() {
        return menus;
    }

    public void deleteKindOfMenu() {
        kindOfMenuController.deleteKindOfMenu(menus);
    }

    public void deleteMenu(ArrayList<Menu> deleteMenus) {
        if (deleteMenus.size() > 0) {
            for (Menu menu : deleteMenus) {
                menuRepository.delete(menu);
            }
            saveDataMenu();
        }
    }
}
