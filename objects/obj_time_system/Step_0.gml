// obj_time_system Step Event

// Don't advance time if paused
if (paused) {
    exit;
}

// Advance time
time_accumulator += delta_time / 1000000; // Convert to seconds

if (time_accumulator >= seconds_per_minute) {
    time_accumulator -= seconds_per_minute;
    game_minute++;

    // Handle minute rollover
    if (game_minute >= 60) {
        game_minute = 0;
        game_hour++;

        // Handle hour rollover
        if (game_hour >= 24) {
            game_hour = 0;
            game_day++;
        }
    }
}