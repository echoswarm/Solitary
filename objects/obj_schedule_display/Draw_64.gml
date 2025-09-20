// obj_schedule_display Draw GUI Event

// Get current hour from time system
if (!instance_exists(obj_time_system)) {
    time_system = instance_find(obj_time_system, 0);
}

if (instance_exists(obj_time_system)) {
    current_hour = obj_time_system.hours;
    current_activity = schedule[current_hour];
}

// Draw schedule title
draw_set_color(c_white);
draw_text(display_x, display_y - 25, "Daily Schedule");

// Draw current activity prominently
draw_set_color(activity_colors[current_activity]);
draw_rectangle(display_x, display_y - 5, display_x + 200, display_y + 25, false);
draw_set_color(c_white);
draw_text(display_x + 5, display_y, "Current: " + activity_names[current_activity] + " (" + string(current_hour) + ":00)");

// Draw schedule grid
var grid_y = display_y + 40;
for (var i = 0; i < 24; i++) {
    var row = floor(i / blocks_per_row);
    var col = i mod blocks_per_row;
    var block_x = display_x + (col * (block_width + 2));
    var block_y = grid_y + (row * (block_height + 2));

    // Draw block background
    draw_set_color(activity_colors[schedule[i]]);
    draw_rectangle(block_x, block_y, block_x + block_width, block_y + block_height, false);

    // Highlight current hour
    if (i == current_hour) {
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
    var legend_item_y = legend_y + 20 + (j * 15);
    // Draw color box
    draw_set_color(activity_colors[j]);
    draw_rectangle(display_x, legend_item_y, display_x + 10, legend_item_y + 10, false);
    // Draw label
    draw_set_color(c_white);
    draw_text(display_x + 15, legend_item_y, activity_names[j]);
}

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);