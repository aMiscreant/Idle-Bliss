function save_game() {
    // Create a temporary struct to store the game state
    var game_state = {
        inventory: global.inventory,
        characters: global.characters,
        current_character: global.current_character,
        currency: global.currency,
        current_ore_level: global.current_ore_level,
        current_ore_exp: global.current_ore_exp,
        exp_to_next_ore_level: global.exp_to_next_ore_level,
        current_wood_level: global.current_wood_level,
        current_wood_exp: global.current_wood_exp,
        exp_to_next_wood_level: global.exp_to_next_wood_level,
        current_food_level: global.current_food_level,
        current_exp_food: global.current_exp_food,
        exp_to_next_level_food: global.exp_to_next_level_food,
        music_playing: global.music_playing,
        sound_volume: global.sound_volume,
        graphics_quality: global.graphics_quality,
        is_game_paused: global.is_game_paused,
        is_player_online: global.is_player_online
    };

    // Convert struct to JSON string
    var json_data = json_stringify(game_state);

    // Save JSON data to file
    var save_path = "game_save.json"; // You can use a custom path if preferred
    var file = file_text_open_write(save_path);
    file_text_write_string(file, json_data);
    file_text_close(file);

    show_message("Game saved successfully!");
}
