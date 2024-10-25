/// @description Insert description here
// You can write your code in this editor
function harvest_food() {
    global.inventory.food += 10;  // Food 10 Baskets
    global.food_message = "Harvested 10 Food!";  // Store the message
    global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)
}
