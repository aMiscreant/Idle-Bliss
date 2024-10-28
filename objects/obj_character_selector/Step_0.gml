if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, x, y, x + 150, y + 20)) {
        is_open = !is_open; // Toggle open/close
    } else if (is_open) {
        for (var i = 0; i < array_length(menu_items); i++) {
            var item_y = y + (i + 1) * 20;
            if (point_in_rectangle(mouse_x, mouse_y, x, item_y, x + 150, item_y + 20)) {
                selected_character = i;
                global.current_character = i;
                is_open = false; // Close the menu
                break;
            }
        }
    }
}
