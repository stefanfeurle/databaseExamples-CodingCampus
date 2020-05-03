package com.tsf.controller;

import com.tsf.database.models.*;
import com.tsf.database.repositories.IngredientRepository;
import com.tsf.view.IngredientView;;
import java.util.ArrayList;

public class IngredientController {
    private IngredientView ingredientView;
    private IngredientRepository ingredientRepository;
    private KindOfMenuController kindOfMenuController;
    private MenuController menuController;

    private ArrayList<Ingredient> ingredients;
    private ArrayList<Ingredient> addIngredients = new ArrayList<>();
    private ArrayList<Ingredient> updateIngredients = new ArrayList<>();
    private ArrayList<Ingredient> deleteIngredients = new ArrayList<>();
    private ArrayList<Menu> deleteMenus = new ArrayList<>();

    private KindOfMenu selectedKind;
    private Menu selectedMenu;
    private Ingredient selectedIngredient;
    private int[] idIngredients = new int[100];

    private ArrayList<Ingredient> addableIngredients = new ArrayList<>();
    private int addableMenuId;


    public IngredientController(IngredientView ingredientView, IngredientRepository ingredientRepository,
                                 KindOfMenuController kindOfMenuController, MenuController menuController) {
        this.ingredientView = ingredientView;
        this.ingredientRepository = ingredientRepository;
        this.kindOfMenuController = kindOfMenuController;
        this.menuController = menuController;
    }

    public void saveDataIngredient() {
        ingredients = ingredientRepository.findAll();
        if (ingredients == null) {
            System.out.println("Update Ingredient failed");
        } else {
            System.out.println("Update Data Ingredient successful!");
        }
    }

    public void selectKindAndMenuForIngredient(String output, String output1, String selectionWord) {
        addIngredients.clear();
        updateIngredients.clear();
        deleteIngredients.clear();
        deleteMenus.clear();
        boolean makeFurtherInput;
        //Selection of Kind
        boolean isFirstRunKind = true;
        while (selectedKind != null || isFirstRunKind) {
            isFirstRunKind = false;
            selectedKind = kindOfMenuController.selectKindOfMenu(output);
            //Selection of Menu
            if (selectedKind != null) {
                boolean isFirstRunMenu = true;
                while (selectedMenu != null || isFirstRunMenu) {
                    isFirstRunMenu = false;
                    selectedMenu = menuController.selectMenu(selectedKind);
                    if (selectedMenu != null) {
                        if (selectionWord.equalsIgnoreCase("Input")) {
                            inputIngredient(); //Input of Ingredient
                        } else if (selectionWord.equalsIgnoreCase("Output")) {
                            outputForViewIngredientsOfMenu(); //Output of Ingredient
                        } else if (selectionWord.equalsIgnoreCase("Editing")) {
                            editingIngredient(); //Editing of Ingredient
                        } else if (selectionWord.equalsIgnoreCase("Delete")) {
                            deleteIngredient();  //Delete of Ingredient
                        } else if (selectionWord.equalsIgnoreCase("DeleteMenu")) {
                            deleteMenu();
                        }
                    }
                    makeFurtherInput = ingredientView.askFurtherAction(output1);
                    if (!makeFurtherInput) {
                        selectedMenu = null;
                        selectedKind = null;
                    }
                }
            }
        }
        saveDataInput();
        saveDataEditing();
        saveDataDelete();
        menuController.deleteMenu(deleteMenus);
    }

    private void saveDataDelete() {
        if (deleteIngredients.size() > 0) {
            deleteIngredients.forEach(ingredient -> {
                ingredientRepository.delete(ingredient);
            });
            saveDataIngredient();
            deleteIngredients.clear();
        }
    }

    private void saveDataEditing() {
        if (updateIngredients.size() > 0) {
            updateIngredients.forEach(ingredient -> {
                ingredientRepository.update(ingredient);
            });
            saveDataIngredient();
            updateIngredients.clear();
        }
    }

