// Initialize available ores for smelting
available_ores = [];
for (var i = 0; i < array_length(global.ore_levels); i++) {
    var ore = global.ore_levels[i];
    if (global.inventory[ore] > 0) {  // Check if the player has any of this ore
        array_push(available_ores, ore);  // Add to available ores array if present
    }
}
