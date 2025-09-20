// obj_schedule_display Draw GUI Event
// Schedule always visible at fixed position (bottom-left)

// Debug: Log that Draw GUI is running
show_debug_message("[SCHEDULE] Draw GUI event executing at frame " + string(current_time));

// Get current hour from time system
if (!instance_exists(obj_time_system)) {
    time_system = instance_find(obj_time_system, 0);
}

if (instance_exists(obj_time_system)) {
    game_hour = obj_time_system.game_hour;
    game_activity = schedule[game_hour];
}

// Get GUI dimensions for proper positioning
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

// Get animated X position from UI controller
if (instance_exists(obj_ui_controller)) {
    display_x = obj_ui_controller.schedule_x_current;
} else {
    display_x = -650; // Default to off-screen if no UI controller
}
display_y = gui_height - 200; // Reduced offset to ensure visibility

// Draw semi-transparent background for visibility (adjusted height)
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(display_x - 10, display_y - 5, display_x + 620, display_y + 160, false);
draw_set_alpha(1);

// Draw schedule title (moved up since we removed current activity line)
draw_set_color(c_white);
draw_text(display_x, display_y + 10, "Daily Schedule");

// Draw schedule grid (moved up since we removed current activity line)
var grid_y = display_y + 35;
for (var i = 0; i < 24; i++) {
    var row = floor(i / blocks_per_row);
    var col = i mod blocks_per_row;
    var block_x = display_x + (col * (block_width + 2));
    var block_y = grid_y + (row * (block_height + 2));

    // Draw block background
    draw_set_color(activity_colors[schedule[i]]);
    draw_rectangle(block_x, block_y, block_x + block_width, block_y + block_height, false);

    // Highlight current hour
    if (i == game_hour) {
        draw_set_color(c_white);
        draw_rectangle(block_x - 2, block_y - 2, block_x + block_width + 2, block_y + block_height + 2, true);
        draw_rectangle(block_x - 1, block_y - 1, block_x + block_width + 1, block_y + block_height + 1, true);
    }

    // Draw hour label
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(block_x + block_width/2, block_y + block_height/2, string(i));
}

// Draw legend (vertical layout to prevent overlap)
var legend_y = grid_y + 60;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(display_x, legend_y, "Legend:");

// Use two columns for the legend
for (var j = 0; j < array_length(activity_names); j++) {
    var column = floor(j / 3); // 3 items per column
    var row = j mod 3;
    var legend_item_x = display_x + 80 + (column * 120); // Two columns with spacing
    var legend_item_y = legend_y + (row * 18); // Vertical spacing of 18 pixels

    // Draw color box
    draw_set_color(activity_colors[j]);
    draw_rectangle(legend_item_x, legend_item_y, legend_item_x + 12, legend_item_y + 12, false);

    // Draw label
    draw_set_color(c_white);
    draw_text(legend_item_x + 16, legend_item_y, activity_names[j]);
}

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);