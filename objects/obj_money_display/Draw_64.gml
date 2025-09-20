// obj_money_display Draw GUI Event

// Draw money display at top right
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

// Format money text
var money_text = "$" + string(money);

// Draw money icon and amount (simple)
draw_text(display_x, display_y, money_text);

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);