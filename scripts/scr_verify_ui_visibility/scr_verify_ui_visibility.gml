// scr_verify_ui_visibility
// Verifies that UI objects are properly configured for Draw GUI visibility

function verify_ui_visibility() {
    var report = "\n=== UI VISIBILITY VERIFICATION REPORT ===\n";

    // Check obj_money_display
    var money_display = instance_find(obj_money_display, 0);
    if (instance_exists(money_display)) {
        report += "\n[MONEY DISPLAY]\n";
        report += "  - Instance exists: YES\n";
        report += "  - Visible: " + (money_display.visible ? "YES" : "NO (ERROR!)") + "\n";
        report += "  - Sprite index: " + string(money_display.sprite_index) + "\n";
        report += "  - Money value: " + string(money_display.money) + "\n";
        report += "  - Position: (" + string(money_display.x) + ", " + string(money_display.y) + ")\n";
    } else {
        report += "\n[MONEY DISPLAY] - NOT FOUND IN ROOM!\n";
    }

    // Check obj_schedule_display
    var schedule_display = instance_find(obj_schedule_display, 0);
    if (instance_exists(schedule_display)) {
        report += "\n[SCHEDULE DISPLAY]\n";
        report += "  - Instance exists: YES\n";
        report += "  - Visible: " + (schedule_display.visible ? "YES" : "NO (ERROR!)") + "\n";
        report += "  - Sprite index: " + string(schedule_display.sprite_index) + "\n";
        report += "  - Current activity: " + string(schedule_display.game_activity) + "\n";
        report += "  - Current hour: " + string(schedule_display.game_hour) + "\n";
        report += "  - Position: (" + string(schedule_display.x) + ", " + string(schedule_display.y) + ")\n";
    } else {
        report += "\n[SCHEDULE DISPLAY] - NOT FOUND IN ROOM!\n";
    }

    // Check obj_needs_display
    var needs_display = instance_find(obj_needs_display, 0);
    if (instance_exists(needs_display)) {
        report += "\n[NEEDS DISPLAY]\n";
        report += "  - Instance exists: YES\n";
        report += "  - Visible: " + (needs_display.visible ? "YES" : "NO (ERROR!)") + "\n";
        report += "  - Sprite index: " + string(needs_display.sprite_index) + "\n";
        report += "  - Hunger: " + string(needs_display.hunger) + "\n";
        report += "  - Cleanliness: " + string(needs_display.cleanliness) + "\n";
        report += "  - Position: (" + string(needs_display.x) + ", " + string(needs_display.y) + ")\n";
    } else {
        report += "\n[NEEDS DISPLAY] - NOT FOUND IN ROOM!\n";
    }

    // Check obj_time_system
    var time_system = instance_find(obj_time_system, 0);
    if (instance_exists(time_system)) {
        report += "\n[TIME SYSTEM]\n";
        report += "  - Instance exists: YES\n";
        report += "  - Current hour: " + string(time_system.game_hour) + "\n";
        report += "  - Current minute: " + string(time_system.game_minute) + "\n";
    } else {
        report += "\n[TIME SYSTEM] - NOT FOUND IN ROOM!\n";
    }

    // Check GUI dimensions
    report += "\n[GUI SETTINGS]\n";
    report += "  - GUI Width: " + string(display_get_gui_width()) + "\n";
    report += "  - GUI Height: " + string(display_get_gui_height()) + "\n";
    report += "  - Window Width: " + string(window_get_width()) + "\n";
    report += "  - Window Height: " + string(window_get_height()) + "\n";

    report += "\n=== END OF REPORT ===\n";

    // Output to debug console
    show_debug_message(report);

    // Also return the report string
    return report;
}