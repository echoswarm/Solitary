// obj_needs_display Create Event

// Initialize needs values
hunger = 100;        // 100 = fully satisfied, 0 = starving
cleanliness = 100;   // 100 = clean, 0 = filthy

// Decay rates (per game hour)
hunger_decay = 6;        // Lose 6 hunger per hour
cleanliness_decay = 4;   // Lose 4 cleanliness per hour

// Restoration rates (per activity)
hunger_restore = 60;     // Eating restores 60 hunger
cleanliness_restore = 70; // Cleaning restores 70 cleanliness

// Display settings
display_x = room_width - 250;  // Position on right side
display_y = 100;
bar_width = 200;
bar_height = 20;
bar_spacing = 30;

// Warning thresholds
warning_threshold = 20;
critical_threshold = 5;

// Flash timer for warnings
flash_timer = 0;
flash_duration = 30; // Frames to flash

// Reference to schedule display
schedule_display = noone;

// Last hour tracked (for decay)
last_hour = -1;