// obj_needs_display Draw GUI Event

// No title needed for top bar display

// Helper function to draw a need bar
var draw_need_bar = function(_x, _y, _value, _label, _is_critical) {
    // Draw label (compact for top bar)
    draw_set_color(c_white);
    draw_set_font(-1);
    draw_text(_x, _y - 12, _label + ": " + string(floor(_value)) + "%");

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

// Adjust bar size for top panel
bar_width = 100;
bar_height = 15;

// Draw hunger bar horizontally
var hunger_x = display_x;
var hunger_y = display_y + 15;
var is_hunger_critical = hunger < warning_threshold;
draw_need_bar(hunger_x, hunger_y, hunger, "Hunger", is_hunger_critical);

// Draw cleanliness bar horizontally next to hunger
var cleanliness_x = display_x + bar_width + 30;
var cleanliness_y = display_y + 15;
var is_clean_critical = cleanliness < warning_threshold;
draw_need_bar(cleanliness_x, cleanliness_y, cleanliness, "Clean", is_clean_critical);

// Warning indicators drawn as small text next to bars if critical
if (hunger < critical_threshold || cleanliness < critical_threshold) {
    draw_set_color(c_red);
    draw_text(display_x + bar_width * 2 + 60, display_y + 20, "CRITICAL!");
}