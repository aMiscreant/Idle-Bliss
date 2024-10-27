// Draw event in obj_training_ui
if (!is_array(global.characters) || array_length(global.characters) == 0) return;

for (var i = 0; i < array_length(global.characters); i++) {
    var char = global.characters[i];
    var y_offset = ui_y + i * 100;

    // Make sure each character has the needed fields
    if (!variable_instance_exists(char, "name")) continue;
    draw_text(ui_x, y_offset, "Name: " + string(char.name) + " | Level: " + string(char.level));
    draw_text(ui_x, y_offset + 20, "HP: " + string(char.hp) + "/" + string(char.max_hp));
    draw_text(ui_x, y_offset + 40, "Attack: " + string(char.attack) + "/" + string(char.max_attack));
    draw_text(ui_x, y_offset + 60, "Defense: " + string(char.defense) + "/" + string(char.max_defense));
    draw_text(ui_x + 200, y_offset, char.unlocked ? "(Unlocked)" : "(Locked)");
}
