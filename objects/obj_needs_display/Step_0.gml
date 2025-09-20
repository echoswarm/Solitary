// obj_needs_display Step Event

// Get references
if (!instance_exists(obj_time_system)) {
    exit;
}

if (!instance_exists(obj_schedule_display)) {
    schedule_display = instance_find(obj_schedule_display, 0);
}

// Check if hour changed
var current_hour = obj_time_system.hours;
if (current_hour != last_hour && !obj_time_system.paused) {
    last_hour = current_hour;

    // Apply decay
    hunger = max(0, hunger - hunger_decay);
    cleanliness = max(0, cleanliness - cleanliness_decay);

    // Check current activity and apply restoration
    if (instance_exists(obj_schedule_display)) {
        var current_activity = obj_schedule_display.schedule[current_hour];

        // Restore needs based on activity
        if (current_activity == Activity.EAT) {
            hunger = min(100, hunger + hunger_restore);
        }

        if (current_activity == Activity.CLEAN) {
            cleanliness = min(100, cleanliness + cleanliness_restore);
        }
    }

    // Check for game over conditions
    if (hunger <= 0 || cleanliness <= 0) {
        // Trigger game over
        if (instance_exists(obj_game_controller)) {
            obj_game_controller.current_state = GameState.GAMEOVER;
        }
    }
}

// Update flash timer for warnings
if (hunger < warning_threshold || cleanliness < warning_threshold) {
    flash_timer = (flash_timer + 1) mod (flash_duration * 2);
} else {
    flash_timer = 0;
}
