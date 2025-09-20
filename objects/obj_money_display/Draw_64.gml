// obj_money_display Draw GUI Event

// Draw money display at top right with icon
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw money icon (simple $ symbol as icon)
draw_text(1180, 30, "$");

// Draw money amount next to icon
draw_text(1220, 30, string(money));

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);