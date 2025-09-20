// obj_time_system Step Event

// Advance time
time_accumulator += delta_time / 1000000; // Convert to seconds

if (time_accumulator >= seconds_per_minute) {
    time_accumulator -= seconds_per_minute;
    current_minute++;

    // Handle minute rollover
    if (current_minute >= 60) {
        current_minute = 0;
        current_hour++;

        // Handle hour rollover
        if (current_hour >= 24) {
            current_hour = 0;
            current_day++;
        }
    }
}