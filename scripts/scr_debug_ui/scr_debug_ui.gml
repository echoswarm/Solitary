// Debug UI System
function debug_ui_system() {
    var debug_msg = "=== UI SYSTEM DEBUG ===\n";

    // Check GUI dimensions
    debug_msg += "GUI Width: " + string(display_get_gui_width()) + "\n";
    debug_msg += "GUI Height: " + string(display_get_gui_height()) + "\n\n";

    // Check UI Layer
    var ui_layer = layer_get_id("UI_Layer");
    if (layer_exists(ui_layer)) {
        debug_msg += "UI_Layer exists\n";
        debug_msg += "UI_Layer depth: " + string(layer_get_depth(ui_layer)) + "\n";
        debug_msg += "UI_Layer visible: " + string(layer_get_visible(ui_layer)) + "\n\n";

        // Check instances in UI_Layer
        var elements = layer_get_all_elements(ui_layer);
        debug_msg += "UI_Layer instances: " + string(array_length(elements)) + "\n";

        for (var i = 0; i < array_length(elements); i++) {
            if (layer_get_element_type(elements[i]) == layerelementtype_instance) {
                var inst = layer_instance_get_instance(elements[i]);
                if (instance_exists(inst)) {
                    debug_msg += "  - " + object_get_name(inst.object_index) + " (visible: " + string(inst.visible) + ")\n";
                }
            }
        }
    } else {
        debug_msg += "ERROR: UI_Layer not found!\n";
    }

    debug_msg += "\n";

    // Check specific UI objects
    if (instance_exists(obj_time_system)) {
        var ts = instance_find(obj_time_system, 0);
        debug_msg += "obj_time_system: EXISTS (visible: " + string(ts.visible) + ")\n";
        debug_msg += "  Time: Day " + string(ts.game_day) + " - " + string(ts.game_hour) + ":" + string(ts.game_minute) + "\n";
    } else {
        debug_msg += "obj_time_system: NOT FOUND\n";
    }

    if (instance_exists(obj_money_display)) {
        var md = instance_find(obj_money_display, 0);
        debug_msg += "obj_money_display: EXISTS (visible: " + string(md.visible) + ")\n";
        debug_msg += "  Money: " + string(md.money) + "\n";
    } else {
        debug_msg += "obj_money_display: NOT FOUND\n";
    }

    if (instance_exists(obj_schedule_display)) {
        var sd = instance_find(obj_schedule_display, 0);
        debug_msg += "obj_schedule_display: EXISTS (visible: " + string(sd.visible) + ")\n";
    } else {
        debug_msg += "obj_schedule_display: NOT FOUND\n";
    }

    if (instance_exists(obj_needs_display)) {
        var nd = instance_find(obj_needs_display, 0);
        debug_msg += "obj_needs_display: EXISTS (visible: " + string(nd.visible) + ")\n";
    } else {
        debug_msg += "obj_needs_display: NOT FOUND\n";
    }

    if (instance_exists(obj_display_manager)) {
        var dm = instance_find(obj_display_manager, 0);
        debug_msg += "obj_display_manager: EXISTS (visible: " + string(dm.visible) + ")\n";
    } else {
        debug_msg += "obj_display_manager: NOT FOUND\n";
    }

    show_debug_message(debug_msg);
    return debug_msg;
}