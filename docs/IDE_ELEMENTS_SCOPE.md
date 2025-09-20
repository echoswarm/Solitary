# IDE Elements Scope for Solitary

## Overview
Complete list of all GameMaker IDE elements needed before writing any GML code.

## Objects Required

### Core System Objects
- **obj_game_controller** - Main game state manager
  - Purpose: Initialize systems, manage game states
  - Events: Create, Step, Draw GUI

- **obj_time_system** - Time and clock management
  - Purpose: Track game time, manage day/night cycle
  - Events: Create, Step, Draw GUI (for clock display)

- **obj_save_controller** - Save/load system
  - Purpose: Handle game saves and loads
  - Events: Create, Async Save/Load

### Character Objects
- **obj_inmate** - Player's prisoner
  - Purpose: Main character to manage
  - Sprite: spr_inmate (16x32, 4 frames)
  - Events: Create, Step, Draw

- **obj_guard** - Guard character (simplified for MVP)
  - Purpose: Execute scheduled tasks
  - Sprite: spr_guard (16x32, 4 frames)
  - Events: Create, Step, Draw

### Interactive Objects
- **obj_door** - Cell door
  - Purpose: Open/close for activities
  - Sprite: spr_door (54x72, 3 frames)
  - Events: Create, Step, Animation End

- **obj_food_station** - Food serving location
  - Purpose: Where meals are delivered
  - Sprite: spr_food_tray (96x96, 2 frames)
  - Events: Create, Step, Draw

### UI Objects
- **obj_schedule_display** - Daily schedule viewer
  - Purpose: Show/hide schedule panel
  - Sprite: spr_schedule_block (535x211)
  - Events: Create, Draw GUI, Mouse events

- **obj_needs_display** - Hunger/cleanliness bars
  - Purpose: Display inmate needs
  - Sprites: spr_ui_bar_empty, spr_ui_bar_fill
  - Events: Create, Draw GUI

- **obj_ui_controller** - UI system manager
  - Purpose: Handle all UI interactions
  - Events: Create, Step, Draw GUI

- **obj_camera_controller** - Camera and view manager
  - Purpose: Handle camera, zooming, parallax
  - Events: Create, Step

## Rooms Required

### rm_menu
- Purpose: Main menu screen
- Size: 1920x1080
- Layers:
  1. UI_Layer
  2. Background_Layer

### rm_prison_main
- Purpose: Main gameplay room
- Size: 1920x1080 (view), 3840x2160 (room)
- Layers (top to bottom):
  1. **UI_Layer** - HUD elements, needs bars, clock
  2. **Effects_Layer** - Lighting effects, particles
  3. **Instances_Top** - Characters, interactive objects
  4. **Collision_Layer** - Invisible collision tiles
  5. **Tiles_Foreground** - Cell bars, overlays
  6. **Instances_Main** - Furniture, stations
  7. **Tiles_Background** - Walls, floors
  8. **Parallax_Layer** - Distant background elements

### rm_game_over
- Purpose: End game screen
- Size: 1920x1080
- Layers:
  1. UI_Layer
  2. Background_Layer

## Layer Configuration Details

### Tilemap Layers (rm_prison_main)
- **Tiles_Background**: Uses ts_cell for interior, ts_yard for exterior
- **Tiles_Foreground**: Uses ts_cell for bars and overlays
- **Collision_Layer**: Invisible tilemap for collision detection
  - Tile size: 32x32
  - No visual tiles, only collision data

### Instance Layers
- **Instances_Main**: Static objects (furniture, stations)
- **Instances_Top**: Moving objects (characters)

### Effect Layers
- **Effects_Layer**: For lighting overlays and particles
  - Blend mode: Add or Multiply for lighting
- **Parallax_Layer**: Slow-moving background
  - Horizontal speed: 0.5
  - Vertical speed: 0.5

## Scripts Required (Placeholders)

### System Scripts
- **scr_time_functions** - Time calculation helpers
- **scr_save_load** - Save/load utilities
- **scr_game_states** - State management

### Gameplay Scripts
- **scr_needs_system** - Needs calculation
- **scr_schedule_system** - Schedule management
- **scr_economy_system** - Money management

### Utility Scripts
- **scr_movement** - Movement helpers
- **scr_collision** - Collision checking
- **scr_ui_helpers** - UI utilities
- **scr_drawing** - Custom draw functions

## Sound Assets (Placeholders)

### Effect Sounds
- **snd_door_open** - Door opening
- **snd_door_close** - Door closing
- **snd_meal_served** - Food delivery
- **snd_alarm** - Wake up/alert
- **snd_ui_click** - Button clicks
- **snd_ui_hover** - Button hover

### Ambient Sounds
- **snd_ambient_day** - Daytime background
- **snd_ambient_night** - Nighttime background

## Asset Organization Structure

```
Objects/
├── System/
│   ├── obj_game_controller
│   ├── obj_time_system
│   └── obj_save_controller
├── Characters/
│   ├── obj_inmate
│   └── obj_guard
├── Interactive/
│   ├── obj_door
│   └── obj_food_station
└── UI/
    ├── obj_schedule_display
    ├── obj_needs_display
    ├── obj_ui_controller
    └── obj_camera_controller

Scripts/
├── System/
│   ├── scr_time_functions
│   ├── scr_save_load
│   └── scr_game_states
├── Gameplay/
│   ├── scr_needs_system
│   ├── scr_schedule_system
│   └── scr_economy_system
└── Utility/
    ├── scr_movement
    ├── scr_collision
    ├── scr_ui_helpers
    └── scr_drawing

Sounds/
├── Effects/
│   ├── snd_door_open
│   ├── snd_door_close
│   ├── snd_meal_served
│   ├── snd_alarm
│   ├── snd_ui_click
│   └── snd_ui_hover
└── Ambient/
    ├── snd_ambient_day
    └── snd_ambient_night
```

## Implementation Priority

1. **Phase 1**: Test workflow with single object
2. **Phase 2**: Core system objects
3. **Phase 3**: Room structure with layers
4. **Phase 4**: Character and interactive objects
5. **Phase 5**: UI objects
6. **Phase 6**: Scripts and sounds
7. **Phase 7**: Tilemap painting and collision setup