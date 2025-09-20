// obj_time_system Draw GUI Event

// Get viewport dimensions for proper centering
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var center_x = gui_width / 2;

// Draw semi-transparent background for clock visibility
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(center_x - 100, 20, center_x + 100, 50, false);
draw_set_alpha(1);

// Draw time display at top center - ensure visibility
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Format time string
var hour_str = string(game_hour);
if (game_hour < 10) hour_str = "0" + hour_str;

var minute_str = string(game_minute);
if (game_minute < 10) minute_str = "0" + minute_str;

var time_text = "Day " + string(game_day) + " - " + hour_str + ":" + minute_str;

// Draw with explicit position at top center
draw_text(center_x, 30, time_text);

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);