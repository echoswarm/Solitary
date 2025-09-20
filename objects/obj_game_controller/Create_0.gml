// obj_game_controller Create Event

// Game states enumeration (no pause in this game)
enum GameState {
    MENU,
    PLAYING,
    GAMEOVER
}

// Initialize state machine
current_state = GameState.PLAYING; // Start directly in playing for now (no menu yet)
previous_state = GameState.PLAYING;

// Game flags
game_initialized = false;
// No pausing in this game

// Initialize subsystems references
time_system = noone;
save_controller = noone;
display_manager = noone;

// Find and store references to subsystems
time_system = instance_find(obj_time_system, 0);
save_controller = instance_find(obj_save_controller, 0);
display_manager = instance_find(obj_display_manager, 0);

// Ensure we're in the right room
if (room != rm_prison_main) {
    room_goto(rm_prison_main);
}

game_initialized = true;