function scr_check_unlocks() {
    for (var i = 0; i < array_length(global.characters) - 1; i++) {
        var char = global.characters[i];
        var next_char = global.characters[i + 1];

        if (char.unlocked && !next_char.unlocked &&
            char.hp >= char.max_hp &&
            char.attack >= char.max_attack &&
            char.defense >= char.max_defense) {

            next_char.unlocked = true;
            show_message(next_char.name + " has been unlocked!");
            scr_update_menu(); // Refresh the menu to display the newly unlocked character
            break;
        }
    }
}
