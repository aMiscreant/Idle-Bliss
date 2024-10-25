// Create event of obj_controller
global.inventory = {
    wood: 0,
    food: 0,
    ores: 0,        // Start with 100 ores
    weapons: [],
    armor: [],
    potions: [],
    pets: []          // Can store pets like "Mittens The Kitten"
};

global.message_timer = 0;
global.ores_message = "";
global.character_stats = [
    {name: "Knight", hp: 100, attack: 10, defense: 5, unlocked: true},
    {name: "Archer", hp: 80, attack: 15, defense: 3, unlocked: false},
    {name: "Mage", hp: 70, attack: 20, defense: 2, unlocked: false},
    {name: "Rogue", hp: 90, attack: 12, defense: 4, unlocked: false},
    {name: "Paladin", hp: 120, attack: 8, defense: 10, unlocked: false}
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

// Function to start an adventure with a character
function start_adventure(character_index) {
    var char = global.character_stats[character_index];
    if (char.unlocked && char.hp > 0) {
        global.current_adventure_character = character_index;
        global.current_adventure_stage = 0;
        global.adventure_in_progress = true;
        global.adventure_timer = 0;
        show_debug_message("Character " + char.name + " started an adventure.");
    } else {
        show_debug_message(char.name + " is either locked or dead.");
    }
}

// Function to progress through the adventure
function advance_adventure() {
    if (!global.adventure_in_progress) return;
    
    global.current_adventure_stage += 1;  // Move to the next stage
    
    // Random event generator (0 to 100)
    var event_roll = irandom(100);
    
    if (event_roll < 40) {
        // Find treasure
        global.inventory.ores += 5;
        show_debug_message("Found treasure! 5 ores added.");
    } else if (event_roll < 80) {
        // Encounter enemy (fight simulation)
        var damage = irandom(10);  // Random damage between 0 and 10
        global.character_stats[global.current_adventure_character].hp -= damage;
        show_debug_message("Fought enemy! Took " + string(damage) + " damage.");
        
        // Ensure health doesn't drop below 0
        if (global.character_stats[global.current_adventure_character].hp <= 0) {
            global.character_stats[global.current_adventure_character].hp = 0;
            show_debug_message("Character " + string(global.current_adventure_character) + " died.");
            global.adventure_in_progress = false;
            return;
        }
    } else {
        // Safe travel, no events
        show_debug_message("Safe travel, no events.");
    }
    
    // End the adventure after 5 stages
    if (global.current_adventure_stage >= 5) {
        global.adventure_in_progress = false;
        show_debug_message("Adventure completed!");
        character_gain_experience(global.current_adventure_character, 50);  // Add XP
    }
}

// Function to give a character experience and level up if needed
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
