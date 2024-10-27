// Set the starting coordinates for the food display
var x_start = 10;   // X-coordinate for the text
var y_start = 10;   // Y-coordinate for the first line of text
var y_offset = 25;  // Vertical space between each line of text

// Draw each type of food and its current count in the inventory
draw_text(x_start, y_start, "Food Inventory:");
draw_text(x_start, y_start + y_offset, "Berries: " + string(global.inventory.berries));   // Specific item count for Berries
draw_text(x_start, y_start + 2 * y_offset, "Potatoes: " + string(global.inventory.potatoes)); // Specific item count for Potatoes
draw_text(x_start, y_start + 3 * y_offset, "Fish: " + string(global.inventory.fish));         // Specific item count for Fish
draw_text(x_start, y_start + 4 * y_offset, "Mushrooms: " + string(global.inventory.mushrooms)); // Specific item count for Mushrooms
draw_text(x_start, y_start + 5 * y_offset, "Meat: " + string(global.inventory.meat));           // Specific item count for Meat

// Optional: add other UI elements for clarity or styling if desired
