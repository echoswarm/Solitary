// obj_schedule_display Create Event

// Keep object visible so Draw GUI event runs
visible = true;

// Define activities
enum Activity {
    SLEEP,
    EAT,
    CLEAN,
    YARD,
    FREE,
    WORK
}

// Activity names for display
activity_names = [
    "Sleep",
    "Eat",
    "Clean",
    "Yard Time",
    "Free Time",
    "Work"
];

// Activity colors
activity_colors = [
    make_color_rgb(50, 50, 150),    // Sleep - dark blue
    make_color_rgb(150, 100, 50),   // Eat - brown
    make_color_rgb(50, 150, 150),   // Clean - cyan
    make_color_rgb(50, 150, 50),    // Yard - green
    make_color_rgb(150, 150, 50),   // Free - yellow
    make_color_rgb(150, 50, 50)     // Work - red
];

// Define 24-hour schedule (one activity per hour)
schedule = [];
schedule[0] = Activity.SLEEP;  // 00:00
schedule[1] = Activity.SLEEP;  // 01:00
schedule[2] = Activity.SLEEP;  // 02:00
schedule[3] = Activity.SLEEP;  // 03:00
schedule[4] = Activity.SLEEP;  // 04:00
schedule[5] = Activity.SLEEP;  // 05:00
schedule[6] = Activity.CLEAN;  // 06:00 - Morning hygiene
schedule[7] = Activity.EAT;    // 07:00 - Breakfast
schedule[8] = Activity.WORK;   // 08:00
schedule[9] = Activity.WORK;   // 09:00
schedule[10] = Activity.WORK;  // 10:00
schedule[11] = Activity.WORK;  // 11:00
schedule[12] = Activity.EAT;   // 12:00 - Lunch
schedule[13] = Activity.FREE;  // 13:00
schedule[14] = Activity.YARD;  // 14:00 - Yard time
schedule[15] = Activity.YARD;  // 15:00
schedule[16] = Activity.FREE;  // 16:00
schedule[17] = Activity.FREE;  // 17:00
schedule[18] = Activity.EAT;   // 18:00 - Dinner
schedule[19] = Activity.FREE;  // 19:00
schedule[20] = Activity.CLEAN; // 20:00 - Evening hygiene
schedule[21] = Activity.FREE;  // 21:00
schedule[22] = Activity.SLEEP; // 22:00
schedule[23] = Activity.SLEEP; // 23:00

// Display settings (bottom-left position)
display_x = 20;
display_y = 500;  // Bottom of screen for schedule visibility
block_width = 50;
block_height = 20;
blocks_per_row = 12; // Display 12 hours per row

// Current activity tracking
game_hour = 0;
game_activity = Activity.SLEEP;

// Reference to time system
time_system = noone;