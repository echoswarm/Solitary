// obj_money_display Draw GUI Event

// Debug: Log that Draw GUI is running
show_debug_message("[MONEY] Draw GUI event executing at frame " + string(current_time));

// Position at top-left corner
var display_x = 20;  // 20 pixels from left edge
var display_y = 20;  // 20 pixels from top edge

// Draw semi-transparent background for money visibility
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(display_x - 10, display_y - 10, display_x + 120, display_y + 40, false);
draw_set_alpha(1);

// Draw money icon sprite directly using spr_money_icon
if (sprite_exists(spr_money_icon)) {
    draw_sprite(spr_money_icon, 0, display_x + 16, display_y + 16);
}

// Draw money amount as simple number (no $ or formatting)
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Position text next to the icon with more spacing (assuming icon is 32x32)
var text_x = display_x + 40;  // Position after icon
var text_y = display_y + 16;  // Center vertically with icon

draw_text(text_x, text_y, string(money));

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);