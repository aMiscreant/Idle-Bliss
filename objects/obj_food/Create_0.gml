function harvest_food() {
    global.inventory.food += 10;  // Harvest 10 wood
    global.current_exp_food += 10; // Increase experience by 10
    global.food_message = "Harvested 10 Food!";  // Store the message
    global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)

    // Check for leveling up
    if (global.current_exp_food >= global.exp_to_next_level_food) {
        global.current_food_level += 1; // Level up
        global.current_exp_food = 0; // Reset current experience
        // Set next level requirement
        if (global.current_food_level < array_length(global.food_exp_requirements)) {
            global.exp_to_next_level_food = global.food_exp_requirements[global.current_food_level];
            global.food_message += "\nYou've leveled up to " + global.food_levels[global.current_food_level] + "!";
        } else {
            global.food_message += "\nYou have reached the maximum food level!";
            global.current_food_level = array_length(global.food_levels) - 1; // Cap at max level
        }
    }
}
