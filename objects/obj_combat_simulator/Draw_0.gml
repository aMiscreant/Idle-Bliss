var char = global.characters[global.current_character];
draw_text(20, 20, "Current Character: " + char.name);
draw_text(20, 40, "HP: " + string(char.hp) + "/" + string(char.max_hp));
draw_text(20, 60, "Attack: " + string(char.attack) + "/" + string(char.max_attack));
draw_text(20, 80, "Defense: " + string(char.defense) + "/" + string(char.max_defense));

// Display the last selected training option
draw_text(20, 120, "Training: " + training_option);
