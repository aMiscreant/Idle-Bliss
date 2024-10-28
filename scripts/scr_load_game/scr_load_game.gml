function scr_load_game() {
    var save_path = "game_save.json";

    // Check if the save file exists
    if (file_exists(save_path)) {
        var file = file_text_open_read(save_path);
        var json_data = file_text_read_string(file);
        file_text_close(file);

        // Parse JSON string to struct
        var game_state = json_parse(json_data);

        // Load data back into globals
        global.inventory = game_state.inventory;
        global.characters = game_state.characters;
        global.current_character = game_state.current_character;
        global.currency = game_state.currency;
        global.current_ore_level = game_state.current_ore_level;
        global.current_ore_exp = game_state.current_ore_exp;
        global.exp_to_next_ore_level = game_state.exp_to_next_ore_level;
        global.current_wood_level = game_state.current_wood_level;
        global.current_wood_exp = game_state.current_wood_exp;
        global.exp_to_next_wood_level = game_state.exp_to_next_wood_level;
        global.current_food_level = game_state.current_food_level;
        global.current_exp_food = game_state.current_exp_food;
        global.exp_to_next_level_food = game_state.exp_to_next_level_food;
        global.music_playing = game_state.music_playing;
        global.sound_volume = game_state.sound_volume;
        global.graphics_quality = game_state.graphics_quality;
        global.is_game_paused = game_state.is_game_paused;
        global.is_player_online = game_state.is_player_online;

        show_message("Game loaded successfully!");
    } else {
        show_message("No save file found.");
    }
}
