// obj_ui_controller Create Event

// This object manages the top UI panel and coordinates other UI elements
// Panel dimensions
panel_height = 60;
panel_width = 1280;

// UI expansion state (toggled with TAB)
ui_expanded = false;

// Animation parameters
anim_duration = 0.3; // Animation duration in seconds
anim_timer = 0;      // Current animation timer
anim_active = false; // Whether animation is active
anim_start_expanded = false; // State at start of animation
anim_target_expanded = false; // Target state for animation

// Animation progress (0 to 1)
anim_progress = 0;

// Schedule display animation positions
schedule_y_collapsed = 0;  // Will be set based on GUI height
schedule_y_expanded = 0;   // Will be set based on GUI height
schedule_y_current = 0;    // Current Y position

// Needs display animation positions
needs_x_collapsed = 0;  // Will be set based on GUI width (off-screen)
needs_x_expanded = 0;   // Will be set based on GUI width
needs_x_current = 0;    // Current X position