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

// Define ore levels and experience requirements in obj_controller's Create event or Room Start event
//global.ore_levels = ["Copper", "Iron", "Silver", "Gold", "Platinum"]; // Example ores
//global.ore_exp_requirements = [0, 50, 150, 300, 500]; // Required EXP for each level

//global.current_ore_level = 0; // Start at level 0 (Copper)
//global.current_exp = 0; // Initial experience points/
//global.exp_to_next_level = global.ore_exp_requirements[1]; // EXP needed to reach Iron
// In the Create event of obj_controller, initialize these global variables:
// Ore levels, experience, and other tracking variables
global.ore_levels = ["Copper", "Iron", "Steel", "Silver", "Gold"];
global.current_ore_level = 0;  // Start at the first level (Copper)
global.ore_exp_requirements = [10, 20, 30, 40, 50]; // Example values for experience requirements
//global.ore_exp_requirements = [0, 100, 250, 500];  // Experience needed to reach each level
global.current_ore_exp = 0;  // Player's current experience
global.exp_to_next_level = global.ore_exp_requirements[1];  // Set initial level-up requirement
global.inventory.ores = 0;  // Start with zero ores in the inventory

global.wood_levels = ["Oak", "Pine", "Birch", "Maple", "Mahogany"]; // Different types of wood
global.current_wood_level = 0;  // Start at the first level (Oak)
global.wood_exp_requirements = [10, 20, 30, 40, 50]; // Experience requirements for each wood level
global.current_exp_wood = 0;  // Player's current experience for wood
global.exp_to_next_level_wood = global.wood_exp_requirements[1]; // Set initial level-up requirement
global.inventory.wood = 0;  // Start with zero wood in the inventory

global.food_levels = ["Berries", "Potatoes", "Fish", "Mushrooms", "Meat"];
global.current_food_level = 0;
global.food_exp_requirements = [10, 20, 30, 40, 50];
global.current_exp_food = 0;
global.exp_to_next_level_food = global.food_exp_requirements[1];
global.inventory.food = 0;
