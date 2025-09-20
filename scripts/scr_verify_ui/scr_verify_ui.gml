// Script to verify UI elements are properly configured
// Run this in the game to check UI visibility

function scr_verify_ui() {
    var ui_report = "UI VERIFICATION REPORT:\n";
    ui_report += "======================\n\n";

    // Check Time System (Clock)
    if (instance_exists(obj_time_system)) {
        ui_report += "✓ Time System: FOUND\n";
        ui_report += "  - Position: Top Center\n";
        ui_report += "  - Instance Count: " + string(instance_number(obj_time_system)) + "\n";
        if (instance_number(obj_time_system) > 1) {
            ui_report += "  ⚠ WARNING: Multiple instances detected!\n";
        }
    } else {
        ui_report += "✗ Time System: NOT FOUND\n";
    }

    // Check Money Display
    if (instance_exists(obj_money_display)) {
        ui_report += "\n✓ Money Display: FOUND\n";
        ui_report += "  - Position: Top Right\n";
        ui_report += "  - Instance Count: " + string(instance_number(obj_money_display)) + "\n";
        if (instance_number(obj_money_display) > 1) {
            ui_report += "  ⚠ WARNING: Multiple instances detected!\n";
        }
    } else {
        ui_report += "\n✗ Money Display: NOT FOUND\n";
    }

    // Check Needs Display
    if (instance_exists(obj_needs_display)) {
        ui_report += "\n✓ Needs Display: FOUND\n";
        ui_report += "  - Position: Top Right (left of money)\n";
        ui_report += "  - Instance Count: " + string(instance_number(obj_needs_display)) + "\n";
        if (instance_number(obj_needs_display) > 1) {
            ui_report += "  ⚠ WARNING: Multiple instances detected!\n";
        }
    } else {
        ui_report += "\n✗ Needs Display: NOT FOUND\n";
    }

    // Check Schedule Display
    if (instance_exists(obj_schedule_display)) {
        ui_report += "\n✓ Schedule Display: FOUND\n";
        ui_report += "  - Position: Bottom Left\n";
        ui_report += "  - Instance Count: " + string(instance_number(obj_schedule_display)) + "\n";
        if (instance_number(obj_schedule_display) > 1) {
            ui_report += "  ⚠ WARNING: Multiple instances detected!\n";
        }
    } else {
        ui_report += "\n✗ Schedule Display: NOT FOUND\n";
    }

    // Check UI Controller
    if (instance_exists(obj_ui_controller)) {
        ui_report += "\n✓ UI Controller: FOUND\n";
        ui_report += "  - Instance Count: " + string(instance_number(obj_ui_controller)) + "\n";
        if (instance_number(obj_ui_controller) > 1) {
            ui_report += "  ⚠ WARNING: Multiple instances detected!\n";
        }
    } else {
        ui_report += "\n✗ UI Controller: NOT FOUND\n";
    }

    // Check Display Manager
    if (instance_exists(obj_display_manager)) {
        ui_report += "\n✓ Display Manager: FOUND\n";
        ui_report += "  - Instance Count: " + string(instance_number(obj_display_manager)) + "\n";
        if (instance_number(obj_display_manager) > 1) {
            ui_report += "  ⚠ WARNING: Multiple instances detected!\n";
        }
    } else {
        ui_report += "\n✗ Display Manager: NOT FOUND\n";
    }

    ui_report += "\n======================\n";
    ui_report += "GUI Dimensions: " + string(display_get_gui_width()) + " x " + string(display_get_gui_height()) + "\n";
    ui_report += "View Dimensions: " + string(view_wview[0]) + " x " + string(view_hview[0]) + "\n";

    return ui_report;
}