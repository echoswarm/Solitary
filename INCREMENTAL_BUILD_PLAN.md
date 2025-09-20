# Incremental Build Plan for Solitary

## Overview
Step-by-step implementation plan with validation checkpoints after each change.

## CRITICAL RULES
1. **ONE CHANGE AT A TIME** - Never batch multiple changes
2. **TEST AFTER EACH CHANGE** - Call gamemaker-project-sync after every modification
3. **COMMIT ON SUCCESS** - Git commit after each successful validation
4. **ROLLBACK ON FAILURE** - Revert changes if validation fails
5. **DOCUMENT ISSUES** - Log any problems encountered

---

## PHASE 1: WORKFLOW VALIDATION
**Goal:** Verify our toolchain and workflow

### Steps:
- [ ] Create obj_test_workflow (empty object)
- [ ] Call gamemaker-project-sync
- [ ] Verify project loads in IDE
- [ ] Commit with message "test: workflow validation"
- [ ] Delete obj_test_workflow
- [ ] Call gamemaker-project-sync
- [ ] Commit with message "cleanup: remove test object"

**Success Criteria:**
- Project syncs without errors
- IDE loads project successfully
- Git commits work properly

---

## PHASE 2: CORE CONTROLLERS
**Goal:** Establish foundation objects

### Step 1: Game Controller
- [ ] Create obj_game_controller
- [ ] Add Create event with comment
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add game controller object"

### Step 2: Time System
- [ ] Create obj_time_system
- [ ] Add Create event with variables
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add time system object"

### Step 3: UI Controller
- [ ] Create obj_ui_controller
- [ ] Add Create and Draw GUI events
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add UI controller"

### Step 4: Save Controller
- [ ] Create obj_save_controller
- [ ] Add Create event
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add save controller"

### Step 5: Camera Controller
- [ ] Create obj_camera_controller
- [ ] Add Create and Step events
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add camera controller"

**Success Criteria:**
- All controller objects exist
- No resource conflicts
- Project remains stable

---

## PHASE 3: CHARACTER OBJECTS
**Goal:** Add character entities

### Step 1: Inmate Object
- [ ] Create spr_inmate_placeholder (32x32)
- [ ] Call gamemaker-project-sync
- [ ] Create obj_inmate with sprite
- [ ] Add Create and Step events
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add inmate object and sprite"

### Step 2: Guard Object
- [ ] Create spr_guard_placeholder (32x32)
- [ ] Call gamemaker-project-sync
- [ ] Create obj_guard with sprite
- [ ] Add Create and Step events
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add guard object and sprite"

**Success Criteria:**
- Character objects have sprites
- Basic event structure in place

---

## PHASE 4: INTERACTIVE OBJECTS
**Goal:** Add interactable elements

### Step 1: Door Object
- [ ] Create spr_door_placeholder (64x64)
- [ ] Call gamemaker-project-sync
- [ ] Create obj_door with sprite
- [ ] Add Create event with state variable
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add door object"

### Step 2: Food Station
- [ ] Create spr_food_station_placeholder (64x64)
- [ ] Call gamemaker-project-sync
- [ ] Create obj_food_station
- [ ] Add Create event
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add food station object"

**Success Criteria:**
- Interactive objects created
- Placeholder sprites assigned

---

## PHASE 5: UI DISPLAY OBJECTS
**Goal:** Create HUD elements

### Step 1: Schedule Display
- [ ] Create obj_schedule_display
- [ ] Add Draw GUI event
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add schedule display"

### Step 2: Needs Display
- [ ] Create obj_needs_display
- [ ] Add Draw GUI event
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add needs display"

**Success Criteria:**
- UI objects ready for drawing
- No rendering conflicts

---

## PHASE 6: ROOM STRUCTURE
**Goal:** Set up game rooms with proper layers

### Step 1: Main Menu Room
- [ ] Create rm_menu
- [ ] Add layers: UI_Layer, Background_Layer
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add main menu room"

### Step 2: Main Game Room
- [ ] Create rm_prison_main
- [ ] Add UI_Layer (depth -1000)
- [ ] Call gamemaker-project-sync
- [ ] Add Effects_Layer (depth -500)
- [ ] Call gamemaker-project-sync
- [ ] Add Instances_Layer (depth 0)
- [ ] Call gamemaker-project-sync
- [ ] Add Collision_Layer (depth 100)
- [ ] Call gamemaker-project-sync
- [ ] Add Foreground_Tiles (depth 200)
- [ ] Call gamemaker-project-sync
- [ ] Add Main_Tiles (depth 300)
- [ ] Call gamemaker-project-sync
- [ ] Add Background_Tiles (depth 400)
- [ ] Call gamemaker-project-sync
- [ ] Add Parallax_Background (depth 500)
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add main game room with layers"

### Step 3: Game Over Room
- [ ] Create rm_game_over
- [ ] Add layers: UI_Layer, Background_Layer
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add game over room"

**Success Criteria:**
- All rooms created
- Layer structure correct
- Proper depth ordering

---

## PHASE 7: TILESET SETUP
**Goal:** Create tilemap resources

### Step 1: Create Tileset Sprites
- [ ] Create spr_tileset_walls (256x256 placeholder)
- [ ] Create spr_tileset_floors (256x256 placeholder)
- [ ] Create spr_tileset_collision (256x256 placeholder)
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add tileset sprites"

