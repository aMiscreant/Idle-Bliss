function toggle_music() {
    if (global.music_playing) {
        audio_stop_sound(global.bgm_adventure); // Stop the music
        global.music_playing = false; // Update status
    } else {
        global.bgm_adventure = audio_play_sound(bgm_adventure, 1, true); // Start the music
        global.music_playing = true; // Update status
    }
}
