//global.ore_levels = ["Copper", "Iron", "Steel", "Silver", "Gold"];

global.inventory = {
	copper: 0,
	iron: 0,
	steel: 0,
	silver: 0,
	gold: 0,
	copper_bars: 0,
	iron_bars: 0,
	steel_bars: 0,
	silver_bars: 0,
	gold_bars: 0,
	oak: 0,
	pine: 0,
	birch: 0,
	maple: 0,
	mahogany: 0,
    berries: 0,
    potatoes: 0,
    fish: 0,
    mushrooms: 0,
    meat: 0,
    weapons: [],
    armor: [],
    potions: [],
    pets: []
};



global.message_timer = 0;


global.characters = [
    { name: "Dream, the Knight", level: 1, hp: 100, max_hp: 120, attack: 15, max_attack: 50, defense: 10, max_defense: 60, current_exp: 0, exp_to_next_level: 50, sprite: spr_dream_knight, unlocked: true },
    { name: "Kul, The Mage", level: 0, hp: 80, max_hp: 90, attack: 20, max_attack: 55, defense: 5, max_defense: 55, current_exp: 0, exp_to_next_level: 50,  sprite: spr_kul_mage, unlocked: false },
    { name: "Serenity, The Archer", level: 0, hp: 90, max_hp: 95, attack: 18, max_attack: 53, defense: 8, max_defense: 58, current_exp: 0, exp_to_next_level: 50, sprite: spr_serenity_archer, unlocked: false },
    { name: "Lost, The Thief", level: 0, hp: 85, max_hp: 100, attack: 17, max_attack: 52, defense: 7, max_defense: 57, current_exp: 0, exp_to_next_level: 50,  sprite: spr_lost_thief, unlocked: false },
    { name: "Maximus, The Paladin", level: 0, hp: 120, max_hp: 160, attack: 12, max_attack: 47, defense: 15, max_defense: 65, current_exp: 0, exp_to_next_level: 50,  sprite: spr_maximus_paladin, unlocked: false }
];
global.current_character = 0;  // Default to the first character


global.adventure_in_progress = false;
global.adventure_timer = 0;
global.current_adventure_character = -1;
global.current_adventure_stage = 0;
global.adventure_message = "";

global.currency = 0;  // In-game currency for purchases

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


// Ore levels, experience, and other tracking variables
global.ore_levels = ["Copper", "Iron", "Steel", "Silver", "Gold"];
global.current_ore_level = 0;  // Start at the first level (Copper)
global.ore_exp_requirements = [10, 20, 30, 40, 50]; // Example values for experience requirements
//global.ore_exp_requirements = [0, 100, 250, 500];  // Experience needed to reach each level
global.current_ore_exp = 0;  // Player's current experience
global.exp_to_next_ore_level = global.ore_exp_requirements[1];  // Set initial level-up requirement
global.inventory.ores = 0;  // Start with zero ores in the inventory
global.ore_message = "";

// Wood  levels, experience, and other tracking variables
global.wood_levels = ["Oak", "Pine", "Birch", "Maple", "Mahogany"]; // Different types of wood
global.current_wood_level = 0;  // Start at the first level (Oak)
global.wood_exp_requirements = [10, 20, 30, 40, 50]; // Experience requirements for each wood level
global.current_wood_exp = 0;  // Player's current experience for wood
global.exp_to_next_wood_level = global.wood_exp_requirements[1]; // Set initial level-up requirement
global.inventory.wood = 0;  // Start with zero wood in the inventory
global.wood_message = "";

// food levels, experience, and other tracking variables
global.food_levels = ["Berries", "Potatoes", "Fish", "Mushrooms", "Meat"];
global.current_food_level = 0;
global.food_exp_requirements = [10, 20, 30, 40, 50];
global.current_exp_food = 0;
global.exp_to_next_level_food = global.food_exp_requirements[1];
global.inventory.food = 0;
global.food_message = "";

// Check if an instance of obj_controller already exists
if (!instance_exists(obj_controller)) {
    instance_set_persistent(true); // Make it persistent across rooms
} else {
    instance_destroy(); // Destroy any additional obj_controller instances
}


// Smelting recipes for converting ores to bars
global.smelting_recipes = [
    { ore: "copper", bar: "copper_bars", ore_required: 5, fuel_type: "oak", fuel_amount: 1 },
    { ore: "iron", bar: "iron_bars", ore_required: 10, fuel_type: "pine", fuel_amount: 2 },
    { ore: "steel", bar: "steel_bars", ore_required: 15, fuel_type: "birch", fuel_amount: 3 },
    { ore: "silver", bar: "silver_bars", ore_required: 20, fuel_type: "maple", fuel_amount: 4 },
    { ore: "gold", bar: "gold_bars", ore_required: 25, fuel_type: "mahogany", fuel_amount: 5 }
];
