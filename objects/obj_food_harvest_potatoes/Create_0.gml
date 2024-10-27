/// @description Insert description here
// You can write your code in this editor
function harvest_food(food_type) {
    var amount = 10;  // Amount to harvest (you can adjust this as needed)
    global.message_timer = 150;  // Show the message for 5 seconds (at 30fps)

    // Check which food type is being harvested and update the corresponding inventory
    switch (food_type) {
        case "berries":
            global.inventory.berries += amount;
            global.food_message = "Harvested " + string(amount) + " Berries!";
            break;
        case "potatoes":
            global.inventory.potatoes += amount;
            global.food_message = "Harvested " + string(amount) + " Potatoes!";
            break;
        case "fish":
            global.inventory.fish += amount;
            global.food_message = "Harvested " + string(amount) + " Fish!";
            break;
        case "mushrooms":
            global.inventory.mushrooms += amount;
            global.food_message = "Harvested " + string(amount) + " Mushrooms!";
            break;
        case "meat":
            global.inventory.meat += amount;
            global.food_message = "Harvested " + string(amount) + " Meat!";
            break;
        default:
            global.food_message = "Invalid food type!";
            return;  // Exit the function if the type is invalid
    }

    // Increase experience for leveling up
    global.current_exp_food += amount;

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
