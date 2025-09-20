// obj_ui_controller Draw GUI Event
// Keep minimal - let individual objects handle their own drawing

// Debug display (remove in production)
if (keyboard_check(ord("D"))) {
    draw_set_color(c_yellow);
    draw_set_alpha(1);
    draw_text(10, 100, "UI Expanded: " + string(ui_expanded));
    draw_text(10, 120, "Animation Active: " + string(anim_active));
    draw_text(10, 140, "Animation Progress: " + string(anim_progress));
    draw_text(10, 160, "Schedule Y: " + string(schedule_y_current));
    draw_text(10, 180, "Needs X: " + string(needs_x_current));
    draw_text(10, 200, "Press TAB to toggle UI");
    draw_set_color(c_white);
}