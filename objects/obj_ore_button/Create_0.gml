function harvest_ores() {
    // Harvest ores
    global.inventory.ores += 10;  // Harvest 10 ores
    global.current_ore_exp += 10;      // Gain experience from harvesting
    global.ores_message = "Harvested 10 ores! Current EXP: " + string(global.current_ore_exp);
    global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)

    // Check if current EXP is enough for leveling up
    if (global.current_ore_exp >= global.exp_to_next_level) {
        // Level up if possible
        if (global.current_ore_level < array_length(global.ore_exp_requirements) - 1) {
            global.current_ore_level += 1;  // Level up
            global.current_ore_exp = 0;          // Reset current experience
            
            // Check if the next level exists in the requirements
            if (global.current_ore_level < array_length(global.ore_exp_requirements)) {
                global.exp_to_next_level = global.ore_exp_requirements[global.current_ore_level]; // Set next level requirement
            } else {
                global.exp_to_next_level = 0; // No further leveling requirements, cap experience
            }

            global.ores_message += "\nYou've leveled up! You are now level " + string(global.current_ore_level) + "!";
        } else {
            global.ores_message += "\nYou have reached the maximum ore level!";
            global.current_ore_exp = 0;  // Optionally reset experience, or keep it
        }
    } else {
        // Update the experience requirement for the next level only if not at max level
        if (global.current_ore_level < array_length(global.ore_exp_requirements) - 1) {
            global.exp_to_next_level = global.ore_exp_requirements[global.current_ore_level + 1];
        }
    }
}
