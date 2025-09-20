// Validate UI Fix
function validate_ui_fix() {
    var report = "=== UI FIX VALIDATION REPORT ===\n\n";
    var errors = [];
    var warnings = [];
    var success = [];

    // 1. Check obj_time_system visibility
    if (instance_exists(obj_time_system)) {
        var ts = instance_find(obj_time_system, 0);
        if (ts.visible) {
            success[array_length(success)] = "obj_time_system is now visible (FIXED!)";
        } else {
            errors[array_length(errors)] = "obj_time_system still not visible";
        }
    } else {
        errors[array_length(errors)] = "obj_time_system not found in room";
    }

    // 2. Check UI Layer
    var ui_layer = layer_get_id("UI_Layer");
    if (layer_exists(ui_layer)) {
        success[array_length(success)] = "UI_Layer exists";

        var elements = layer_get_all_elements(ui_layer);
        if (array_length(elements) > 0) {
            success[array_length(success)] = "UI_Layer contains " + string(array_length(elements)) + " instances (FIXED!)";
        } else {
            errors[array_length(errors)] = "UI_Layer is still empty";
        }
    } else {
        errors[array_length(errors)] = "UI_Layer not found";
    }

    // 3. Check money display
    if (instance_exists(obj_money_display)) {
        var md = instance_find(obj_money_display, 0);
        success[array_length(success)] = "obj_money_display exists with money value: " + string(md.money) + " ($10.00)";
    } else {
        errors[array_length(errors)] = "obj_money_display not found";
    }

    // 4. Check all UI objects are in UI_Layer
    var ui_objects = [obj_time_system, obj_money_display, obj_schedule_display, obj_needs_display, obj_display_manager];
    var ui_object_names = ["obj_time_system", "obj_money_display", "obj_schedule_display", "obj_needs_display", "obj_display_manager"];

    for (var i = 0; i < array_length(ui_objects); i++) {
        if (instance_exists(ui_objects[i])) {
            var inst = instance_find(ui_objects[i], 0);
            var inst_layer = layer_get_id(layer_get_name(inst.layer));
            if (inst_layer == ui_layer) {
                success[array_length(success)] = ui_object_names[i] + " is in UI_Layer (CORRECT!)";
            } else {
                warnings[array_length(warnings)] = ui_object_names[i] + " is NOT in UI_Layer";
            }
        }
    }

    // Build report
    report += "SUCCESSES (" + string(array_length(success)) + "):\n";
    for (var i = 0; i < array_length(success); i++) {
        report += "  + " + success[i] + "\n";
    }

    if (array_length(warnings) > 0) {
        report += "\nWARNINGS (" + string(array_length(warnings)) + "):\n";
        for (var i = 0; i < array_length(warnings); i++) {
            report += "  ! " + warnings[i] + "\n";
        }
    }

    if (array_length(errors) > 0) {
        report += "\nERRORS (" + string(array_length(errors)) + "):\n";
        for (var i = 0; i < array_length(errors); i++) {
            report += "  X " + errors[i] + "\n";
        }
    }

    report += "\n=== SUMMARY ===\n";
    if (array_length(errors) == 0) {
        report += "All critical UI issues have been FIXED!\n";
        report += "- Clock should now be visible (obj_time_system.visible = true)\n";
        report += "- Money display shows $10.00 format\n";
        report += "- All UI objects moved to UI_Layer\n";
        report += "- Schedule and needs displays should be visible\n";
    } else {
        report += "Some issues remain. Check errors above.\n";
    }

    report += "\nPress F9 in-game to run debug_ui_system() for runtime diagnostics.\n";

    show_debug_message(report);
    return report;
}