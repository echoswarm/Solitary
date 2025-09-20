// obj_needs_display Draw GUI Event

// Draw needs title
draw_set_color(c_white);
draw_text(display_x, display_y - 25, "Inmate Needs");

// Helper function to draw a need bar
var draw_need_bar = function(_x, _y, _value, _label, _is_critical) {
    // Draw label
    draw_set_color(c_white);
    draw_text(_x, _y - 15, _label + ": " + string(floor(_value)) + "%");

    // Draw bar background (empty bar)
    draw_set_color(c_gray);
    draw_rectangle(_x, _y, _x + bar_width, _y + bar_height, false);

    // Determine bar color based on value
    var bar_color = c_green;
    if (_value < critical_threshold) {
        // Flash red for critical
        if (_is_critical && flash_timer < flash_duration) {
            bar_color = c_red;
        } else {
            bar_color = c_maroon;
        }
    } else if (_value < warning_threshold) {
        bar_color = c_yellow;
    }

    // Draw filled portion of bar
    if (_value > 0) {
        draw_set_color(bar_color);
        var fill_width = (bar_width * _value) / 100;
        draw_rectangle(_x, _y, _x + fill_width, _y + bar_height, false);
    }

    // Draw bar border
    draw_set_color(c_white);
    draw_rectangle(_x, _y, _x + bar_width, _y + bar_height, true);
};

// Draw hunger bar
var hunger_y = display_y;
var is_hunger_critical = hunger < warning_threshold;
draw_need_bar(display_x, hunger_y, hunger, "Hunger", is_hunger_critical);

// Draw cleanliness bar
var cleanliness_y = display_y + bar_height + bar_spacing;
var is_clean_critical = cleanliness < warning_threshold;
draw_need_bar(display_x, cleanliness_y, cleanliness, "Cleanliness", is_clean_critical);

// Draw warning messages if needed
if (hunger < critical_threshold || cleanliness < critical_threshold) {
    draw_set_color(c_red);
    draw_text(display_x, cleanliness_y + bar_height + 20, "CRITICAL CONDITION!");
} else if (hunger < warning_threshold || cleanliness < warning_threshold) {
    draw_set_color(c_yellow);
    draw_text(display_x, cleanliness_y + bar_height + 20, "Warning: Needs Low");
}