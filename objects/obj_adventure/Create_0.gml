// Adventure Function
function adventure() {
    // Check if the player can start an adventure (e.g., has enough resources)
    if (global.inventory.wood >= 5 && global.inventory.ores >= 3 && global.inventory.food >= 2) {
        // Deduct resources required to start the adventure
        global.inventory.wood -= 5;
        global.inventory.ores -= 3;
        global.inventory.food -= 2;  // Deduct food required for the adventure

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

// Step Event Logic for Adventure Timer
if (global.adventure_in_progress) {
    // Check if the adventure timer is active
    if (global.adventure_timer > 0) {
        global.adventure_timer -= 1; // Decrement the timer
        // Optional: Update the adventure message to indicate ongoing progress
        // For example: global.adventure_message = "Your adventure is still ongoing...";
        
    } else {
        // Adventure complete
        global.adventure_in_progress = false; // Reset the adventure in progress flag

        // Generate a random outcome for the adventure
        var adventure_outcome = irandom(2); // Random number between 0 and 2

        // Handle different outcomes and rewards
        var currency_collected = irandom_range(1, 10); // Random currency between 1 and 10
        var food_gathered = irandom_range(1, 5); // Random food between 1 and 5

        // Handle adventure outcomes
        switch (adventure_outcome) {
            case 0:
                global.inventory.wood += 20; // Gain 20 wood
                global.adventure_message = "As you return from your journey, the forest seems to welcome you back. \n" +
                    "Your skills have rewarded you with 20 Wood! \n" +
                    "You also collect " + string(currency_collected) + " Currency and " + string(food_gathered) + " Food! \n" +
                    "Feeling accomplished, you settle down and prepare for your next adventure.";
                break;
            case 1:
                global.inventory.ores += 10; // Gain 10 ore
                global.adventure_message = "The mountains have provided! You find glimmering veins of ore. \n" +
                    "You've successfully gathered 10 Ore! \n" +
                    "Along the way, you collect " + string(currency_collected) + " Currency and " + string(food_gathered) + " Food! \n" +
                    "With tales of your adventure, you head home.";
                break;
            case 2:
                global.adventure_message = "Though your journey was challenging, you return home with stories to tell. \n" +
                    "While not the outcome you hoped for, you still manage to gather " + string(currency_collected) + " Currency and " + string(food_gathered) + " Food. \n" +
                    "Next time, fortune may favor you.";
                break;
        }

        // Add collected currency and food to the global inventory
        global.currency += currency_collected;
        global.inventory.food += food_gathered;

        // Set the message display timer for the outcome
        global.message_timer = 900;  // Show the message for 30 seconds (at 30fps)
    }
}
