/// @description Draw Letterboxing

// Draw black bars for letterboxing
draw_set_color(c_black);

// Calculate current viewport
var scale_x = window_width / base_width;
var scale_y = window_height / base_height;
var scale = min(scale_x, scale_y);

var viewport_width = base_width * scale;
var viewport_height = base_height * scale;

var viewport_x = (window_width - viewport_width) / 2;
var viewport_y = (window_height - viewport_height) / 2;

// Draw letterbox bars
if (viewport_x > 0) {
    // Left bar
    draw_rectangle(0, 0, viewport_x - 1, window_height, false);
    // Right bar
    draw_rectangle(viewport_x + viewport_width, 0, window_width, window_height, false);
}

if (viewport_y > 0) {
    // Top bar
    draw_rectangle(0, 0, window_width, viewport_y - 1, false);
    // Bottom bar
    draw_rectangle(0, viewport_y + viewport_height, window_width, window_height, false);
}

// Reset draw color
draw_set_color(c_white);