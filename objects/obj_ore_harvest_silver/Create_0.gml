/// @description Insert description here
// You can write your code in this editor
function harvest_ore(ore_type) {
    var amount = 10;  // Amount to harvest (you can adjust this as needed)
    global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)

    // Check which ore type is being harvested and update the corresponding inventory
    switch (ore_type) {
        case "copper":
            global.inventory.copper += amount;
            global.ore_message = "Harvested " + string(amount) + " Copper!";
            break;
        case "iron":
            global.inventory.iron += amount;
            global.ore_message = "Harvested " + string(amount) + " Iron!";
            break;
        case "steel":
            global.inventory.steel += amount;
            global.ore_message = "Harvested " + string(amount) + " Steel!";
            break;
        case "silver":
            global.inventory.silver += amount;
            global.ore_message = "Harvested " + string(amount) + " Silver!";
            break;
        case "gold":
            global.inventory.gold += amount;
            global.ore_message = "Harvested " + string(amount) + " Gold!";
            break;
        default:
            global.ore_message = "Invalid ore type!";
            return;  // Exit the function if the type is invalid
    }

    // Increase experience for leveling up
    global.current_ore_exp += amount;

    // Check for leveling up
    if (global.current_ore_exp >= global.exp_to_next_ore_level) {
        global.current_ore_level += 1; // Level up
        global.current_ore_exp = 0; // Reset current experience

        // Set next level requirement
        if (global.current_ore_level < array_length(global.ore_exp_requirements)) {
            global.exp_to_next_ore_level = global.ore_exp_requirements[global.current_ore_level];
            global.ore_message += "\nYou've leveled up to " + global.ore_levels[global.current_ore_level] + "!";
        } else {
            global.ore_message += "\nYou have reached the maximum ore level!";
            global.current_ore_level = array_length(global.ore_levels) - 1; // Cap at max level
        }
    }
}
