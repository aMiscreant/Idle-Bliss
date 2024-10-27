/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button_pressed(mb_left)) {
    if (!is_open) {
        if (mouse_x > x_pos && mouse_x < x_pos + width && mouse_y > y_pos && mouse_y < y_pos + item_height) {
            is_open = true;
        }
    } else {
        for (var i = 0; i < array_length(menu_items); i++) {
            if (mouse_x > x_pos && mouse_x < x_pos + width &&
                mouse_y > y_pos + (i + 1) * item_height && mouse_y < y_pos + (i + 2) * item_height) {
                selected_index = i;
                is_open = false;
                instance_create_layer(200, 200, "Instances", obj_character_manager);
                break;
            }
        }
    }

    if (!(mouse_x > x_pos && mouse_x < x_pos + width && mouse_y > y_pos && mouse_y < y_pos + item_height * (array_length(menu_items) + 1))) {
        is_open = false;
    }
}
