// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// characters need to be added and exp points
function character_gain_experience(character_index, experience_points) {
    var char = global.character_stats[character_index];
    char.experience += experience_points;
    show_debug_message("Character " + string(character_index) + " gained " + string(experience_points) + " XP.");
    
    // Level up if experience exceeds threshold (example: 100 XP per level)
    var level_up_xp = char.level * 100;
    if (char.experience >= level_up_xp) {
        char.level += 1;
        char.experience -= level_up_xp;  // Remove the XP used to level up
        char.hp = 100;  // Reset health to 100 after level-up
        show_debug_message("Character " + string(character_index) + " leveled up to " + string(char.level) + "!");
    }
}
