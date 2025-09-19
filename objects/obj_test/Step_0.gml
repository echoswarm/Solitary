/// @description Test object update
// Simple rotation to show the object is working

image_angle += rotation_speed;
test_counter++;

// Reset counter to prevent overflow
if (test_counter > 1000000) {
    test_counter = 0;
}