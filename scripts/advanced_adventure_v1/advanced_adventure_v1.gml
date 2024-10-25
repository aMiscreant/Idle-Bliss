// Function to start an adventure with a character
function start_adventure(character_index) {
    var char = global.character_stats[character_index];
    if (char.unlocked && char.hp > 0) {
        global.current_adventure_character = character_index;
        global.current_adventure_stage = 0;
        global.adventure_in_progress = true;
        global.adventure_timer = 0;
        show_debug_message("Character " + char.name + " started an adventure.");
    } else {
        show_debug_message(char.name + " is either locked or dead.");
    }
}

// Function to progress through the adventure
function advance_adventure() {
    if (!global.adventure_in_progress) return;
    
    global.current_adventure_stage += 1;  // Move to the next stage
    
    // Random event generator (0 to 100)
    var event_roll = irandom(100);
    
    if (event_roll < 40) {
        // Find treasure
        global.inventory.ores += 5;
        show_debug_message("Found treasure! 5 ores added.");
    } else if (event_roll < 80) {
        // Encounter enemy (fight simulation)
        var damage = irandom(10);  // Random damage between 0 and 10
        global.character_stats[global.current_adventure_character].hp -= damage;
        show_debug_message("Fought enemy! Took " + string(damage) + " damage.");
        
        // Ensure health doesn't drop below 0
        if (global.character_stats[global.current_adventure_character].hp <= 0) {
            global.character_stats[global.current_adventure_character].hp = 0;
            show_debug_message("Character " + string(global.current_adventure_character) + " died.");
            global.adventure_in_progress = false;
            return;
        }
    } else {
        // Safe travel, no events
        show_debug_message("Safe travel, no events.");
    }
    
    // End the adventure after 5 stages
    if (global.current_adventure_stage >= 5) {
        global.adventure_in_progress = false;
        show_debug_message("Adventure completed!");
        character_gain_experience(global.current_adventure_character, 50);  // Add XP
    }
}
