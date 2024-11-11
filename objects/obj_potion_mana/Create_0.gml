/// @description Insert description here
// You can write your code in this editor
// Ensure the potion recipes are loaded
if (!is_array(global.potion_recipes) || array_length(global.potion_recipes) == 0) {
    show_message("Potion recipes not loaded.");
    return;
}

// Find the Healing Potion recipe
var potion_name = "Mana Potion";
var recipe;
for (var i = 0; i < array_length(global.potion_recipes); i++) {
    if (global.potion_recipes[i].name == potion_name) {
        recipe = global.potion_recipes[i];
        break;
    }
}

// Check if recipe exists
if (is_undefined(recipe)) {
    show_message("Potion recipe not found: " + potion_name);
    return;
}

// Check ingredients
var can_craft = true;
for (var i = 0; i < array_length(recipe.ingredients); i++) {
    var ingredient = recipe.ingredients[i];
    if (global.inventory[ingredient.item] < ingredient.amount) {
        can_craft = false;
        show_message("Not enough " + ingredient.item + " to craft " + recipe.name + ".");
        break;
    }
}

// Craft if ingredients are sufficient
if (can_craft) {
    for (var i = 0; i < array_length(recipe.ingredients); i++) {
        var ingredient = recipe.ingredients[i];
        global.inventory[ingredient.item] -= ingredient.amount;
    }
    global.inventory[recipe.output] += 1;
    show_message("Crafted 1 " + recipe.name + "!");
}
