# Sprite Implementation Guide

## Character Sprites Implementation

### Directional Sprite System
Both `spr_guard` and `spr_inmate` use a 4-frame directional system:

```gml
// Direction to frame mapping
// 0° = Right = Frame 0 (sprite frame 1)
// 90° = Up = Frame 1 (sprite frame 2)
// 180° = Left = Frame 2 (sprite frame 3)
// 270° = Down = Frame 3 (sprite frame 4)

// Example implementation
var frame_index = floor(direction / 90) mod 4;
image_index = frame_index;
```

### Character Movement
- **Origin Point:** Middle Center allows for centered rotation and collision
- **Collision Box:** Approximately 16x32 pixels
- **Drawing Offset:** No offset needed due to centered origin

## Environment Tilesets Usage

### Setting Up Tilemaps

#### Cell Tileset (spr_cell_tileset / ts_cell)
```gml
// Create tilemap layer
var cell_tilemap = layer_tilemap_create("Tiles_Cell", 0, 0, ts_cell);

// Place tiles (32x32 grid)
tilemap_set(cell_tilemap, tile_index, x_cell, y_cell);
```

#### Yard Tileset (spr_yard_tileset / ts_yard)
```gml
// Outdoor environment setup
var yard_tilemap = layer_tilemap_create("Tiles_Yard", 0, 0, ts_yard);
```

### Tileset Specifications
- **Tile Size:** 32x32 pixels
- **Total Tiles:** 576 tiles per tileset (24x24 grid)
- **Coordinate System:** Tile coordinates, not pixel coordinates
- **Layer Depth:** Typically set behind character layers

## Door Animation System

### spr_door Implementation
```gml
// Door states
enum DoorState {
    CLOSED = 0,    // Frame 0
    OPENING = 1,   // Frame 1
    OPEN = 2       // Frame 2
}

// Animation control
image_speed = 1/60; // 1 FPS (1 frame per second)

// State transitions
if (player_near && key_pressed) {
    if (image_index == DoorState.CLOSED) {
        image_index = DoorState.OPENING;
        alarm[0] = 60; // 1 second to fully open
    }
}

// In Alarm[0] event
image_index = DoorState.OPEN;
```

## UI Elements Positioning

### Progress Bar System (spr_ui_bar_empty + spr_ui_bar_fill)
```gml
// Draw empty bar background
draw_sprite(spr_ui_bar_empty, 0, x, y);

// Calculate fill percentage
var fill_width = (current_value / max_value) * 97;

// Draw fill with scaling (origin at middle left)
draw_sprite_ext(spr_ui_bar_fill, 0, x, y + 13,
                fill_width/97, 1, 0, c_white, 1);
```

### Button States (spr_ui_button)
```gml
// Button state management
var button_frame = 0; // Default unselected

if (mouse_over) {
    button_frame = 2; // Hover state
}
if (mouse_click) {
    button_frame = 1; // Selected state
}

draw_sprite(spr_ui_button, button_frame, x, y);
```

### Panel System (spr_ui_panel / spr_schedule_block)
```gml
// Generic panel
draw_sprite(spr_ui_panel, 0, panel_x, panel_y);

// Schedule-specific panel
draw_sprite(spr_schedule_block, 0, schedule_x, schedule_y);

// Close button detection (top-right corner)
var close_x = panel_x + 535 - 32;
var close_y = panel_y;
if (point_in_rectangle(mouse_x, mouse_y,
                       close_x, close_y,
                       close_x + 32, close_y + 32)) {
    // Handle close button click
}
```

### Money Icon Animation (spr_money_icon)
```gml
// Flash animation on currency change
if (money_changed) {
    image_speed = 7/60; // 7 FPS
    image_index = 0;
    animation_playing = true;
}

// Stop after one cycle
if (animation_playing && image_index >= 3.9) {
    image_index = 0;
    image_speed = 0;
    animation_playing = false;
}
```

## Item Sprites Implementation

### Food Tray System (spr_food_tray)
```gml
// State-based display
if (has_food) {
    image_index = 0; // With tray
} else {
    image_index = 1; // Empty table
}

// Interaction zone (96x96 area)
if (point_in_rectangle(player.x, player.y,
                       x - 48, y - 48,
                       x + 48, y + 48)) {
    // Player can interact
}
```

## Best Practices

### Performance Optimization
1. **Batch Drawing:** Group similar sprites together
2. **Texture Pages:** Keep related sprites on same texture page
3. **Animation Control:** Disable image_speed when not animating

### Alignment Guidelines
1. **UI Elements:** Align to GUI layer coordinates
2. **World Sprites:** Use room coordinates
3. **Centered Origins:** Characters and rotating objects
4. **Top-Left Origins:** UI panels and static elements
5. **Custom Origins:** Progress bar fills (middle-left)

### Layer Organization
```
Recommended depth order (front to back):
- GUI: -1000 (UI elements)
- Effects: -100 (particles, overlays)
- Characters: 0 (player, NPCs)
- Items: 100 (interactive objects)
- Doors: 200 (between walls and background)
- Walls: 300 (collision tiles)
- Background: 400 (floor tiles)
```

## Animation Specifications

### Frame Rates
- **Static:** 0 FPS (manual control)
- **Slow:** 1 FPS (door animations)
- **Medium:** 7 FPS (money icon flash)
- **Fast:** 15-30 FPS (future smooth animations)

### State Machines
- **Characters:** Direction-based frame selection
- **Doors:** Three-state linear progression
- **UI Buttons:** Mouse interaction states
- **Items:** Binary state (with/without)

## Debugging Tips

### Sprite Drawing
```gml
// Debug sprite bounds
draw_set_color(c_red);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

// Debug origin point
draw_circle(x, y, 2, false);
```

### Tilemap Verification
```gml
// Check tile at position
var tile = tilemap_get_at_pixel(tilemap, mouse_x, mouse_y);
show_debug_message("Tile index: " + string(tile & tile_index_mask));
```

## Common Issues and Solutions

### Issue: Sprites appear offset
**Solution:** Check origin point settings, ensure correct origin for sprite type

### Issue: Animation plays too fast/slow
**Solution:** Adjust image_speed relative to room_speed (60 FPS default)

### Issue: Tilemap gaps
**Solution:** Ensure tiles align to 32x32 grid, check for rounding errors

### Issue: UI elements misaligned
**Solution:** Use GUI layer coordinates, not room coordinates

### Issue: Character facing wrong direction
**Solution:** Verify direction-to-frame mapping formula