    private void saveDataInput() {
        if (addIngredients.size() > 0) {
            addIngredients.forEach(ingredient -> {
                ingredientRepository.create(ingredient);
            });
            saveDataIngredient();
            addIngredients.clear();
        }
    }

    public void inputIngredient() {
        int selectionNumber = ingredientView.selectInputIngredient(selectedMenu);
        if (selectionNumber > 0 && selectionNumber < 4) {
            outputForViewIngredientsOfMenu();
            int counter = ingredientView.setCounterOfInputIngredient();
            for (int i = 0; i < counter; i++) {
                String name = ingredientView.setNameOfInputIngredient(selectionNumber);
                boolean isRemovable = false;
                boolean isAddable = false;
                double price = 0;
                if (!name.trim().equalsIgnoreCase("")) {
                    if (selectionNumber == 2) {isRemovable = true;}
                    if (selectionNumber == 3) {
                        isAddable = true;
                        price = ingredientView.setPriceOfInputIngredient();
                    }
                    if (addableIngredients.size() > 0 && selectionNumber == 3) {
                        addIngredients.add(new Ingredient(name, price, false, true, addableMenuId));
                    } else {
                        addIngredients.add(new Ingredient(name, price, isRemovable, isAddable, selectedMenu.getId()));
                    }
                }
            }
        }
    }

    private void deleteIngredient() {
        selectionOfIngredient("\nWelche Zutat möchten sie löschen!\n0 ... zurück\n");
        if (selectedIngredient != null) {
            boolean areYouSure = ingredientView.askFurtherAction("Sind sie sicher, dass sie \"" +
                    selectedIngredient.getName().toUpperCase() + "\" als Zutat dieses Menüs löschen möchten!");
            if (areYouSure) {
                deleteIngredients.add(selectedIngredient);
                ingredients.remove(selectedIngredient);
            }
        }
    }

    private boolean checkSameIngredient(String output) {
        boolean hasSameExtras = false;
        if (selectedKind.getHasSameExtras()) {
            hasSameExtras = true;
            addableIngredients.clear();
            if (!output.equalsIgnoreCase("")) {
                ingredientView.printOutput(output);
            }
            menuController.getMenus().forEach(menu -> {
                ingredients.forEach(ingredient -> {
                    if (menu.getKindId() == selectedKind.getId() && ingredient.isAddable() && ingredient.getMenuId() == menu.getId()) {
                        addableIngredients.add(ingredient);
                        addableMenuId = ingredient.getMenuId();
                    }
                });
            });
            menuController.getMenus().forEach(menu -> {
                addIngredients.forEach(ingredient -> {
                    if (menu.getKindId() == selectedKind.getId() && ingredient.isAddable() && ingredient.getMenuId() == menu.getId()) {
                        addableIngredients.add(ingredient);
                        addableMenuId = ingredient.getMenuId();
                    }
                });
            });
        }
        return hasSameExtras;
    }

    public void outputForViewIngredientsOfMenu() {
        ingredientView.printOutput("\n" + selectedMenu.getName().toUpperCase());
        boolean hasIngredients = outputInfoIngredients(selectedMenu);
        hasIngredients = outputRemovableIngredients(hasIngredients);
        hasIngredients = outputAddableIngredients(hasIngredients);
        if (!hasIngredients) {
            ingredientView.printOutput("Keine Zutaten vorhanden!");
        }
    }

