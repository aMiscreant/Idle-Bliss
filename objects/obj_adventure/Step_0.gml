// In the Step event of an appropriate object

if (global.adventure_in_progress) {
    // Check if the adventure timer is active
    if (global.adventure_timer > 0) {
        global.adventure_timer -= 1; // Decrement the timer

        // If there's still time left, you can update a message or effects here
        // Optionally, update the adventure message to indicate ongoing progress
        // For example: global.adventure_message = "Your adventure is still ongoing...";
    } else {
        // Adventure complete
        global.adventure_in_progress = false; // Reset the adventure in progress flag

        // Generate a random outcome for the adventure
        var adventure_outcome = irandom(2); // Random number between 0 and 2

        // Handle different outcomes and rewards
        var currency_collected = irandom_range(1, 10);
        var food_gathered = irandom_range(1, 5);
        
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
