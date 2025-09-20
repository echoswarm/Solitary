/// @description Show UI Verification Report (F6)

// Run UI verification and display the report
var report = scr_verify_ui();
show_debug_message(report);

// Also show a brief message on screen
alarm[0] = 180; // Show message for 3 seconds