// In obj_training_ui Create Event
ui_x = 20;
ui_y = 20;
training_options = ["Train HP", "Train Attack", "Train Defense"];
selected_option = -1; // Tracks selected training option

function train_stat(character_index, stat) {
    var char = global.characters[character_index];
    if (!char.unlocked) return;

    switch (stat) {
        case "hp":
            if (char.hp < char.max_hp) char.hp += 1;
            break;
        case "attack":
            if (char.attack < char.max_attack) char.attack += 1;
            break;
        case "defense":
            if (char.defense < char.max_defense) char.defense += 1;
            break;
    }
    check_unlocks(); // Unlock characters as Dream progresses
}
