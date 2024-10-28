// Main dropdown button with border and shadow effect
var dropdown_width = 200;
var dropdown_height = 30;
var item_height = 30; // Make each menu item taller for readability

draw_set_color(c_dkgray); // Border color
draw_rectangle(x - 2, y - 2, x + dropdown_width + 2, y + dropdown_height + 2, true); // Border
draw_set_color(c_black); // Shadow
draw_rectangle(x + 2, y + 2, x + dropdown_width, y + dropdown_height, true); // Shadow
draw_set_color(c_white); // Background
draw_rectangle(x, y, x + dropdown_width, y + dropdown_height, false);
draw_set_color(c_black);
draw_text(x + 15, y + 7, array_length(menu_items) > 0 ? menu_items[selected_character] : "No characters unlocked");

// Draw menu items if dropdown is open
if (is_open) {
    for (var i = 0; i < array_length(menu_items); i++) {
        var item_y = y + (i + 1) * item_height;

        // Background with highlight for selected item
        draw_set_color(i == selected_character ? make_color_rgb(230, 230, 230) : c_white);
        draw_rectangle(x, item_y, x + dropdown_width, item_y + item_height, false);

        // Draw menu item text with padding
        draw_set_color(c_black);
        draw_text(x + 15, item_y + 7, menu_items[i]);
    }
}

// Reset color
draw_set_color(c_white);
