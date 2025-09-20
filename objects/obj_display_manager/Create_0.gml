/// @description Initialize Display Manager

// Base resolution
base_width = 1280;
base_height = 720;

// Aspect ratio
aspect_ratio = base_width / base_height;

// Window size
window_width = base_width;
window_height = base_height;

// Fullscreen state
is_fullscreen = false;

// Set initial window size
window_set_size(window_width, window_height);

// Center window on screen
var display_width = display_get_width();
var display_height = display_get_height();
window_set_position((display_width - window_width) / 2, (display_height - window_height) / 2);

// Enable window resizing
window_set_min_width(640);
window_set_min_height(360);

// Set application surface size
surface_resize(application_surface, base_width, base_height);

// Previous window size (for detecting resize)
prev_window_width = window_width;
prev_window_height = window_height;

// Stored window position and size for fullscreen toggle
stored_window_x = window_get_x();
stored_window_y = window_get_y();
stored_window_width = window_width;
stored_window_height = window_height;