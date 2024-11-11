/// scr_craft_attack_potion
// Script to craft the "Attack Potion"

// Set up potion name and recipe variables
var potion_name = "Attack Potion";
var crafted = false;
var recipe = undefined;

// Ensure potion recipes are available
if (!is_array(global.potion_recipes) || array_length(global.potion_recipes) == 0) {
    show_message("Potion recipes not available. Ensure the game is fully initialized.");
    return;
}

// Locate the recipe for the specified potion
for (var i = 0; i < array_length(global.potion_recipes); i++) {
    if (global.potion_recipes[i].name == potion_name) {
        recipe = global.potion_recipes[i];
        break;
    }
}

// Check if recipe was found
if (is_undefined(recipe)) {
    show_message("Potion recipe for " + potion_name + " not found.");
    return;
}

// Check if there are enough ingredients
var can_craft = true;

if (global.inventory[recipe.food_required] < recipe.food_amount) {
    show_message("Not enough " + recipe.food_required + " to craft " + potion_name + ".");
    can_craft = false;
}
if (global.inventory[recipe.ore_required] < recipe.ore_amount) {
    show_message("Not enough " + recipe.ore_required + " to craft " + potion_name + ".");
    can_craft = false;
}
if (global.inventory[recipe.wood_required] < recipe.wood_amount) {
    show_message("Not enough " + recipe.wood_required + " to craft " + potion_name + ".");
    can_craft = false;
}

// Craft the potion if all ingredients are available
if (can_craft) {
    global.inventory[recipe.food_required] -= recipe.food_amount;
    global.inventory[recipe.ore_required] -= recipe.ore_amount;
    global.inventory[recipe.wood_required] -= recipe.wood_amount;

    global.inventory[recipe.output] += 1;
    crafted = true;
    show_message("Successfully crafted " + recipe.name + "!");
} else {
    show_message("Cannot craft " + recipe.name + " due to insufficient ingredients.");
}
