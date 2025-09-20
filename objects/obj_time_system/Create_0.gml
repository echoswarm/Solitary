// obj_time_system Create Event

// Time variables
current_hour = 6; // Start at 6 AM
current_minute = 0;
current_day = 1;
max_days = 5; // Win condition

// Time speed (1 real second = 1 game minute)
time_accumulator = 0;
seconds_per_minute = 1;

// Display position
clock_x = room_width / 2;
clock_y = 32;