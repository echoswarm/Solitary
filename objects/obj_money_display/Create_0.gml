// obj_money_display Create Event

// Initialize money (just as a number, no cents)
money = 0; // Start with 0

// IMPORTANT: Keep object visible for Draw GUI event to work!
// Setting visible = false prevents ALL draw events from executing
visible = true;

// Hide the sprite itself (but keep Draw GUI active)
sprite_index = -1;

// Display position will be calculated dynamically in Draw event
// to ensure proper alignment regardless of screen size