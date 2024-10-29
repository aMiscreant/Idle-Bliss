function scr_smelting(ore_type) {
    var ore_count, wood_count, ore_required, wood_required, fuel_type;

    switch (ore_type) {
        case "copper":
            ore_count = global.inventory.copper;
            wood_count = global.inventory.oak;
            ore_required = 5;
            wood_required = 1;
            fuel_type = "oak";
            break;
        case "iron":
            ore_count = global.inventory.iron;
            wood_count = global.inventory.pine;
            ore_required = 10;
            wood_required = 2;
            fuel_type = "pine";
            break;
        case "steel":
            ore_count = global.inventory.steel;
            wood_count = global.inventory.birch;
            ore_required = 15;
            wood_required = 3;
            fuel_type = "birch";
            break;
        case "silver":
            ore_count = global.inventory.silver;
            wood_count = global.inventory.maple;
            ore_required = 20;
            wood_required = 4;
            fuel_type = "maple";
            break;
        case "gold":
            ore_count = global.inventory.gold;
            wood_count = global.inventory.mahogany;
            ore_required = 25;
            wood_required = 5;
            fuel_type = "mahogany";
            break;
        default:
            show_message("Invalid ore type.");
            return;
    }

    // Check resources
    if (ore_count < ore_required && wood_count < wood_required) {
        show_message("Not enough ore or wood to smelt " + ore_type + "!");
    } else if (ore_count < ore_required) {
        show_message("Not enough " + ore_type + " to smelt.");
    } else if (wood_count < wood_required) {
        show_message("Not enough " + fuel_type + " wood. Gather more wood.");
    } else {
        // Deduct resources
        switch (ore_type) {
            case "copper": global.inventory.copper -= ore_required; break;
            case "iron": global.inventory.iron -= ore_required; break;
            case "steel": global.inventory.steel -= ore_required; break;
            case "silver": global.inventory.silver -= ore_required; break;
            case "gold": global.inventory.gold -= ore_required; break;
        }

        switch (fuel_type) {
            case "oak": global.inventory.oak -= wood_required; break;
            case "pine": global.inventory.pine -= wood_required; break;
            case "birch": global.inventory.birch -= wood_required; break;
            case "maple": global.inventory.maple -= wood_required; break;
            case "mahogany": global.inventory.mahogany -= wood_required; break;
        }

        // Update bar count directly
        switch (ore_type) {
            case "copper": global.inventory.copper_bars += 1; break;
            case "iron": global.inventory.iron_bars += 1; break;
            case "steel": global.inventory.steel_bars += 1; break;
            case "silver": global.inventory.silver_bars += 1; break;
            case "gold": global.inventory.gold_bars += 1; break;
        }

        show_message("Successfully smelted " + ore_type + " into a bar!");
    }
}
