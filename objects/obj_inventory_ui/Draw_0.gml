if (inventory_open) {
    // Background position and scale
    var ui_x = 0;
    var ui_y = 214;
    var scale_x = 8;
    var scale_y = 10;

    // Draw the background
    draw_sprite_ext(spr_inventory_bg, 0, ui_x, ui_y, scale_x, scale_y, 0, c_white, 1);

    // Define items with their sprites and amounts
    var items = [
        {sprite: spr_copper, name: "Copper", amount: global.inventory.copper},
        {sprite: spr_iron, name: "Iron", amount: global.inventory.iron},
        {sprite: spr_steel, name: "Steel", amount: global.inventory.steel},
        {sprite: spr_silver, name: "Silver", amount: global.inventory.silver},
        {sprite: spr_gold, name: "Gold", amount: global.inventory.gold},
        {sprite: spr_wood_log_oak, name: "Oak Log", amount: global.inventory.oak},
		{sprite: spr_wood_log_pine, name: "Pine", amount: global.inventory.pine},
		{sprite: spr_wood_log_birch, name: "Birch", amount: global.inventory.birch},
		{sprite: spr_wood_log_maple, name: "Maple", amount: global.inventory.maple},
		{sprite: spr_wood_log_mahogany, name: "Mahogany", amount: global.inventory.mahogany},
        {sprite: spr_food_berries, name: "Berries", amount: global.inventory.berries},
		{sprite: spr_food_potatoes, name: "Potatoes", amount: global.inventory.potatoes},
		{sprite: spr_food_fish, name: "Fish", amount: global.inventory.fish},
		{sprite: spr_food_mushrooms, name: "Mushrooms", amount: global.inventory.mushrooms},
		{sprite: spr_food_meat, name: "Meat", amount: global.inventory.meat},
        {sprite: spr_copper_bar, name: "Copper Bar", amount: global.inventory.copper_bars},
        {sprite: spr_iron_bar, name: "Iron Bar", amount: global.inventory.iron_bars},
        {sprite: spr_steel_bar, name: "Steel Bar", amount: global.inventory.steel_bars},
        {sprite: spr_silver_bar, name: "Silver Bar", amount: global.inventory.silver_bars},
        {sprite: spr_gold_bar, name: "Gold Bar", amount: global.inventory.gold_bars}
    ];

    // Constants for paging
    var items_per_page = 12;
    var total_pages = ceil(array_length(items) / items_per_page);
    if (!variable_global_exists("current_page")) global.current_page = 0;

    // Coordinates for each cell in the 3x4 grid
    var coordinates = [
        [59, 289], [122, 289], [187, 289], [251, 289],
        [59, 386], [122, 386], [187, 386], [251, 386],
        [59, 448], [122, 448], [187, 448], [251, 448]
    ];

    // Draw items for the current page
    var start_index = global.current_page * items_per_page;
    var end_index = min(start_index + items_per_page, array_length(items));
    for (var i = start_index; i < end_index; i++) {
        var item = items[i];
        var grid_index = i mod items_per_page;
        var posX = coordinates[grid_index][0];
        var posY = coordinates[grid_index][1];

        // Draw the item icon and label in each cell
        draw_sprite_ext(item.sprite, 0, posX, posY, 0.5, 0.5, 0, c_white, 1);
        draw_text(posX, posY + 45, item.name + ": " + string(item.amount));
    }

    // Draw Up/Down Arrows and handle click events
    var arrow_up_x = ui_x + 260;
    var arrow_up_y = ui_y + 10;
    var arrow_down_x = ui_x + 260;
    var arrow_down_y = ui_y + 310;

    if (global.current_page > 0) {
        draw_sprite(spr_arrow_up, 0, arrow_up_x, arrow_up_y);
        if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, arrow_up_x, arrow_up_y, arrow_up_x + 32, arrow_up_y + 32)) {
            global.current_page -= 1;
        }
    }

    if (global.current_page < total_pages - 1) {
        draw_sprite(spr_arrow_down, 0, arrow_down_x, arrow_down_y);
        if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, arrow_down_x, arrow_down_y, arrow_down_x + 32, arrow_down_y + 32)) {
            global.current_page += 1;
        }
    }
}
