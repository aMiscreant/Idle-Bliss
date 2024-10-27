// Display any messages from the adventure
if (global.adventure_message != "") {
    draw_text(20, 20, global.adventure_message); // Display the adventure message
}

// Display Current Character Stats
if (global.current_adventure_character != -1) {
    var char = global.characters[global.current_character];
    var char_stats = "Character: " + string(char.name) + "\nHP: " + string(char.hp) + "\nAttack: " + string(char.attack) + "\nDefense: " + string(char.defense);
	draw_text(20, 100, char_stats);
} else {
    draw_text(20, 80, "No Character Selected");
}
