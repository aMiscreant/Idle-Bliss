// Adventure Function
function adventure() {
    // Check if the player can start an adventure (e.g., has enough resources)
    if (global.inventory.oak >= 5 && global.inventory.copper >= 3 && global.inventory.berries >= 2) {
        // Deduct resources required to start the adventure
        global.inventory.oak -= 5;
        global.inventory.copper -= 3;
        global.inventory.berries -= 2;  // Deduct food required for the adventure

        // Set up adventure parameters
        global.adventure_duration = 30 * room_speed; // 30 seconds in steps
        global.adventure_timer = global.adventure_duration; // Set the adventure timer
        global.adventure_in_progress = true; // Set flag to indicate adventure is in progress
        global.adventure_message = "You embark on an adventure, gathering your resources and bracing for the journey ahead!\n" +
                                    "The adventure will take 30 seconds..."; // Initial message
        global.message_timer = 900;  // Show the initial message for 30 seconds (at 30fps)

    } else {
        // Not enough resources to start the adventure
        global.adventure_message = "Not enough resources to start an adventure! Need at least 5 Wood, 3 Ores, and 2 Food.";
        global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)
    }
}
