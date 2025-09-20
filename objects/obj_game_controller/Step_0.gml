// obj_game_controller Step Event

// Handle state transitions
switch(current_state) {
    case GameState.MENU:
        // Menu state - waiting for game start
        // Space to start game (placeholder)
        if (keyboard_check_pressed(vk_space)) {
            current_state = GameState.PLAYING;
            // Reset game systems
            if (instance_exists(obj_time_system)) {
                with(obj_time_system) {
                    paused = false;
                }
            }
        }
        break;

    case GameState.PLAYING:
        // Playing state - game is running
        // No pausing in this game - removed ESC key check

        // Check for game over conditions
        // This will be expanded when needs system is implemented
        break;

    case GameState.GAMEOVER:
        // Game over state - show results
        // Space to restart (placeholder)
        if (keyboard_check_pressed(vk_space)) {
            // Restart the game
            room_restart();
        }
        break;
}

// Update subsystems based on state
if (current_state == GameState.PLAYING) {
    // All systems run normally when playing
} else if (current_state == GameState.MENU || current_state == GameState.GAMEOVER) {
    // Systems are idle or showing UI only
}