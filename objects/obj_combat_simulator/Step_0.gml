/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button_pressed(mb_left)) {
    var char = global.characters[global.current_character];

    switch(training_option) {
        case "hp": if (char.hp < char.max_hp) char.hp += 1; break;
        case "attack": if (char.attack < char.max_attack) char.attack += 1; break;
        case "defense": if (char.defense < char.max_defense) char.defense += 1; break;
    }
    
    scr_check_unlocks(); // Check if leveling up unlocks a new character
}
