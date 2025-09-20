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

// Get initial GUI dimensions
var gui_height = display_get_gui_height();
var gui_width = display_get_gui_width();

// Schedule display animation positions - schedule slides up from bottom
schedule_y_collapsed = gui_height + 10;  // Just off-screen when collapsed (only clock visible)
schedule_y_expanded = gui_height - 280;   // Show full schedule when expanded
schedule_y_current = schedule_y_collapsed;    // Start collapsed (off-screen)

// Needs display animation positions - slides in from right
needs_x_collapsed = gui_width + 50;  // Off-screen right when collapsed
needs_x_expanded = gui_width - 250;  // Visible position when expanded
needs_x_current = needs_x_collapsed;    // Start collapsed (off-screen)