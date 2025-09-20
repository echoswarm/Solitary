// obj_schedule_display Draw GUI Event

// Get current hour from time system
if (!instance_exists(obj_time_system)) {
    time_system = instance_find(obj_time_system, 0);
}

if (instance_exists(obj_time_system)) {
    game_hour = obj_time_system.game_hour;
    game_activity = schedule[game_hour];
}

// Get UI controller for animation state
var ui_controller = instance_find(obj_ui_controller, 0);
if (!instance_exists(ui_controller)) {
    return; // Exit if no UI controller
}

// Get GUI dimensions for proper positioning
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

// Use animated Y position from UI controller
display_x = 20;
display_y = ui_controller.schedule_y_current;

// Only draw if schedule is on-screen (when expanded or animating to expanded)
if (display_y >= gui_height) {
    return; // Don't draw if completely off-screen
}

// Calculate what to show based on expansion state
var show_full_schedule = ui_controller.ui_expanded || (ui_controller.anim_active && ui_controller.anim_target_expanded);

// Calculate background height based on what we're showing
var bg_height = 40; // Height for just current activity
if (show_full_schedule) {
    bg_height = 250; // Full height for expanded view
}

// Draw semi-transparent background for visibility
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(display_x - 10, display_y - 5, display_x + 620, display_y + bg_height, false);
draw_set_alpha(1);

// Always draw current activity at the bottom
draw_set_color(c_white);
draw_text(display_x, display_y + 10, "Current: " + activity_names[game_activity] + " (" + string(game_hour) + ":00)");

// Only draw the rest if expanded or animating
if (show_full_schedule) {
    // Calculate alpha based on animation progress
    var content_alpha = 1;
    if (ui_controller.anim_active) {
        if (ui_controller.anim_target_expanded) {
            content_alpha = ui_controller.anim_progress;
        } else {
            content_alpha = 1 - ui_controller.anim_progress;
        }
    }

    draw_set_alpha(content_alpha);

    // Draw schedule title
    draw_set_color(c_white);
    draw_text(display_x, display_y + 40, "Daily Schedule");

    // Draw schedule grid
    var grid_y = display_y + 65;
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

    // Draw legend
    var legend_y = grid_y + 60;
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(display_x, legend_y, "Legend:");

    for (var j = 0; j < array_length(activity_names); j++) {
        var legend_item_x = display_x + 80 + (j * 90); // Horizontal layout
        var legend_item_y = legend_y;

        // Draw color box
        draw_set_color(activity_colors[j]);
        draw_rectangle(legend_item_x, legend_item_y, legend_item_x + 10, legend_item_y + 10, false);

        // Draw label
        draw_set_color(c_white);
        draw_text(legend_item_x + 15, legend_item_y, activity_names[j]);
    }

    draw_set_alpha(1);
}

// DEBUG: Show schedule position
draw_set_color(c_yellow);
draw_set_alpha(1);
draw_text(10, 30, "Schedule Debug: Y=" + string(display_y) + " Expanded=" + string(ui_controller.ui_expanded));

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);