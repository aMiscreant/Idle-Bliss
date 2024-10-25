function save_game() {
    var save_data = json_stringify(global);  // Convert global data to JSON string
    var save_file = file_text_open_write("savegame.json");
    file_text_write_string(save_file, save_data);
    file_text_close(save_file);

    show_debug_message("Game saved.");
}
