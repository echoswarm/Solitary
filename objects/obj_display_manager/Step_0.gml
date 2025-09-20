/// @description Handle Window Resizing and Scaling

// Check if window was resized
var current_window_width = window_get_width();
var current_window_height = window_get_height();

if (current_window_width != prev_window_width || current_window_height != prev_window_height) {
    // Window was resized
    window_width = current_window_width;
    window_height = current_window_height;

    // Calculate scale while maintaining aspect ratio
    var scale_x = window_width / base_width;
    var scale_y = window_height / base_height;
    var scale = min(scale_x, scale_y);

    // Calculate viewport size
    var viewport_width = base_width * scale;
    var viewport_height = base_height * scale;

    // Calculate viewport position (centered)
    var viewport_x = (window_width - viewport_width) / 2;
    var viewport_y = (window_height - viewport_height) / 2;

    // Set the viewport for all cameras
    for (var i = 0; i < 8; i++) {
        if (view_enabled && view_visible[i]) {
            camera_set_view_size(view_camera[i], base_width, base_height);
            view_set_wport(i, viewport_width);
            view_set_hport(i, viewport_height);
            view_set_xport(i, viewport_x);
            view_set_yport(i, viewport_y);
        }
    }

    // Resize application surface to match base resolution
    surface_resize(application_surface, base_width, base_height);

    // Update previous window size
    prev_window_width = window_width;
    prev_window_height = window_height;

    // Store window position and size if not fullscreen
    if (!is_fullscreen) {
        stored_window_x = window_get_x();
        stored_window_y = window_get_y();
        stored_window_width = window_width;
        stored_window_height = window_height;
    }
}