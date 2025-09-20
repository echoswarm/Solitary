// obj_money_display Draw GUI Event

// Position at top-left corner
var display_x = 20;  // 20 pixels from left edge
var display_y = 20;  // 20 pixels from top edge

// Draw semi-transparent background for money visibility
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(display_x - 10, display_y - 10, display_x + 120, display_y + 40, false);
draw_set_alpha(1);

// Draw money icon sprite
if (sprite_exists(sprite_index)) {
    draw_sprite(sprite_index, 0, display_x, display_y);
}

// Draw money amount as simple number (no $ or formatting)
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Position text next to the icon with more spacing (assuming icon is 32x32)
var text_x = display_x + 35;  // Move left a bit (was 40)
var text_y = display_y + 12;  // Move up a bit (was 16)

draw_text(text_x, text_y, string(money));

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);