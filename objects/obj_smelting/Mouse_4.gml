// Show smelting menu for available ores
var choices = "";
for (var i = 0; i < array_length(available_ores); i++) {
    var ore = available_ores[i];
    choices += string(i) + " - " + ore + " (" + string(global.inventory[ore]) + " available)\n";
}

// Prompt player to choose an ore to smelt
var ore_choice = get_integer("Choose an ore to smelt:\n" + choices, -1);

if (ore_choice >= 0 && ore_choice < array_length(available_ores)) {
    var selected_ore = available_ores[ore_choice];
    smelt_ore(selected_ore);  // Call the smelting function
} else {
    show_message("Invalid selection. Please try again.");
}
