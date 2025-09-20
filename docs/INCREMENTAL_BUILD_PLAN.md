# Incremental Build Plan for IDE Elements

## Approach
Each change must be tested before proceeding. Commit after every successful test.

## Phase 1: Workflow Validation ✅
**Goal**: Ensure our external creation process works

- [ ] Create obj_test_workflow (empty object)
- [ ] Call gamemaker-project-sync
- [ ] Open project in IDE - verify loads
- [ ] Verify obj_test_workflow appears in Asset Browser
- [ ] Commit changes
- [ ] Delete obj_test_workflow
- [ ] Sync and verify deletion works

## Phase 2: Core System Objects
**Goal**: Create foundation objects one at a time

Order of creation:
1. [ ] obj_game_controller
   - Create object
   - Add Create, Step, Draw GUI events (empty)
   - Sync, test, commit

2. [ ] obj_time_system
   - Create object
   - Add Create, Step, Draw GUI events
   - Sync, test, commit

3. [ ] obj_save_controller
   - Create object
   - Add Create event
   - Sync, test, commit

## Phase 3: Room Structure
**Goal**: Create rooms with proper layer structure

1. [ ] Create rm_menu
   - Basic 1920x1080 room
   - Add UI_Layer and Background_Layer
   - Sync, test, commit

2. [ ] Create rm_prison_main
   - Size: 3840x2160 room, 1920x1080 view
   - Add all 8 layers in order
   - Sync, test, commit

3. [ ] Create rm_game_over
   - Basic 1920x1080 room
   - Add UI_Layer and Background_Layer
   - Sync, test, commit

## Phase 4: Character Objects
**Goal**: Add character objects with sprites

1. [ ] obj_inmate
   - Create with spr_inmate assigned
   - Add Create, Step, Draw events
   - Sync, test, commit

2. [ ] obj_guard
   - Create with spr_guard assigned
   - Add Create, Step, Draw events
   - Sync, test, commit

## Phase 5: Interactive Objects
**Goal**: Add interactive elements

1. [ ] obj_door
   - Create with spr_door assigned
   - Add Create, Step, Animation End events
   - Sync, test, commit

2. [ ] obj_food_station
   - Create with spr_food_tray assigned
   - Add Create, Step, Draw events
   - Sync, test, commit

## Phase 6: UI Objects
**Goal**: Create UI system objects

1. [ ] obj_ui_controller
   - Create object (no sprite)
   - Add Create, Step, Draw GUI events
   - Sync, test, commit

2. [ ] obj_schedule_display
   - Create with spr_schedule_block
   - Add Create, Draw GUI, Mouse events
   - Sync, test, commit

3. [ ] obj_needs_display
   - Create object (uses multiple sprites)
   - Add Create, Draw GUI events
   - Sync, test, commit

4. [ ] obj_camera_controller
   - Create object (no sprite)
   - Add Create, Step events
   - Sync, test, commit

## Phase 7: Scripts Organization
**Goal**: Create placeholder scripts in organized folders

1. [ ] Create System scripts folder and scripts
   - scr_time_functions
   - scr_save_load
   - scr_game_states
   - Sync, test, commit

2. [ ] Create Gameplay scripts folder and scripts
   - scr_needs_system
   - scr_schedule_system
   - scr_economy_system
   - Sync, test, commit

3. [ ] Create Utility scripts folder and scripts
   - scr_movement
   - scr_collision
   - scr_ui_helpers
   - scr_drawing
   - Sync, test, commit

## Phase 8: Sound Placeholders
**Goal**: Create sound asset placeholders

1. [ ] Create Effects sounds folder
   - Add all effect sounds (empty placeholders)
   - Sync, test, commit

2. [ ] Create Ambient sounds folder
   - Add ambient sounds (empty placeholders)
   - Sync, test, commit

## Phase 9: Tilemap Setup
**Goal**: Configure tilemaps in rm_prison_main

1. [ ] Add tilemap to Tiles_Background layer
   - Assign ts_cell
   - Paint basic cell layout
   - Sync, test, commit

2. [ ] Add tilemap to Tiles_Foreground layer
   - Assign ts_cell for bars
   - Paint cell bars
   - Sync, test, commit

3. [ ] Add collision tilemap
   - Create invisible collision tiles
   - Paint collision areas
   - Sync, test, commit

4. [ ] Add yard tilemap area
   - Use ts_yard for outdoor area
   - Paint yard layout
   - Sync, test, commit

## Testing Checklist (Run after EACH change)

1. ✓ Run gamemaker-project-sync
2. ✓ Check git status for changes
3. ✓ Open project in GameMaker IDE
4. ✓ Verify new asset appears correctly
5. ✓ Check for any error messages
6. ✓ Run the game (F5) to ensure no crashes
7. ✓ Commit with descriptive message

## Recovery Procedure

If project fails to load:
1. Check error message and document it
2. Revert last commit: `git reset --hard HEAD~1`
3. Analyze what went wrong
4. Fix the issue using gamemaker-project-sync
5. Try again with smaller change

## Success Criteria

- All objects appear in Asset Browser
- All rooms load without errors
- All scripts are organized in folders
- Project runs without crashes
- All assets committed to git
- Documentation updated