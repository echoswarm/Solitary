// obj_ui_controller Step Event

// Handle TAB key press to toggle UI expansion
if (keyboard_check_pressed(vk_tab)) {
    // Toggle the state
    ui_expanded = !ui_expanded;

    // Start animation
    anim_active = true;
    anim_timer = 0;
    anim_start_expanded = !ui_expanded; // Previous state
    anim_target_expanded = ui_expanded;  // New state
}

// Update animation
if (anim_active) {
    // Advance timer
    anim_timer += delta_time / 1000000; // Convert microseconds to seconds

    // Calculate progress
    anim_progress = min(anim_timer / anim_duration, 1);

    // Apply easing function (ease in-out)
    var eased_progress = anim_progress * anim_progress * (3.0 - 2.0 * anim_progress);

    // Update positions based on animation progress
    var gui_height = display_get_gui_height();
    var gui_width = display_get_gui_width();

    // Schedule display animation (slides up from bottom)
    schedule_y_collapsed = gui_height + 10;  // Off-screen when collapsed (clock stays visible at top)
    schedule_y_expanded = gui_height - 280;   // Show full schedule pushing clock up

    if (anim_target_expanded) {
        // Animating to expanded
        schedule_y_current = lerp(schedule_y_collapsed, schedule_y_expanded, eased_progress);
    } else {
        // Animating to collapsed
        schedule_y_current = lerp(schedule_y_expanded, schedule_y_collapsed, eased_progress);
    }

    // Needs display animation (slides in from right)
    needs_x_collapsed = gui_width + 50;  // Off-screen right
    needs_x_expanded = gui_width - 250;  // Visible position

    if (anim_target_expanded) {
        // Animating to expanded
        needs_x_current = lerp(needs_x_collapsed, needs_x_expanded, eased_progress);
    } else {
        // Animating to collapsed
        needs_x_current = lerp(needs_x_expanded, needs_x_collapsed, eased_progress);
    }

    // Check if animation is complete
    if (anim_progress >= 1) {
        anim_active = false;
        anim_timer = 0;
        anim_progress = 0;
    }
} else {
    // Set static positions when not animating
    var gui_height = display_get_gui_height();
    var gui_width = display_get_gui_width();

    schedule_y_collapsed = gui_height + 10;  // Off-screen when collapsed
    schedule_y_expanded = gui_height - 280;  // Visible when expanded
    needs_x_collapsed = gui_width + 50;
    needs_x_expanded = gui_width - 250;

    if (ui_expanded) {
        schedule_y_current = schedule_y_expanded;
        needs_x_current = needs_x_expanded;
    } else {
        schedule_y_current = schedule_y_collapsed;
        needs_x_current = needs_x_collapsed;
    }
}