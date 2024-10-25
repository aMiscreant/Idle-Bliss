/// @description Insert description here
// You can write your code in this editor
function harvest_ores() {
    global.inventory.ores += 10;  // Harvest 10 ores
    global.ores_message = "Harvested 10 ores!";  // Store the message
    global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)
}
