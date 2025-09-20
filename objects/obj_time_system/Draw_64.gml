// obj_time_system Draw GUI Event

// Draw time display at top center
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Format time string
var hour_str = string(game_hour);
if (game_hour < 10) hour_str = "0" + hour_str;

var minute_str = string(game_minute);
if (game_minute < 10) minute_str = "0" + minute_str;

var time_text = "Day " + string(game_day) + " - " + hour_str + ":" + minute_str;

// Draw text directly (simple, no background)
draw_text(clock_x, clock_y, time_text);

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);