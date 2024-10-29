// Set the starting coordinates for the ore display
var x_start = 40;    // X-coordinate for the text, adjusted for extra space
var y_start = 10;    // Y-coordinate for the first line of text
var y_offset = 30;   // Vertical space between each line of text, for readability
var sprite_x_offset = -40; // X offset for sprites to the left of the text
var sprite_scale = 0.5;    // Scale for smaller icons

// Draw each type of ore with its current count and corresponding sprite
draw_text(x_start, y_start, "Ore Inventory:");
draw_sprite_ext(spr_copper, 0, x_start + sprite_x_offset, y_start + y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + y_offset, "Copper: " + string(global.inventory.copper));

draw_sprite_ext(spr_iron, 0, x_start + sprite_x_offset, y_start + 2 * y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + 2 * y_offset, "Iron: " + string(global.inventory.iron));

draw_sprite_ext(spr_steel, 0, x_start + sprite_x_offset, y_start + 3 * y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + 3 * y_offset, "Steel: " + string(global.inventory.steel));

draw_sprite_ext(spr_silver, 0, x_start + sprite_x_offset, y_start + 4 * y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + 4 * y_offset, "Silver: " + string(global.inventory.silver));

draw_sprite_ext(spr_gold, 0, x_start + sprite_x_offset, y_start + 5 * y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + 5 * y_offset, "Gold: " + string(global.inventory.gold));

// Repeat for bars
draw_sprite_ext(spr_copper_bar, 0, x_start + sprite_x_offset, y_start + 6 * y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + 6 * y_offset, "Copper Bars: " + string(global.inventory.copper_bars));

draw_sprite_ext(spr_iron_bar, 0, x_start + sprite_x_offset, y_start + 7 * y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + 7 * y_offset, "Iron Bars: " + string(global.inventory.iron_bars));

draw_sprite_ext(spr_steel_bar, 0, x_start + sprite_x_offset, y_start + 8 * y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + 8 * y_offset, "Steel Bars: " + string(global.inventory.steel_bars));

draw_sprite_ext(spr_silver_bar, 0, x_start + sprite_x_offset, y_start + 9 * y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + 9 * y_offset, "Silver Bars: " + string(global.inventory.silver_bars));

draw_sprite_ext(spr_gold_bar, 0, x_start + sprite_x_offset, y_start + 10 * y_offset, sprite_scale, sprite_scale, 0, c_white, 1);
draw_text(x_start, y_start + 10 * y_offset, "Gold Bars: " + string(global.inventory.gold_bars));
