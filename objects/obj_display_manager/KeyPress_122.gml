/// @description Toggle Fullscreen (F11)

is_fullscreen = !is_fullscreen;

if (is_fullscreen) {
    // Store current window state
    stored_window_x = window_get_x();
    stored_window_y = window_get_y();
    stored_window_width = window_get_width();
    stored_window_height = window_get_height();

    // Go fullscreen
    window_set_fullscreen(true);
} else {
    // Exit fullscreen
    window_set_fullscreen(false);

    // Restore window state
    window_set_size(stored_window_width, stored_window_height);
    window_set_position(stored_window_x, stored_window_y);
}