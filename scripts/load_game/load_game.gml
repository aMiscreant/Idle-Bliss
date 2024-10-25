function load_game() {
    var save_file = file_text_open_read("savegame.json");
    if (file_text_eof(save_file)) {
        show_debug_message("No save file found.");
        return;
    }
    
    var save_data = file_text_read_string(save_file);
    global.save_game = json_parse(save_data);  // Load the global data from JSON

    file_text_close(save_file);
    show_debug_message("Game loaded.");
}
