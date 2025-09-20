// obj_needs_display Draw GUI Event

// Simple bars for hunger and cleanliness
draw_set_color(c_white);

// Draw hunger bar
var hunger_label = "Hunger: " + string(floor(hunger)) + "%";
draw_text(display_x, display_y, hunger_label);

// Draw hunger bar background
draw_set_color(c_gray);
draw_rectangle(display_x, display_y + 15, display_x + bar_width, display_y + 15 + bar_height, false);

// Draw hunger bar fill
if (hunger > 0) {
    if (hunger < critical_threshold) {
        draw_set_color(c_red);
    } else if (hunger < warning_threshold) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_green);
    }
    var hunger_fill = (bar_width * hunger) / 100;
    draw_rectangle(display_x, display_y + 15, display_x + hunger_fill, display_y + 15 + bar_height, false);
}

// Draw hunger bar border
draw_set_color(c_white);
draw_rectangle(display_x, display_y + 15, display_x + bar_width, display_y + 15 + bar_height, true);

// Draw cleanliness bar (offset below hunger)
var clean_y = display_y + 35;
var clean_label = "Clean: " + string(floor(cleanliness)) + "%";
draw_text(display_x, clean_y, clean_label);

// Draw cleanliness bar background
draw_set_color(c_gray);
draw_rectangle(display_x, clean_y + 15, display_x + bar_width, clean_y + 15 + bar_height, false);

// Draw cleanliness bar fill
if (cleanliness > 0) {
    if (cleanliness < critical_threshold) {
        draw_set_color(c_red);
    } else if (cleanliness < warning_threshold) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_green);
    }
    var clean_fill = (bar_width * cleanliness) / 100;
    draw_rectangle(display_x, clean_y + 15, display_x + clean_fill, clean_y + 15 + bar_height, false);
}

// Draw cleanliness bar border
draw_set_color(c_white);
draw_rectangle(display_x, clean_y + 15, display_x + bar_width, clean_y + 15 + bar_height, true);