// obj_money_display Draw GUI Event

// Get GUI dimensions and calculate position
var gui_width = display_get_gui_width();
var display_x = gui_width - 100;  // 100 pixels from right edge
var display_y = 30;

// Draw semi-transparent background for money visibility
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(display_x - 10, display_y - 10, display_x + 80, display_y + 20, false);
draw_set_alpha(1);

// Draw money display at top right with icon
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw money amount with $ symbol prefix
draw_text(display_x, display_y, "$" + string(money));

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);