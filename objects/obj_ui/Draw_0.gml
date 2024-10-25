// Set the draw color to white for the text
draw_set_color(c_white);

// Display the current ores, wood, and food
var ores_text = "Ores: " + string(global.inventory.ores);
draw_text(20, 20, ores_text);

var wood_text = "Wood: " + string(global.inventory.wood);
draw_text(20, 40, wood_text);

var food_text = "Food: " + string(global.inventory.food);
draw_text(20, 60, food_text);

// Display the current player's currency
var currency_text = "Currency: " + string(global.currency);
draw_text(20, 100, currency_text);

// Display the current adventure status
if (global.adventure_in_progress) {
    var adventure_status = "Adventure: Stage " + string(global.current_adventure_stage);
} else {
    var adventure_status = "No Adventure in Progress";
}
draw_text(20, 120, adventure_status);

// Display the current character stats (assuming global.current_adventure_character holds the index of the selected character)
if (global.current_adventure_character != -1) {
    var char = global.character_stats[global.current_adventure_character];
    var char_stats = "Character: " + char.name + "\nHP: " + string(char.hp) + "\nAttack: " + string(char.attack) + "\nDefense: " + string(char.defense);
    draw_text(20, 140, char_stats);
} else {
    draw_text(20, 140, "No Character Selected");
}

// Display crafted weapons and armor
var crafted_weapons = "Weapons: ";
for (var i = 0; i < array_length(global.crafting_recipes.weapons); i++) {
    if (global.crafting_recipes.weapons[i].crafted) {
        crafted_weapons += global.crafting_recipes.weapons[i].name + ", ";
    }
}
draw_text(20, 200, crafted_weapons);

var crafted_armor = "Armor: ";
for (var i = 0; i < array_length(global.crafting_recipes.armor); i++) {
    if (global.crafting_recipes.armor[i].crafted) {
        crafted_armor += global.crafting_recipes.armor[i].name + ", ";
    }
}
draw_text(20, 220, crafted_armor);

// Display the number of pets
var pets_text = "Pets: " + string(array_length(global.inventory.pets));
draw_text(20, 240, pets_text);

// Display the number of potions
var potions_text = "Potions: " + string(array_length(global.inventory.potions));
draw_text(20, 260, potions_text);
