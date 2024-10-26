// Set the draw color to white for the text
draw_set_color(c_white);

// Display Ore Information
draw_text(20, 20, "Ore Level: " + global.ore_levels[global.current_ore_level]);
draw_text(20, 40, "ORE EXP: " + string(global.current_ore_exp) + " / " + string(global.exp_to_next_level));
draw_text(20, 60, "Ores in Inventory: " + string(global.inventory.ores));

// Ensure current_wood_level is within the valid range
// Display Wood Information
draw_text(20, 100, "Wood Level: " + global.wood_levels[global.current_wood_level]);
draw_text(20, 120, "WOOD EXP: " + string(global.current_exp_wood) + " / " + string(global.current_wood_level));
draw_text(20, 140, "Wood in Inventory: " + string(global.inventory.wood));

// Display Food Information
//draw_text(20, 140, "Food: " + string(global.inventory.food));
draw_text(20, 180, "Food Level: " + global.food_levels[global.current_food_level]);
draw_text(20, 200, "FOOD EXP: " + string(global.current_exp_food) + " / " + string(global.current_food_level));
draw_text(20, 220, "Food in Inventory: " + string(global.inventory.food));

// Display Currency Information
draw_text(20, 260, "Currency: " + string(global.currency));

// Display Adventure Status
if (global.adventure_in_progress) {
    var adventure_status = "Adventure: Stage " + string(global.current_adventure_stage);
} else {
    var adventure_status = "No Adventure in Progress";
}
draw_text(20, 280, adventure_status);

// Display any messages from the adventure
if (global.adventure_message != "") {
    draw_text(20, 300, global.adventure_message); // Display the adventure message
}

// Display Current Character Stats
if (global.current_adventure_character != -1) {
    var char = global.character_stats[global.current_adventure_character];
    var char_stats = "Character: " + char.name + "\nHP: " + string(char.hp) + "\nAttack: " + string(char.attack) + "\nDefense: " + string(char.defense);
    draw_text(20, 380, char_stats);
} else {
    draw_text(20, 400, "No Character Selected");
}

// Display Crafted Weapons
var crafted_weapons = "Weapons: ";
for (var i = 0; i < array_length(global.crafting_recipes.weapons); i++) {
    if (global.crafting_recipes.weapons[i].crafted) {
        crafted_weapons += global.crafting_recipes.weapons[i].name + ", ";
    }
}
draw_text(20, 420, crafted_weapons);

// Display Crafted Armor
var crafted_armor = "Armor: ";
for (var i = 0; i < array_length(global.crafting_recipes.armor); i++) {
    if (global.crafting_recipes.armor[i].crafted) {
        crafted_armor += global.crafting_recipes.armor[i].name + ", ";
    }
}
draw_text(20, 440, crafted_armor);

// Display the Number of Pets
var pets_text = "Pets: " + string(array_length(global.inventory.pets));
draw_text(20, 460, pets_text);

// Display the Number of Potions
var potions_text = "Potions: " + string(array_length(global.inventory.potions));
draw_text(20, 480, potions_text);
