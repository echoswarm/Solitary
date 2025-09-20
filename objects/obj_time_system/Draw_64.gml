// obj_time_system Draw GUI Event
// Clock always visible at fixed position (top center)

// Get viewport dimensions for proper centering
var gui_width = display_get_gui_width();
var center_x = gui_width / 2;

// Clock at fixed position - top of screen
var clock_y = 20;
var clock_text_y = clock_y + 10;

// Draw semi-transparent background for clock visibility (expanded for activity)
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(center_x - 100, clock_y, center_x + 100, clock_y + 48, false);
draw_set_alpha(1);

// Draw time display
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Format time string
var hour_str = string(game_hour);
if (game_hour < 10) hour_str = "0" + hour_str;

var minute_str = string(game_minute);
if (game_minute < 10) minute_str = "0" + minute_str;

var time_text = "Day " + string(game_day) + " - " + hour_str + ":" + minute_str;

// Draw time text
draw_text(center_x, clock_text_y, time_text);

// Get current activity from schedule display
if (instance_exists(obj_schedule_display)) {
    var schedule_obj = instance_find(obj_schedule_display, 0);
    var current_activity = schedule_obj.game_activity;
    var activity_name = schedule_obj.activity_names[current_activity];
    var activity_color = schedule_obj.activity_colors[current_activity];

    // Draw current activity below the time with its color
    draw_set_color(activity_color);
    draw_text(center_x, clock_text_y + 18, activity_name);
    draw_set_color(c_white);
}

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);