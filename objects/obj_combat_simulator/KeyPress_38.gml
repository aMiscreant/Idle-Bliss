var char = global.characters[global.current_character];
if (char.attack < char.max_attack) {
    char.attack += 1;
    training_option = "attack"; // Update training option for feedback
    scr_check_unlocks(); // Check if leveling up unlocks a new character
}
