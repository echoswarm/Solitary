// obj_money_display Draw GUI Event

// Draw money display on right side of top bar
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

// Format money text
var money_text = "Money: $" + string(money);

// Draw the money
draw_text(display_x, display_y, money_text);

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);