    private boolean outputAddableIngredients(boolean hasIngredients) {
        boolean hasSameExtras = checkSameIngredient("\nDiese hinzufügbaren Zutaten werden für alle Menüs dieser Art (" +
                selectedKind.getName().toUpperCase() + ") verwendet!!");
        boolean isFirstRun = true;
        int counterIngredient = 0;
        if (hasSameExtras) {
            for (Ingredient ingredient : addableIngredients) {
                if (addableMenuId == ingredient.getMenuId() && !ingredient.isRemovable() && ingredient.isAddable()) {
                    hasIngredients = true;
                    if (isFirstRun) {
                        ingredientView.printOutput("\t\tHinzufügbare Zutaten:");
                        isFirstRun = false;
                    }
                    counterIngredient++;
                    String name = ingredient.getName();
                    while (name.length() < 30) {
                        name += " ";
                    }
                    if (counterIngredient < 10) {
                        ingredientView.printOutput("\t\t\t " + counterIngredient + ". " + name + "\t\t" + String.format("%.2f", ingredient.getPrice()) + " €");
                    } else {
                        ingredientView.printOutput("\t\t\t" + counterIngredient + ". " + name + "\t\t" + String.format("%.2f", ingredient.getPrice()) + " €");
                    }
                }
            }
        } else {
            for (Ingredient ingredient : ingredients) {
                if (selectedMenu.getId() == ingredient.getMenuId() && !ingredient.isRemovable() && ingredient.isAddable()) {
                    hasIngredients = true;
                    if (isFirstRun) {
                        ingredientView.printOutput("\t\tHinzufügbare Zutaten:");
                        isFirstRun = false;
                    }
                    counterIngredient++;
                    String name = ingredient.getName();
                    while (name.length() < 30) {
                        name += " ";
                    }
                    if (counterIngredient < 10) {
                        ingredientView.printOutput( "\t\t\t " + counterIngredient + ". " + name + "\t\t" + String.format("%.2f", ingredient.getPrice()) + " €");
                    } else {
                        ingredientView.printOutput("\t\t\t" + counterIngredient + ". " + name + "\t\t" + String.format("%.2f", ingredient.getPrice()) + " €");
                    }
                }
            }
        }
        return hasIngredients;
    }

    private boolean outputRemovableIngredients(boolean hasIngredients) {
        boolean isFirstRun = true;
        int counterIngredient = 0;
        for (Ingredient ingredient : ingredients) {
            if (selectedMenu.getId() == ingredient.getMenuId() && ingredient.isRemovable() && !ingredient.isAddable()) {
                hasIngredients = true;
                if (isFirstRun) {
                    ingredientView.printOutput("\t\tEntfernbare Zutaten:");
                    isFirstRun = false;
                }
                counterIngredient++;
                if (counterIngredient < 10) {
                    ingredientView.printOutput("\t\t\t " + counterIngredient + ". " + ingredient.getName());
                } else {
                    ingredientView.printOutput("\t\t\t" + counterIngredient + ". " + ingredient.getName());
                }
            }
        }
        return hasIngredients;

    }

    public boolean outputInfoIngredients(Menu selectedMenu) {
        boolean hasIngredients = false;
        boolean isFirstRun = true;
        int counterIngredient = 0;
        for (Ingredient ingredient : ingredients) {
            if (selectedMenu.getId() == ingredient.getMenuId() && !ingredient.isRemovable() && !ingredient.isAddable()) {
                hasIngredients = true;
                if (isFirstRun) {
                    ingredientView.printOutput("\t\tZutaten zur reinen Info:");
                    isFirstRun = false;
                }
                counterIngredient++;
                if (counterIngredient < 10) {
                    ingredientView.printOutput("\t\t\t " + counterIngredient + ". " + ingredient.getName());
                } else {
                    ingredientView.printOutput("\t\t\t" + counterIngredient + ". " + ingredient.getName());
                }
            }
        }
        return hasIngredients;
    }

    private void editingIngredient() {
        selectionOfIngredient("\nWählen sie die zu bearbeitende Zutat aus!\n0 ... zurück\n");
        if (selectedIngredient != null) {
            if (selectedIngredient.isAddable() && !selectedIngredient.isRemovable()) {
                String selectionLetter = ingredientView.selectData(selectedIngredient);
                if (selectionLetter.equalsIgnoreCase("P")) {
                    editingPrice();
                } else if (selectionLetter.equalsIgnoreCase("N")) {
                   editingName();
                }
            } else {
                ingredientView.printOutput("\nBei dieser Zutat ist nur der Name änderbar!");
                editingName();
            }
        }
    }

