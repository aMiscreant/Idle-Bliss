function craft_item(item_type, item_name) {
    // Check which item type is being crafted
    switch(item_type) {
        case "weapon":
            for (var i = 0; i < array_length(global.crafting_recipes.weapons); i++) {
                if (global.crafting_recipes.weapons[i].name == item_name && !global.crafting_recipes.weapons[i].crafted) {
                    if (global.inventory.ores >= 5) {
                        global.inventory.ores -= 5;  // Use resources
                        global.crafting_recipes.weapons[i].crafted = true;  // Mark as crafted
                        show_debug_message(item_name + " crafted!");
                    } else {
                        show_debug_message("Not enough ores.");
                    }
                    return;
                }
            }
            break;

        case "armor":
            for (var i = 0; i < array_length(global.crafting_recipes.armor); i++) {
                if (global.crafting_recipes.armor[i].name == item_name && !global.crafting_recipes.armor[i].crafted) {
                    if (global.inventory.food >= 3 && global.inventory.ores >= 3) {
                        global.inventory.food -= 3;
                        global.inventory.ores -= 3;
                        global.crafting_recipes.armor[i].crafted = true;
                        show_debug_message(item_name + " crafted!");
                    } else {
                        show_debug_message("Not enough resources.");
                    }
                    return;
                }
            }
            break;

        case "potion":
            for (var i = 0; i < array_length(global.crafting_recipes.potions); i++) {
                if (global.crafting_recipes.potions[i].name == item_name && !global.crafting_recipes.potions[i].crafted) {
                    if (global.inventory.food >= 2) {
                        global.inventory.food -= 2;
                        global.crafting_recipes.potions[i].crafted = true;
                        show_debug_message(item_name + " crafted!");
                    } else {
                        show_debug_message("Not enough food.");
                    }
                    return;
                }
            }
            break;
    }
}
