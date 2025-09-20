// obj_ui_controller Create Event

// This object manages UI element visibility and animations
// Currently only handles needs display animation on TAB press

// UI expansion state (toggled with TAB) - only affects needs display now
ui_expanded = false;

// Animation parameters for needs display
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

// Needs display animation positions - slides in from right
needs_x_collapsed = gui_width + 50;  // Off-screen right when collapsed
needs_x_expanded = gui_width - 250;  // Visible position when expanded
needs_x_current = needs_x_collapsed;    // Start collapsed (off-screen)

// Schedule display animation positions - slides in from left
schedule_x_collapsed = -650;  // Off-screen left when collapsed
schedule_x_expanded = 20;     // Visible position when expanded
schedule_x_current = schedule_x_collapsed;  // Start collapsed (off-screen)