    private void selectionOfIngredient(String output) {
        ingredientView.setCounterIngredient(0);
        for (Ingredient ingredient : ingredients) {
            if (ingredient.getMenuId() == selectedMenu.getId()) {
                int counterIngredient = ingredientView.outputIngredients(ingredient);
                idIngredients[counterIngredient] = ingredient.getId();
            }
        }
        boolean hasSameExtras = checkSameIngredient("\nDiese hinzufügbaren Zutaten werden für alle Menüs dieser Art (" +
                selectedKind.getName().toUpperCase() + ") verwendet!!");
        if (hasSameExtras && addableIngredients.size() > 0 && addableMenuId != selectedMenu.getId()) {
            for (Ingredient ingredient: addableIngredients) {
                int counterIngredient = ingredientView.outputIngredients(ingredient);
                idIngredients[counterIngredient] = ingredient.getId();
            }
        }
        int selectionNumber = 0;
        if (ingredientView.getCounterIngredient() > 0) {
            selectionNumber = ingredientView.getSelectionIngredient(output);
        } else {
            ingredientView.printOutput("Keine Zutaten vorhanden!");        }
        if (selectionNumber == 0) {
            selectedIngredient = null;
        } else {
            for (Ingredient ingredient : ingredients) {
                if (idIngredients[selectionNumber] == ingredient.getId()) {
                    selectedIngredient = ingredient;
                }
            }
        }
    }

    private void editingName() {
        String name = ingredientView.setNewNameIngredient();
        if (!name.trim().equalsIgnoreCase(selectedIngredient.getName()) && !name.trim().equalsIgnoreCase("")) {
            selectedIngredient.setName(name);
            updateIngredients.add(selectedIngredient);
        } else {
            ingredientView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    private void editingPrice() {
        double price = ingredientView.setPriceOfInputIngredient();
        if (price != selectedIngredient.getPrice()) {
            selectedIngredient.setPrice(price);
            updateIngredients.add(selectedIngredient);
        } else {
            ingredientView.printOutput("\nDaten wurden nicht gespeichert!\n");
        }
    }

    public void deleteMenu() {
        if (selectedKind.getHasSameExtras()) {
            int replacementMenuId = -1;
            checkSameIngredient("");
            if (addableMenuId == selectedMenu.getId()) {
                for (Menu menu : menuController.getMenus()) {
                    if (menu.getKindId() == selectedMenu.getKindId() && menu.getId() != selectedMenu.getId()) {
                        replacementMenuId = menu.getId();
                    }
                }
            }
            if (replacementMenuId != -1) {
                for (Ingredient ingredient : addableIngredients) {
                    deleteIngredients.add(ingredient);
                    ingredients.remove(ingredient);
                    Ingredient clonedIngredient =  new Ingredient(ingredient.getName(), ingredient.getPrice(),
                            false, true, replacementMenuId);
                    addIngredients.add(clonedIngredient);
                }
            }
        }
        boolean hasIngredients = false;
        for (Ingredient ingredient : ingredients) {
            if (ingredient.getMenuId() == selectedMenu.getId()) {
                hasIngredients = true;
            }
        }
        if (hasIngredients) {
            ingredientView.printOutput("\nDieses Menü hat noch Zutaten! Sie müssen zuerst die Zutaten " +
                    "löschen bevor sie dieses \nMenü (" + selectedMenu.getName().toUpperCase() + ") löschen können.\n");
        } else {
            boolean areYouSure = ingredientView.askFurtherAction("Sind sie sicher, dass sie " +
                    selectedMenu.getName().toUpperCase() + " als Menü löschen möchten!");
            if (areYouSure) {
                deleteMenus.add(selectedMenu);
                menuController.getMenus().remove(selectedMenu);
            }
        }
    }
}
