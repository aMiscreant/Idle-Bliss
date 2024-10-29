/// scr_inventory_page_control(direction)

// Arguments: page_direction (+1 for down arrow, -1 for up arrow)
var page_direction = argument0;

// Update the current page, keeping it within bounds
if (page_direction == 1 && global.current_page < total_pages - 1) {
    global.current_page += 1;
} else if (page_direction == -1 && global.current_page > 0) {
    global.current_page -= 1;
}
