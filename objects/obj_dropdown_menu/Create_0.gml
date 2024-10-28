/// @description Insert description here
// You can write your code in this editor
x_pos = 100;
y_pos = 100;
width = 200;
item_height = 30;
is_open = false;
selected_index = -1;

// Initially populate with unlocked characters only
refresh_menu_items();

// Array for all characters
all_characters = [
    { name: "Dream, the Knight", unlocked: true },
    { name: "Kul, The Mage", unlocked: false },
    { name: "Serenity, The Archer", unlocked: false },
    { name: "Lost, The Thief", unlocked: false },
    { name: "Maximus, The Paladin", unlocked: false }
];

// Filter unlocked characters for menu
menu_items = [];
for (var i = 0; i < array_length(all_characters); i++) {
    if (all_characters[i].unlocked) {
        array_push(menu_items, all_characters[i].name);
    }
}
