/// @description Insert description here
// You can write your code in this editor
// Set the starting coordinates for the food display
//global.wood_levels = ["Oak", "Pine", "Birch", "Maple", "Mahogany"]; // Different types of wood


var x_start = 10;   // X-coordinate for the text
var y_start = 10;   // Y-coordinate for the first line of text
var y_offset = 25;  // Vertical space between each line of text

// Draw each type of food and its current count in the inventory
draw_text(x_start, y_start, "Wood Inventory:");
draw_text(x_start, y_start + y_offset, "Oak: " + string(global.inventory.oak));   // Specific item count for Oak
draw_text(x_start, y_start + 2 * y_offset, "Pine: " + string(global.inventory.pine)); // Specific item count for Pine
draw_text(x_start, y_start + 3 * y_offset, "Birch: " + string(global.inventory.birch));         // Specific item count for Birch
draw_text(x_start, y_start + 4 * y_offset, "Maple: " + string(global.inventory.maple)); // Specific item count for Maple
draw_text(x_start, y_start + 5 * y_offset, "Mahogany: " + string(global.inventory.mahogany));           // Specific item count for Mahogany

// Optional: add other UI elements for clarity or styling if desired
