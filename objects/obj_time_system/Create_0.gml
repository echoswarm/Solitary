// obj_time_system Create Event

// Time variables
game_hour = 6; // Start at 6 AM
game_minute = 0;
game_day = 1;
max_days = 5; // Win condition

// Time speed (1 real second = 1 game minute)
time_accumulator = 0;
seconds_per_minute = 1;

// Display position (centered on top UI bar)
clock_x = 640;
clock_y = 20;

// Game state
paused = false;