### Step 2: Create Tilesets
- [ ] Create ts_prison_walls from sprite
- [ ] Set tile size to 32x32
- [ ] Call gamemaker-project-sync
- [ ] Create ts_prison_floors from sprite
- [ ] Set tile size to 32x32
- [ ] Call gamemaker-project-sync
- [ ] Create ts_collision from sprite
- [ ] Set tile size to 32x32
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add tilesets"

### Step 3: Apply to Room
- [ ] Open rm_prison_main
- [ ] Assign ts_prison_walls to Main_Tiles layer
- [ ] Call gamemaker-project-sync
- [ ] Assign ts_prison_floors to Background_Tiles layer
- [ ] Call gamemaker-project-sync
- [ ] Assign ts_collision to Collision_Layer
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: assign tilesets to room layers"

**Success Criteria:**
- Tilesets created and configured
- Room layers have tilesets assigned
- No resource conflicts

---

## PHASE 8: SCRIPT ORGANIZATION
**Goal:** Create script structure and placeholders

### Step 1: Create Folders
- [ ] Create /scripts/Core/ folder
- [ ] Create /scripts/Systems/ folder
- [ ] Create /scripts/UI/ folder
- [ ] Create /scripts/Movement/ folder
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add script folder structure"

### Step 2: Core Scripts
- [ ] Create scr_time_functions in Core folder
- [ ] Add placeholder functions
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add time functions script"

### Step 3: System Scripts
- [ ] Create scr_save_load in Systems folder
- [ ] Call gamemaker-project-sync
- [ ] Create scr_needs_system in Systems folder
- [ ] Call gamemaker-project-sync
- [ ] Create scr_schedule_system in Systems folder
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add system scripts"

### Step 4: UI Scripts
- [ ] Create scr_ui_helpers in UI folder
- [ ] Add placeholder functions
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add UI helper scripts"

### Step 5: Movement Scripts
- [ ] Create scr_movement in Movement folder
- [ ] Call gamemaker-project-sync
- [ ] Create scr_collision in Movement folder
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: add movement scripts"

**Success Criteria:**
- Script folders organized
- All placeholder scripts created
- No compilation errors

---

## PHASE 9: BASIC OBJECT PLACEMENT
**Goal:** Place objects in main room for testing

### Step 1: Place Core Objects
- [ ] Open rm_prison_main
- [ ] Place obj_game_controller in Instances_Layer
- [ ] Call gamemaker-project-sync
- [ ] Place obj_time_system in Instances_Layer
- [ ] Call gamemaker-project-sync
- [ ] Place obj_ui_controller in Instances_Layer
- [ ] Call gamemaker-project-sync
- [ ] Place obj_camera_controller in Instances_Layer
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: place core controllers in room"

### Step 2: Place Character
- [ ] Place obj_inmate at position (room_width/2, room_height/2)
- [ ] Call gamemaker-project-sync
- [ ] Test project loads
- [ ] Commit "feat: place inmate in room"

**Success Criteria:**
- Objects placed in correct layers
- Room loads without errors
- Basic scene established

---

## PHASE 10: FINAL VALIDATION
**Goal:** Ensure everything works together

### Final Checks:
- [ ] Run full project validation
- [ ] Check all objects have events
- [ ] Verify room layer structure
- [ ] Confirm script organization
- [ ] Test project compilation
- [ ] Create final commit "feat: complete IDE setup"

**Success Criteria:**
- Project compiles without errors
- All elements in place
- Ready for gameplay implementation

---

## ROLLBACK PROCEDURES

### If Validation Fails:
1. Note the error message
2. Run `git status` to see changes
3. Run `git checkout -- .` to revert
4. Analyze what went wrong
5. Adjust approach and retry

### If IDE Won't Load:
1. Check Solitary.yyp.backup exists
2. Rename Solitary.yyp to Solitary.yyp.broken
3. Rename Solitary.yyp.backup to Solitary.yyp
4. Try loading again
5. Document the issue

---

## PROGRESS TRACKING

### Phase Completion:
- [ ] Phase 1: Workflow Validation
- [ ] Phase 2: Core Controllers
- [ ] Phase 3: Character Objects
- [ ] Phase 4: Interactive Objects
- [ ] Phase 5: UI Display Objects
- [ ] Phase 6: Room Structure
- [ ] Phase 7: Tileset Setup
- [ ] Phase 8: Script Organization
- [ ] Phase 9: Basic Object Placement
- [ ] Phase 10: Final Validation

### Issues Encountered:
(Document any problems here)

### Time Estimates:
- Phase 1: 5 minutes
- Phase 2: 15 minutes
- Phase 3: 10 minutes
- Phase 4: 10 minutes
- Phase 5: 10 minutes
- Phase 6: 20 minutes
- Phase 7: 15 minutes
- Phase 8: 15 minutes
- Phase 9: 10 minutes
- Phase 10: 5 minutes
**Total: ~2 hours**

---

## NOTES

- Always work in small increments
- Test frequently
- Commit working states
- Document any deviations from plan
- If stuck, check GAMEMAKER_TROUBLESHOOTING.md
- Backup .yyp file before major changes