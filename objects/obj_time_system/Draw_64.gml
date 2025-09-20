// obj_time_system Draw GUI Event
// CLOCK ALWAYS DRAWS - never hidden

// Get viewport dimensions for proper centering
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var center_x = gui_width / 2;

// Clock normally at TOP of screen
var clock_y_normal = 20;
var clock_y = clock_y_normal;

// Get UI controller to check if schedule is pushing clock up
var ui_controller = instance_find(obj_ui_controller, 0);
if (instance_exists(ui_controller)) {
    // When schedule is expanded, move clock up slightly
    if (ui_controller.ui_expanded) {
        clock_y = clock_y_normal - 260; // Move up when schedule is showing
    } else if (ui_controller.anim_active) {
        // Animate the clock movement
        var offset = 260 * ui_controller.anim_progress;
        if (ui_controller.anim_target_expanded) {
            clock_y = clock_y_normal - offset;
        } else {
            clock_y = (clock_y_normal - 260) + offset;
        }
    }
}

// Calculate text position (centered in background)
var clock_text_y = clock_y + 10;

// Draw semi-transparent background for clock visibility
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(center_x - 100, clock_y, center_x + 100, clock_y + 30, false);
draw_set_alpha(1);

// Draw time display at calculated position
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Format time string
var hour_str = string(game_hour);
if (game_hour < 10) hour_str = "0" + hour_str;

var minute_str = string(game_minute);
if (game_minute < 10) minute_str = "0" + minute_str;

var time_text = "Day " + string(game_day) + " - " + hour_str + ":" + minute_str;

// Draw with calculated position
draw_text(center_x, clock_text_y, time_text);

// DEBUG: Also draw a simple test to confirm Draw_64 is working
draw_set_color(c_yellow);
draw_text(10, 10, "Clock Debug: Y=" + string(clock_y));

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);