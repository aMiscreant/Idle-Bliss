// Create event of obj_controller
global.inventory = {
    wood: 0,		// Start with 0 wood
    food: 0,		// Start with 0 food
    ores: 0,        // Start with 0 ores
    weapons: [],	// Store Weapons
    armor: [],		// Store Armor
    potions: [],	// Store Potions
    pets: []        // Store Pets
};

//game_set_speed(30, gamespeed_fps);
global.player_name = "Dream";
global.message_timer = 0;
global.ores_message = "";
global.adventure_message = "";
global.character_stats = [
    {name: "Dream, The Knight", hp: 100, attack: 10, defense: 5, unlocked: false},
    {name: "Lynx, The Archer", hp: 80, attack: 15, defense: 3, unlocked: false},
    {name: "Serenity, The Mage", hp: 70, attack: 20, defense: 2, unlocked: false},
    {name: "Orvil, The Rogue", hp: 90, attack: 12, defense: 4, unlocked: false},
    {name: "Maximus, The Paladin", hp: 120, attack: 8, defense: 10, unlocked: false}
];

global.adventure_in_progress = false;
global.adventure_timer = 0;
global.current_adventure_character = -1;
global.current_adventure_stage = 0;

global.crafting_recipes = {
    weapons: [
        {name: "Iron Sword", crafted: false},
        {name: "Steel Axe", crafted: false}
    ],
    armor: [
        {name: "Leather Armor", crafted: false},
        {name: "Chainmail", crafted: false}
    ],
    potions: [
        {name: "Health Potion", crafted: false},
        {name: "Mana Potion", crafted: false}
    ]
};

global.currency = 0;  // In-game currency for purchases
global.store_characters = [
    {name: "Dragon Warrior", price: 1000, unlocked: false},
    {name: "Sorcerer Queen", price: 1500, unlocked: false},
    {name: "Dark Knight", price: 2000, unlocked: false},
    {name: "Shadow Assassin", price: 2500, unlocked: false},
    {name: "Phoenix Mage", price: 3000, unlocked: false}
];

// Game settings
global.sound_volume = 1;      // Sound volume (1 = max)
global.graphics_quality = 3;  // Graphics quality (1 = low, 3 = high)
global.is_game_paused = false;  // Tracks if the game is paused
global.is_player_online = true; // Check if player is online

// Queue for messages
global.messages = ds_queue_create();
global.message_timer = 0;


// Room Start event in obj_controller
global.music_playing = true; // Set to true if music should play initially
global.bgm_adventure = audio_play_sound(bgm_adventure, 1, true); // Start background music

if (!audio_is_playing(global.bgm_adventure)) {
    global.bgm_adventure = audio_play_sound(bgm_adventure, 1, true);
}
