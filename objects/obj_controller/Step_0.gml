/// @description Insert description here
// You can write your code in this editor
// Check adventure progress every 5 seconds (150 frames at 30 fps)
if (global.adventure_in_progress) {
    global.adventure_timer += 1;
    
    if (global.adventure_timer >= 150) {
        advance_adventure();
        global.adventure_timer = 0;  // Reset timer after advancing the adventure
    }
}
