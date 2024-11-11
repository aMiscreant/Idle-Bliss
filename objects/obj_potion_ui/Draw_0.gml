// Create event in obj_potion_ui
var x_start = 10; // Starting X position for the UI
var y_start = 10; // Starting Y position for the UI
var y_offset = 20; // Space between potion types

// Draw event in obj_potion_ui

// Set starting coordinates and label
draw_text(x_start, y_start, "Potion Inventory");

// Define and draw each potion's count from the inventory
var potions = [
    {name: "Healing Potion", amount: global.inventory.healing_potion},
    {name: "Stamina Potion", amount: global.inventory.stamina_potion},
    {name: "Attack Potion", amount: global.inventory.attack_potion},
    {name: "Defense Potion", amount: global.inventory.defense_potion},
    {name: "Mana Potion", amount: global.inventory.mana_potion}
];

for (var i = 0; i < array_length(potions); i++) {
    var potion = potions[i];
    var y_pos = y_start + (i + 1) * y_offset;
    draw_text(x_start, y_pos, potion.name + ": " + string(potion.amount));
}
