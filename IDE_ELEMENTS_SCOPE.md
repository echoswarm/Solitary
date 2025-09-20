# IDE Elements Scope for Solitary Prison Game

## Overview
Complete scope of all GameMaker Studio 2 IDE elements required for the Solitary prison game MVP.

## OBJECTS NEEDED

### Core Controllers
- **obj_game_controller** - Master game state manager
  - Handles game initialization
  - Manages global game state
  - Controls scene transitions

- **obj_time_system** - Time and clock management
  - Tracks day/night cycle
  - Manages daily schedule
  - Triggers time-based events

- **obj_ui_controller** - UI management system
  - Manages HUD elements
  - Controls menu overlays
  - Handles UI animations

- **obj_save_controller** - Save/load functionality
  - Manages save files
  - Handles autosave
  - Loads game state

- **obj_camera_controller** - Camera and view management
  - Controls camera movement
  - Manages parallax effects
  - Handles screen shake/effects

### Character Objects
- **obj_inmate** - Main prisoner character
  - Player-controlled movement
  - Needs system (hunger, cleanliness)
  - Animation states

- **obj_guard** - Guard NPC (simplified for MVP)
  - Basic patrol movement
  - Detection system
  - State machine (patrol/alert)

### Interactive Objects
- **obj_door** - Interactive cell door
  - Open/close states
  - Timed access (schedule-based)
  - Animation and sound

- **obj_food_station** - Meal distribution point
  - Interaction prompt
  - Food dispensing logic
  - Schedule integration

### UI Display Objects
- **obj_schedule_display** - Daily schedule UI
  - Shows current time
  - Displays upcoming events
  - Visual schedule blocks

- **obj_needs_display** - Need bars UI
  - Hunger meter
  - Cleanliness meter
  - Visual feedback states

## ROOMS NEEDED

### rm_menu (Main Menu)
**Purpose:** Game entry point and main menu
**Layers:**
- UI_Layer (buttons, title)
- Background_Layer (menu background)

### rm_prison_main (Main Game Room)
**Purpose:** Core gameplay area with cell and yard
**Layers (top to bottom):**
1. **UI_Layer** - HUD and interface elements
2. **Effects_Layer** - Lighting, particles, weather
3. **Instances_Layer** - Characters and interactive objects
4. **Collision_Layer** - Invisible collision tilemap
5. **Foreground_Tiles** - Cell bars, overlapping elements
6. **Main_Tiles** - Primary walls and floors
7. **Background_Tiles** - Base floor patterns
8. **Parallax_Background** - Distant sky/buildings

### rm_game_over (End Screen)
**Purpose:** Game over and results display
**Layers:**
- UI_Layer (results, buttons)
- Background_Layer (ending scene)

## LAYER STRUCTURE DETAIL

### rm_prison_main Layer Configuration
```
Layer Name          | Depth | Purpose
-------------------|-------|---------------------------
UI_Layer           | -1000 | HUD, menus, overlays
Effects_Layer      | -500  | Lighting, particles
Instances_Layer    | 0     | Game objects
Collision_Layer    | 100   | Collision tilemap (invisible)
Foreground_Tiles   | 200   | Cell bars, front elements
Main_Tiles         | 300   | Walls, main structure
Background_Tiles   | 400   | Floor base
Parallax_Background| 500   | Sky, distant elements
```

## SCRIPTS NEEDED (Organized in folders)

### /scripts/Core/
- **scr_time_functions**
  - get_current_time()
  - advance_time()
  - format_time_display()
  - check_schedule_event()

### /scripts/Systems/
- **scr_save_load**
  - save_game()
  - load_game()
  - autosave()
  - check_save_exists()

- **scr_needs_system**
  - update_hunger()
  - update_cleanliness()
  - apply_need_effects()
  - check_critical_needs()

- **scr_schedule_system**
  - get_current_activity()
  - check_schedule_compliance()
  - trigger_schedule_event()
  - get_next_event()

### /scripts/UI/
- **scr_ui_helpers**
  - draw_meter_bar()
  - format_ui_text()
  - animate_ui_element()
  - show_notification()

### /scripts/Movement/
- **scr_movement**
  - move_and_collide()
  - apply_friction()
  - check_interaction_range()

- **scr_collision**
  - check_tile_collision()
  - resolve_collision()
  - get_collision_normal()

## TILESETS NEEDED

- **ts_prison_walls** - Wall tiles for structure
- **ts_prison_floors** - Floor patterns and variations
- **ts_prison_objects** - Furniture and fixtures
- **ts_collision** - Collision mapping tiles
- **ts_prison_bars** - Cell bars and gates

## SPRITES NEEDED (Placeholder)

### Characters
- **spr_inmate_idle** - Prisoner idle animation
- **spr_inmate_walk** - Prisoner walking
- **spr_guard_idle** - Guard idle
- **spr_guard_walk** - Guard patrol

### Objects
- **spr_door_closed** - Closed cell door
- **spr_door_open** - Open cell door
- **spr_food_station** - Meal distribution point

### UI
- **spr_ui_hunger_bar** - Hunger meter graphics
- **spr_ui_cleanliness_bar** - Cleanliness meter
- **spr_ui_clock** - Clock display
- **spr_ui_schedule** - Schedule blocks

## SOUNDS (Placeholder)

### Environmental
- **snd_ambient_prison** - Background prison ambience
- **snd_footsteps_concrete** - Walking sounds

### Interactions
- **snd_door_open** - Cell door opening
- **snd_door_close** - Cell door closing
- **snd_meal_served** - Food distribution sound

### Alerts
- **snd_alarm** - Alert/warning sound
- **snd_notification** - UI notification

### UI
- **snd_menu_select** - Menu selection
- **snd_menu_hover** - Menu hover

## FONTS

- **fnt_ui_main** - Primary UI font
- **fnt_ui_small** - Small text/details
- **fnt_menu_title** - Menu titles

## PATHS (for NPCs)

- **pth_guard_patrol_1** - Guard patrol route 1
- **pth_guard_patrol_2** - Guard patrol route 2

## SHADERS (Optional for MVP)

- **shd_lighting** - Basic lighting effects
- **shd_grayscale** - Mood/state effects

## ASSET ORGANIZATION

```
Project Structure:
/sprites/
  /characters/
  /objects/
  /ui/
  /tiles/
/sounds/
  /ambient/
  /sfx/
  /ui/
/scripts/
  /Core/
  /Systems/
  /UI/
  /Movement/
/objects/
  /Controllers/
  /Characters/
  /Interactive/
  /UI/
/rooms/
/tilesets/
/fonts/
/paths/
/shaders/
```

## PRIORITIES FOR MVP

### Critical (Must Have)
1. obj_game_controller
2. obj_inmate
3. obj_time_system
4. rm_prison_main with basic layers
5. Basic collision system
6. Movement scripts
7. Simple UI display

### Important (Should Have)
1. obj_guard with basic AI
2. obj_door interactions
3. Save/load system
4. Needs system
5. Schedule display

### Nice to Have (Could Have)
1. Parallax effects
2. Particle effects
3. Advanced lighting
4. Multiple guard patrol paths
5. Sound effects

## VALIDATION CHECKLIST

- [ ] All objects have Create events
- [ ] All objects have appropriate parents set
- [ ] All rooms have proper layer structure
- [ ] All scripts are organized in folders
- [ ] All sprites have collision masks
- [ ] All tilesets have proper grid settings
- [ ] Project resource tree is organized
- [ ] No naming conflicts
- [ ] All placeholder assets created