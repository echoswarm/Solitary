// obj_door Step Event

// Check for player interaction (E key)
if (can_interact && keyboard_check_pressed(ord("E"))) {
    var dist = point_distance(x, y, obj_inmate.x, obj_inmate.y);
    if (dist < 48) { // Within interaction range
        if (is_open) {
            // Close door
            image_index = 0;
            is_open = false;
        } else {
            // Open door
            image_index = 1; // Or last frame of sprite
            is_open = true;
        }
    }
}