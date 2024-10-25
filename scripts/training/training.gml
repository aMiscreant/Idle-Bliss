function start_training(character_index) {
    if (global.character_stats[character_index].unlocked) {
        var training_duration = 4 * room_speed;  // Training takes 4 seconds
        alarm[2] = training_duration;  // Set alarm[2] for training

        global.current_training_character = character_index;
        global.is_training = true;
    } else {
        show_debug_message("Character not unlocked yet.");
    }
}
