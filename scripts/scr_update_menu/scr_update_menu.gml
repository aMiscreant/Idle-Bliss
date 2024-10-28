function scr_update_menu() {
    menu_items = []; // Clear menu items before populating
    for (var i = 0; i < array_length(global.characters); i++) {
        if (global.characters[i].unlocked) {
            array_push(menu_items, global.characters[i].name);
        }
    }
    // Fallback if no characters are unlocked
    if (array_length(menu_items) == 0) {
        array_push(menu_items, "No characters unlocked");
    }
}
