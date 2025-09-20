// obj_inmate Step Event

// Get input
var h_input = keyboard_check(vk_right) - keyboard_check(vk_left);
var v_input = keyboard_check(vk_down) - keyboard_check(vk_up);

// Calculate movement
move_x = h_input * move_speed;
move_y = v_input * move_speed;

// Apply movement with collision check
if (!place_meeting(x + move_x, y, obj_door)) {
    x += move_x;
}

if (!place_meeting(x, y + move_y, obj_door)) {
    y += move_y;
}

// Keep in room bounds
x = clamp(x, 16, room_width - 16);
y = clamp(y, 16, room_height - 16);