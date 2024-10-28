is_open = false; // Track whether the menu is open
selected_character = global.current_character; 
menu_items = []; // Initialize the menu items array

scr_update_menu(); // Call to populate menu_items with unlocked characters
