// obj_time_system Draw GUI Event

// Draw time display
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Format time string
var hour_str = string(current_hour);
if (current_hour < 10) hour_str = "0" + hour_str;

var minute_str = string(current_minute);
if (current_minute < 10) minute_str = "0" + minute_str;

var time_text = "Day " + string(current_day) + " - " + hour_str + ":" + minute_str;

// Draw background box
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(clock_x - 80, clock_y - 5, clock_x + 80, clock_y + 25, false);

// Draw text
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(clock_x, clock_y, time_text);

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);