// obj_money_display Draw GUI Event

// Draw semi-transparent background for money visibility
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(1170, 20, 1260, 50, false);
draw_set_alpha(1);

// Draw money display at top right with icon
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw money amount with $ symbol prefix
draw_text(1180, 30, "$" + string(money));

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);