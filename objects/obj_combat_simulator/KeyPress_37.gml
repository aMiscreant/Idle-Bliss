var char = global.characters[global.current_character];
if (char.hp < char.max_hp) {
    char.hp += 1;
    training_option = "hp"; // Update training option for feedback
    scr_check_unlocks(); // Check if leveling up unlocks a new character
}
