/// @description Insert description here
// You can write your code in this editor
// Set the starting coordinates for the ore display

var x_start = 10;   // X-coordinate for the text
var y_start = 10;   // Y-coordinate for the first line of text
var y_offset = 25;  // Vertical space between each line of text

// Draw each type of food and its current count in the inventory
draw_text(x_start, y_start, "Ore Inventory:");
draw_text(x_start, y_start + y_offset, "Copper: " + string(global.inventory.copper));   // Specific item count for Copper
draw_text(x_start, y_start + 2 * y_offset, "Iron: " + string(global.inventory.iron)); // Specific item count for Iron
draw_text(x_start, y_start + 3 * y_offset, "Steel: " + string(global.inventory.steel));         // Specific item count for Steel
draw_text(x_start, y_start + 4 * y_offset, "Silver: " + string(global.inventory.silver)); // Specific item count for Silver
draw_text(x_start, y_start + 5 * y_offset, "Gold: " + string(global.inventory.gold));           // Specific item count for Gold
draw_text(x_start, y_start + 6 * y_offset, "Copper Bars" + string(global.inventory.copper_bars));
draw_text(x_start, y_start + 7 * y_offset, "Iron Bars" + string(global.inventory.iron_bars));
draw_text(x_start, y_start + 8 * y_offset, "Steel Bars" + string(global.inventory.steel_bars));
draw_text(x_start, y_start + 9 * y_offset, "Silver Bars" + string(global.inventory.silver_bars));
draw_text(x_start, y_start + 10 * y_offset, "Gold Bars" + string(global.inventory.gold_bars));
// Optional: add other UI elements for clarity or styling if desired
