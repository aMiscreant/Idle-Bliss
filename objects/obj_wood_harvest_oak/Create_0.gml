/// @description Insert description here
// You can write your code in this editor
function harvest_wood(wood_type) {
    var amount = 10;  // Amount to harvest (you can adjust this as needed)
    global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)

    // Check which food type is being harvested and update the corresponding inventory
    switch (wood_type) {
        case "oak":
            global.inventory.oak += amount;
            global.wood_messag = "Harvested " + string(amount) + "Oak!";
            break;
        case "pine":
            global.inventory.pine += amount;
            global.wood_messag = "Harvested " + string(amount) + " Pine!";
            break;
        case "birch":
            global.inventory.birch += amount;
            global.wood_messag = "Harvested " + string(amount) + " Birch!";
            break;
        case "maple":
            global.inventory.maple += amount;
            global.wood_messag = "Harvested " + string(amount) + " Maple!";
            break;
        case "mahogany":
            global.inventory.mahogany += amount;
            global.wood_messag = "Harvested " + string(amount) + " Mahogany!";
            break;
        default:
            global.wood_message = "Invalid food type!";
            return;  // Exit the function if the type is invalid
    }

    // Increase experience for leveling up
    global.current_exp_wood += amount;

    // Check for leveling up
    if (global.current_exp_wood >= global.exp_to_next_level_wood) {
        global.current_wood_level += 1; // Level up
        global.current_exp_wood = 0; // Reset current experience

        // Set next level requirement
        if (global.current_wood_level < array_length(global.wood_exp_requirements)) {
            global.exp_to_next_level_wood = global.wood_exp_requirements[global.current_wood_level];
            global.wood_message += "\nYou've leveled up to " + global.wood_levels[global.current_wood_level] + "!";
        } else {
            global.wood_message += "\nYou have reached the maximum Wood level!";
            global.current_wood_level = array_length(global.wood_levels) - 1; // Cap at max level
        }
    }
}
