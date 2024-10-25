/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
function harvest_wood() {
    global.inventory.wood += 10;  // Harvest 10 ores
    global.wood_message = "Harvested 10 Wood!";  // Store the message
    global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)
}
