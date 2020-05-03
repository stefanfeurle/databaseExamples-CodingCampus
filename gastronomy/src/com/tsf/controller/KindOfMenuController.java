package com.tsf.controller;

import com.tsf.database.models.KindOfMenu;
import com.tsf.database.models.Menu;
import com.tsf.database.models.Restaurant;
import com.tsf.database.repositories.KindOfMenuRepository;
import com.tsf.view.KindOfMenuView;
import java.util.ArrayList;

public class KindOfMenuController {
    private KindOfMenuView kindOfMenuView;
    private KindOfMenuRepository kindOfMenuRepository;

    private ArrayList<KindOfMenu> kinds;
    private ArrayList<KindOfMenu> addKinds = new ArrayList<>();
    private ArrayList<KindOfMenu> updateKinds = new ArrayList<>();
    private ArrayList<KindOfMenu> deleteKinds = new ArrayList<>();

    private int[] idKinds = new int[21];
    private KindOfMenu selectedKind;


    public KindOfMenuController(KindOfMenuView kindOfMenuView, KindOfMenuRepository kindOfMenuRepository, Restaurant restaurant) {
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
        int counter = kindOfMenuView.setCounterOfInputKind();

        for (int i = 0; i < counter; i++) {
            String name = kindOfMenuView.setNameOfInputKind();
            if (!name.trim().equalsIgnoreCase("")) {
                String description = kindOfMenuView.setDescriptionOfInputKind();
                boolean hasSameExtras = kindOfMenuView.setSameExtrasOfInputKind(name);
                addKinds.add(new KindOfMenu(name, description, hasSameExtras));
            }
        }
        if (addKinds.size() > 0) {
            addKinds.forEach(kindOfMenu -> {
                kindOfMenuRepository.create(kindOfMenu);
            });
            saveDataKindOfMenu();
        }
    }

    public void editingKindOfMenu() {
        updateKinds.clear();
        boolean makeFurtherChange = true;

        while (makeFurtherChange) {
            selectedKind = selectKindOfMenu("\nWelche Nummer wollen sie bearbeiten! (0 ... zurück)\n");
            if (selectedKind != null) {
                int selectionNumber = kindOfMenuView.selectData(selectedKind);
                if (selectionNumber == 1) {
                    editingName();
                } else if (selectionNumber == 3) {
                    kindOfMenuView.printOutput("\nDa dies unter Umständen weitreichende Folgen hätte " +
                            "ist dies derzeit nicht möglich!\n");
                } else if (selectionNumber == 2) {
                    editingDescription();
                }
            }
            if (selectedKind != null) {
                makeFurtherChange = kindOfMenuView.askFurtherChange("Wollen sie weiter Arten von Menüs bearbeiten!");
            } else {
                makeFurtherChange = false;
            }
        }
        if (updateKinds.size() > 0) {
            updateKinds.forEach(kindOfMenu -> {
                kindOfMenuRepository.update(kindOfMenu);
            });
            saveDataKindOfMenu();
        }
    }

    private void editingDescription() {
        String description = kindOfMenuView.setDescriptionOfInputKind();
        if (!description.trim().equalsIgnoreCase(selectedKind.getDescription())) {
            selectedKind.setDescription(description);
            updateKinds.add(selectedKind);
        } else {
            kindOfMenuView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    private void editingName() {
        String name = kindOfMenuView.setNameOfInputKind();
        if (!name.trim().equalsIgnoreCase(selectedKind.getName()) && !name.trim().equalsIgnoreCase("")) {
            selectedKind.setName(name);
            updateKinds.add(selectedKind);
        } else {
            kindOfMenuView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    public KindOfMenu selectKindOfMenu(String output) {
        outputKindsOfMenu();
        int selectionNumber = kindOfMenuView.getSelectionKind(output);
        if (selectionNumber == 0) {
            selectedKind = null;
        } else  if (selectionNumber > 0) {
            kinds.forEach(kindOfMenu -> {
                if (idKinds[selectionNumber] == kindOfMenu.getId()) {
                    selectedKind = kindOfMenu;
                }
            });
        }
        return selectedKind;
    }

    public void deleteKindOfMenu(ArrayList<Menu> menus) {
        deleteKinds.clear();
        boolean makeFurtherDelete = true;
        while (makeFurtherDelete) {
            selectedKind = selectKindOfMenu("\nWelche Nummer wollen sie löschen! (0 ... zurück)\n");
            if (selectedKind != null) {
                boolean hasMenus = false;
                for (Menu menu : menus) {
                    if (menu.getKindId() == selectedKind.getId()) {
                        hasMenus = true;
                    }
                }
                if (hasMenus) {
                  kindOfMenuView.printOutput("\nDiese Art von Speisen hat noch Menüs! Sie müssen zuerst die Menüs " +
                          "löschen bevor sie die \nArt von Speisen (" + selectedKind.getName().toUpperCase() +
                          ") löschen können.\n");
                } else {
                    boolean areYouSure = kindOfMenuView.askFurtherChange("Sind sie sicher, dass sie " +
                            selectedKind.getName().toUpperCase() + " als Art von Menüs löschen möchten!\nJ ... ja\nN ... nein\n");
                    if (areYouSure) {
                        deleteKinds.add(selectedKind);
                        kinds.remove(selectedKind);
                    }
                }
                makeFurtherDelete = kindOfMenuView.askFurtherChange
                        ("\nMöchten Sie weitere Datensätze löschen!\nJ ... ja\nN ... nein\n");
            }
        }
        if (deleteKinds.size() > 0) {
            deleteKinds.forEach(kindOfMenu -> {
                kindOfMenuRepository.delete(kindOfMenu);
            });
            saveDataKindOfMenu();
        }
    }

    public void outputKindsOfMenu() {
        kindOfMenuView.setCounterKind(0);
        kinds.forEach(kindOfMenu -> {
            int counterKind = kindOfMenuView.outputKind(kindOfMenu);
            idKinds[counterKind] = kindOfMenu.getId();
        });
    }

    public ArrayList<KindOfMenu> getKinds() {
        return kinds;
    }
}
