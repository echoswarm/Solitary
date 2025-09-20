// obj_game_controller Draw GUI Event

// Display state-specific UI
switch(current_state) {
    case GameState.MENU:
        // Draw menu screen
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(room_width/2, room_height/2 - 50, "SOLITARY");
        draw_text(room_width/2, room_height/2, "Prison Management Simulator");
        draw_text(room_width/2, room_height/2 + 50, "Press SPACE to Start");
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        break;

    case GameState.PAUSED:
        // Draw pause overlay
        draw_set_alpha(0.5);
        draw_set_color(c_black);
        draw_rectangle(0, 0, room_width, room_height, false);
        draw_set_alpha(1);

        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(room_width/2, room_height/2 - 30, "PAUSED");
        draw_text(room_width/2, room_height/2 + 10, "Press ESC to Resume");
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        break;

    case GameState.GAMEOVER:
        // Draw game over screen
        draw_set_alpha(0.7);
        draw_set_color(c_black);
        draw_rectangle(0, 0, room_width, room_height, false);
        draw_set_alpha(1);

        draw_set_color(c_red);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(room_width/2, room_height/2 - 30, "GAME OVER");
        draw_set_color(c_white);
        draw_text(room_width/2, room_height/2 + 10, "Press SPACE to Restart");
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        break;

    case GameState.PLAYING:
        // No overlay when playing
        break;
}