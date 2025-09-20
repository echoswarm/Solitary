// obj_ui_controller Draw GUI Event

// Draw top UI panel bar across the screen
if (sprite_exists(spr_ui_panel)) {
    draw_sprite_stretched(spr_ui_panel, 0, 0, 0, 1280, 60);
} else {
    // Fallback if sprite doesn't exist - draw a dark bar
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, 1280, 60, false);
    draw_set_alpha(1);

    // Draw border
    draw_set_color(c_white);
    draw_rectangle(0, 0, 1280, 60, true);
}