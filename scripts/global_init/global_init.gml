// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function global_init() {
    // Initialize player-related global variables
    global.player_name = "Dream";  // Default player name, can be changed later
    global.total_play_time = 0;     // Tracks total playtime in seconds
    global.current_level = 1;       // Tracks the player's current level
    global.experience_points = 0;   // Player's experience points (used for progression)

    // Character unlock system
    global.characters_unlocked = [false, false, false, false, false];  // Five characters to unlock (false = locked)
    global.character_stats = [
        {name: "Knight", hp: 100, attack: 10, defense: 5, unlocked: false},
        {name: "Archer", hp: 80, attack: 15, defense: 3, unlocked: false},
        {name: "Mage", hp: 70, attack: 20, defense: 2, unlocked: false},
        {name: "Rogue", hp: 90, attack: 12, defense: 4, unlocked: false},
        {name: "Paladin", hp: 120, attack: 8, defense: 10, unlocked: false}
    ];

    // Inventory system
    global.inventory = {
        wood: 0,
        food: 0,
        ores: 0,
        weapons: [],
        armor: [],
        potions: [],
        pets: [] // Can store pets
    };

    // Crafting system - Tracks player crafting progress
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

    // Adventure system - Tracks the player's ongoing adventures
    global.current_adventure = null;  // null means no current adventure; otherwise, store the adventure details

    // Game settings
    global.sound_volume = 1;     // Sound volume (1 = max, 0 = muted)
    global.graphics_quality = 3; // Graphics quality (1 = low, 3 = high)
    
    // Currency and in-game store data
    global.currency = 0;     // In-game currency for purchases
    global.store_characters = [
        {name: "Dragon Warrior", price: 1000, unlocked: false},
        {name: "Sorcerer Queen", price: 1500, unlocked: false},
        {name: "Dark Knight", price: 2000, unlocked: false},
        {name: "Shadow Assassin", price: 2500, unlocked: false},
        {name: "Phoenix Mage", price: 3000, unlocked: false}
    ];

    // Auto-saving interval (optional)
    global.auto_save_interval = 300; // Auto-save every 300 seconds (5 minutes)
    
    // Miscellaneous
    global.is_game_paused = false;   // Tracks if the game is paused
    global.is_player_online = true;  // Check if player is online (if offline, passive progress may stop)
    
    // Achievements/Progression tracking (optional)
    global.achievements = {
        first_adventure: false,
        unlock_all_characters: false,
        craft_all_items: false
    };

    // Debugging (optional)
    global.debug_mode = false; // You can turn on debug mode for testing purposes
}
