# Immediate Fixes Required
## Quick Solutions to Current Visibility Issues

## 1. CHARACTER VISIBILITY FIX

### Problem
obj_inmate and obj_guard have Draw events but no drawing code

### Solution
Add to `objects/obj_inmate/Draw_0.gml`:
```gml
// Draw the inmate sprite
draw_self();
```

Add to `objects/obj_guard/Draw_0.gml`:
```gml
// Draw the guard sprite
draw_self();
```

### Why This Works
- `draw_self()` uses the sprite assigned in the object properties
- Maintains proper depth sorting
- Respects image_index and image_angle

---

## 2. DOOR ANIMATION FIX

### Problem
Doors continuously loop their open/close animation

### Solution
Add to `objects/obj_door/Create_0.gml`:
```gml
// Stop automatic animation
image_speed = 0;
image_index = 0; // Start with closed door frame

// Door state
is_open = false;
can_interact = true;
```

Add to `objects/obj_door/Step_0.gml` (create if doesn't exist):
```gml
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
```

---

## 3. CLOCK DISPLAY FIX

### Problem
obj_time_system has Draw GUI event but no display code

### Solution
Add to `objects/obj_time_system/Create_0.gml`:
```gml
// Time variables
current_hour = 6; // Start at 6 AM
current_minute = 0;
current_day = 1;
max_days = 5; // Win condition

// Time speed (1 real second = 1 game minute)
time_accumulator = 0;
seconds_per_minute = 1;

// Display position
clock_x = room_width / 2;
clock_y = 32;
```

Add to `objects/obj_time_system/Step_0.gml`:
```gml
// Advance time
time_accumulator += delta_time / 1000000; // Convert to seconds

if (time_accumulator >= seconds_per_minute) {
    time_accumulator -= seconds_per_minute;
    current_minute++;

    // Handle minute rollover
    if (current_minute >= 60) {
        current_minute = 0;
        current_hour++;

        // Handle hour rollover
        if (current_hour >= 24) {
            current_hour = 0;
            current_day++;
        }
    }
}
```

Add to `objects/obj_time_system/Draw_64.gml`:
```gml
// Draw time display
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Format time string
var hour_str = string(current_hour);
if (current_hour < 10) hour_str = "0" + hour_str;

var minute_str = string(current_minute);
if (current_minute < 10) minute_str = "0" + minute_str;

var time_text = "Day " + string(current_day) + " - " + hour_str + ":" + minute_str;

// Draw background box
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(clock_x - 80, clock_y - 5, clock_x + 80, clock_y + 25, false);

// Draw text
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(clock_x, clock_y, time_text);

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
```

---

## 4. VERIFY INSTANCE LAYERS

### Check in IDE
Ensure in rm_prison_main:
1. All objects are on "Instances" layer
2. Layer order (top to bottom):
   - UI (for displays)
   - Instances (for game objects)
   - Tiles (for tilemap)
   - Background

### Common Layer Issues
- Objects on wrong layer won't draw
- UI elements should be on top layer
- Check layer visibility isn't turned off

---

## 5. BASIC MOVEMENT FIX

### Quick Movement Implementation
Add to `objects/obj_inmate/Create_0.gml`:
```gml
// Movement variables
move_speed = 2;
grid_size = 32;
move_x = 0;
move_y = 0;
```

Add to `objects/obj_inmate/Step_0.gml`:
```gml
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
```

---

## Testing Checklist

After applying fixes, verify:

1. **Characters Visible**
   - [ ] Inmate appears in cell
   - [ ] Guard appears at station
   - [ ] Sprites oriented correctly

2. **Doors Static**
   - [ ] Not animating on their own
   - [ ] Can interact with E key
   - [ ] Open/close states work

3. **Clock Working**
   - [ ] Shows "Day 1 - 06:00" on start
   - [ ] Time advances (1 sec = 1 min)
   - [ ] Day increments at midnight

4. **Movement Working**
   - [ ] Arrow keys move inmate
   - [ ] Can't walk through doors
   - [ ] Stays within room bounds

---

## Application Order

1. **First**: Character visibility (most critical)
2. **Second**: Clock display (visual feedback)
3. **Third**: Door animation fix (prevent distraction)
4. **Fourth**: Basic movement (test interactions)

---

## Common Issues and Solutions

### If Characters Still Don't Appear:
- Check sprite exists: `spr_inmate` and `spr_guard`
- Verify sprite not empty (has at least 1 frame)
- Check object's visible property is true
- Ensure object placed in room

### If Clock Doesn't Show:
- Check obj_time_system is in room
- Verify Draw GUI event (Draw_64.gml)
- Check font settings if text invisible

### If Doors Still Animate:
- Ensure Create event runs before Step
- Check sprite has multiple frames
- Set both image_speed and image_index

---

## Quick Test Commands

In game, press these keys to test:
- Arrow keys: Move inmate
- E: Interact with door (when close)
- ESC: Should pause (once implemented)

---

## Next Steps After Fixes

Once these immediate fixes are applied:
1. Commit the working state
2. Begin Phase 2 implementation
3. Add system controllers functionality
4. Implement needs decay