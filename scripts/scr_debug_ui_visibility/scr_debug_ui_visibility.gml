// scr_debug_ui_visibility - Debug script to verify UI element visibility

function debug_ui_visibility() {
    var debug_message = "UI Display Visibility Check:\n";

    // Check money display
    if (instance_exists(obj_money_display)) {
        var money_obj = instance_find(obj_money_display, 0);
        debug_message += "Money Display: EXISTS | Visible: " + string(money_obj.visible) + "\n";
        debug_message += "  Position: x=" + string(money_obj.x) + ", y=" + string(money_obj.y) + "\n";
        debug_message += "  Money value: " + string(money_obj.money) + "\n";
    } else {
        debug_message += "Money Display: MISSING\n";
    }

    // Check schedule display
    if (instance_exists(obj_schedule_display)) {
        var schedule_obj = instance_find(obj_schedule_display, 0);
        debug_message += "Schedule Display: EXISTS | Visible: " + string(schedule_obj.visible) + "\n";
        debug_message += "  Position: x=" + string(schedule_obj.x) + ", y=" + string(schedule_obj.y) + "\n";
    } else {
        debug_message += "Schedule Display: MISSING\n";
    }

    // Check needs display
    if (instance_exists(obj_needs_display)) {
        var needs_obj = instance_find(obj_needs_display, 0);
        debug_message += "Needs Display: EXISTS | Visible: " + string(needs_obj.visible) + "\n";
        debug_message += "  Position: x=" + string(needs_obj.x) + ", y=" + string(needs_obj.y) + "\n";
        debug_message += "  Hunger: " + string(needs_obj.hunger) + "\n";
        debug_message += "  Cleanliness: " + string(needs_obj.cleanliness) + "\n";
    } else {
        debug_message += "Needs Display: MISSING\n";
    }

    // Check display manager
    if (instance_exists(obj_display_manager)) {
        debug_message += "Display Manager: EXISTS\n";
    } else {
        debug_message += "Display Manager: MISSING\n";
    }

    // Check time system
    if (instance_exists(obj_time_system)) {
        var time_obj = instance_find(obj_time_system, 0);
        debug_message += "Time System: EXISTS\n";
        debug_message += "  Current hour: " + string(time_obj.game_hour) + "\n";
    } else {
        debug_message += "Time System: MISSING\n";
    }

    show_debug_message(debug_message);

    // Also draw on screen for debugging
    return debug_message;
}