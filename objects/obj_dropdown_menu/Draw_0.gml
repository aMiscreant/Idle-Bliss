// Colors
var bg_color = c_white; // Background color of the dropdown
var text_color = c_black; // Text color for readability

// Draw dropdown header
draw_set_color(bg_color);
draw_rectangle(x_pos, y_pos, x_pos + width, y_pos + item_height, false);
draw_set_color(text_color);
if (selected_index != -1) {
    draw_text(x_pos + 5, y_pos + 5, menu_items[selected_index]);
} else {
    draw_text(x_pos + 5, y_pos + 5, "Select a Character");
}

// If open, draw each character option with contrasting colors
if (is_open) {
    for (var i = 0; i < array_length(menu_items); i++) {
        var item_y = y_pos + (i + 1) * item_height;
        draw_set_color(bg_color);
        draw_rectangle(x_pos, item_y, x_pos + width, item_y + item_height, false);
        draw_set_color(text_color);
        draw_text(x_pos + 5, item_y + 5, menu_items[i]);
    }
}
