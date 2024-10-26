function harvest_wood() {
    global.inventory.wood += 10;  // Harvest 10 wood
    global.current_exp_wood += 10; // Increase experience by 10
    global.wood_message = "Harvested 10 Wood!";  // Store the message
    global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)

    // Check for leveling up
    if (global.current_exp_wood >= global.exp_to_next_level_wood) {
        global.current_wood_level += 1; // Level up
        global.current_exp_wood = 0; // Reset current experience
        // Set next level requirement
        if (global.current_wood_level < array_length(global.wood_exp_requirements)) {
            global.exp_to_next_level_wood = global.wood_exp_requirements[global.current_wood_level];
            global.wood_message += "\nYou've leveled up to " + global.wood_levels[global.current_wood_level] + "!";
        } else {
            global.wood_message += "\nYou have reached the maximum wood level!";
            global.current_wood_level = array_length(global.wood_levels) - 1; // Cap at max level
        }
    }
}
