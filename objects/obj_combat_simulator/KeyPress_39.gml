var char = global.characters[global.current_character];
if (char.defense < char.max_defense) {
    char.defense += 1;
    training_option = "defense"; // Update training option for feedback
    scr_check_unlocks(); // Check if leveling up unlocks a new character
}
