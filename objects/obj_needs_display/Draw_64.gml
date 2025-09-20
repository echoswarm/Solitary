// obj_needs_display Draw GUI Event

// Get GUI dimensions for positioning
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

// Position to the left of money display (top right area)
var display_x = gui_width - 250;  // Further left than money
var display_y = 30;
var bar_width = 80;
var bar_height = 10;
var bar_spacing = 30;

// Draw needs bars background
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(display_x - 10, display_y - 10, display_x + bar_width + 40, display_y + bar_height * 2 + bar_spacing + 10, false);
draw_set_alpha(1);

// Draw Hunger Bar
draw_set_color(c_white);
draw_text(display_x, display_y - 5, "Hunger:");

// Determine hunger bar color
if (hunger < critical_threshold) {
    draw_set_color(c_red);
} else if (hunger < warning_threshold) {
    draw_set_color(c_yellow);
} else {
    draw_set_color(c_green);
}

// Flash if in warning state
if (flash_timer < flash_duration && hunger < warning_threshold) {
    draw_set_alpha(0.5);
}

// Draw hunger bar fill
draw_rectangle(display_x, display_y + 10, display_x + (bar_width * hunger / 100), display_y + 10 + bar_height, false);
draw_set_alpha(1);

// Draw hunger bar outline
draw_set_color(c_white);
draw_rectangle(display_x, display_y + 10, display_x + bar_width, display_y + 10 + bar_height, true);

// Draw Cleanliness Bar
draw_text(display_x, display_y + bar_spacing - 5, "Clean:");

// Determine cleanliness bar color
if (cleanliness < critical_threshold) {
    draw_set_color(c_red);
} else if (cleanliness < warning_threshold) {
    draw_set_color(c_yellow);
} else {
    draw_set_color(c_green);
}

// Flash if in warning state
if (flash_timer < flash_duration && cleanliness < warning_threshold) {
    draw_set_alpha(0.5);
}

// Draw cleanliness bar fill
draw_rectangle(display_x, display_y + bar_spacing + 10, display_x + (bar_width * cleanliness / 100), display_y + bar_spacing + 10 + bar_height, false);
draw_set_alpha(1);

// Draw cleanliness bar outline
draw_set_color(c_white);
draw_rectangle(display_x, display_y + bar_spacing + 10, display_x + bar_width, display_y + bar_spacing + 10 + bar_height, true);

// Reset draw settings
draw_set_color(c_white);
draw_set_alpha(1);

// Check if mouse is hovering over an inmate
var mouse_over_inmate = false;
var hover_inmate = noone;

// Convert GUI mouse position to world position
var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);

// Check all inmates
with (obj_inmate) {
    // Convert inmate position to screen coordinates (accounting for view)
    var inmate_screen_x = x - view_xview[0];
    var inmate_screen_y = y - view_yview[0];

    // Check if mouse is over this inmate (accounting for 2x scale)
    if (point_distance(gui_mouse_x, gui_mouse_y, inmate_screen_x, inmate_screen_y) < 64) {
        other.mouse_over_inmate = true;
        other.hover_inmate = id;
        break;
    }
}

// Only draw tooltip if hovering over an inmate
if (mouse_over_inmate && hover_inmate != noone) {
    // Calculate tooltip position near mouse
    var tooltip_x = gui_mouse_x + 20;
    var tooltip_y = gui_mouse_y - 60;

    // Ensure tooltip stays on screen
    if (tooltip_x + 150 > display_get_gui_width()) {
        tooltip_x = gui_mouse_x - 170;
    }
    if (tooltip_y < 10) {
        tooltip_y = gui_mouse_y + 20;
    }

    // Draw tooltip background
    draw_set_alpha(0.9);
    draw_set_color(c_black);
    draw_rectangle(tooltip_x, tooltip_y, tooltip_x + 150, tooltip_y + 80, false);

    // Draw tooltip border
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(tooltip_x, tooltip_y, tooltip_x + 150, tooltip_y + 80, true);

    // Draw tooltip title
    draw_text(tooltip_x + 5, tooltip_y + 5, "Inmate Needs:");

    // Draw hunger info
    var hunger_text = "Hunger: " + string(floor(hunger)) + "%";
    if (hunger < critical_threshold) {
        draw_set_color(c_red);
    } else if (hunger < warning_threshold) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_green);
    }
    draw_text(tooltip_x + 5, tooltip_y + 25, hunger_text);

    // Draw cleanliness info
    var clean_text = "Clean: " + string(floor(cleanliness)) + "%";
    if (cleanliness < critical_threshold) {
        draw_set_color(c_red);
    } else if (cleanliness < warning_threshold) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_green);
    }
    draw_text(tooltip_x + 5, tooltip_y + 45, clean_text);

    // Reset draw settings
    draw_set_color(c_white);
    draw_set_alpha(1);
}