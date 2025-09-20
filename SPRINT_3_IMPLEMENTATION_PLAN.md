# Sprint 3 GML Implementation Plan
## Prioritized 5-Day Development Schedule

## Current Issues Diagnosed

### 1. Character Visibility Problem
**Issue**: obj_inmate and obj_guard not visible when game runs
**Cause**: Draw Event exists but has no actual drawing code (just comments)
**Solution**: Add `draw_self()` or `draw_sprite_ext()` to Draw_0.gml

### 2. Door Animation Problem
**Issue**: Doors continuously loop open/closed animation
**Cause**: No animation control in Create event
**Solution**: Set `image_speed = 0` in Create event, control animation on interaction

### 3. Clock Display Problem
**Issue**: No visual time display
**Cause**: Draw GUI event exists but empty
**Solution**: Add text drawing code to Draw_64.gml

### 4. System Functionality
**Issue**: No game logic implemented yet
**Status**: All objects exist but need GML implementation

---

## PHASE 1 - Make Things Visible (Day 1)
### Priority: CRITICAL - Nothing works without visibility

#### Morning (2 hours)
- **Fix Character Sprites**
  - Add `draw_self()` to obj_inmate Draw_0.gml
  - Add `draw_self()` to obj_guard Draw_0.gml
  - Verify sprite assignments in .yy files
  - Test visibility in game

#### Afternoon (2 hours)
- **Fix Door Animations**
  - Set `image_speed = 0` in obj_door Create_0.gml
  - Add `is_open` variable
  - Create door state management

- **Add Clock Display**
  - Implement time display in obj_time_system Draw_64.gml
  - Format: "Day X - HH:MM"
  - Position: Top center of screen

#### Validation
- All characters visible
- Doors static (not animating)
- Clock showing "Day 1 - 06:00"

---

## PHASE 2 - Core Systems (Day 2)
### Priority: HIGH - Foundation for all gameplay

#### Morning (2 hours)
- **Time System Implementation**
  ```gml
  // obj_time_system Create_0.gml
  current_hour = 6;
  current_minute = 0;
  current_day = 1;
  time_speed = 1; // 1 second = 1 minute
  is_paused = false;
  ```
  - Tick time forward in Step event
  - Day rollover at midnight
  - Pause/resume capability

#### Afternoon (2 hours)
- **Game State Controller**
  ```gml
  // obj_game_controller Create_0.gml
  enum GameState {
      MENU,
      PLAYING,
      PAUSED,
      GAMEOVER
  }
  game_state = GameState.PLAYING;
  ```
  - State management system
  - Update order for all systems
  - Pause handling

- **Basic Inmate Movement**
  - WASD or arrow key movement
  - Grid-based (32x32)
  - Collision with walls

---

## PHASE 3 - Interactions (Day 3)
### Priority: HIGH - Core gameplay loop

#### Morning (2 hours)
- **Door Interaction System**
  - E key to interact when near
  - Open/close animation
  - Check if allowed (schedule-based)
  - Block movement when closed

#### Afternoon (2 hours)
- **Schedule System**
  ```gml
  // obj_schedule_system Create_0.gml
  schedule = [
      {hour: 6, activity: "Wake Up"},
      {hour: 7, activity: "Breakfast"},
      {hour: 9, activity: "Yard Time"},
      // ... etc
  ];
  ```
  - Display current activity
  - Check allowed locations
  - Enforce schedule rules

- **Activity Triggers**
  - Detect when entering activity zones
  - Start activity timer
  - Update needs accordingly

---

## PHASE 4 - Needs System (Day 4)
### Priority: MEDIUM - Win/loss conditions

#### Morning (2 hours)
- **Needs Implementation**
  ```gml
  // obj_needs_system Create_0.gml
  hunger = 80;
  cleanliness = 80;
  hunger_decay_rate = 6; // per hour
  clean_decay_rate = 4; // per hour
  ```
  - Decay over time
  - Visual bar updates
  - Warning states (<20)
  - Critical states (<5)

#### Afternoon (2 hours)
- **Food Station Interaction**
  - Interact to eat during meal times
  - Restore hunger to 80
  - Animation feedback
  - Schedule validation

- **Cleaning Interaction**
  - Shower/cleaning activities
  - Restore cleanliness to 80
  - Time requirement (5 minutes)

---

## PHASE 5 - Polish & Save System (Day 5)
### Priority: LOW-MEDIUM - Complete experience

#### Morning (2 hours)
- **Save/Load System**
  ```gml
  // Save all game state to JSON
  save_data = {
      day: current_day,
      time: current_time,
      needs: {hunger, cleanliness},
      position: {x, y}
  };
  ```
  - Auto-save every game hour
  - Manual save option
  - Load on game start

#### Afternoon (2 hours)
- **Win/Loss Conditions**
  - Loss: Any need hits 0
  - Win: Survive 5 days
  - End screen with stats
  - Restart option

- **UI Polish**
  - Need bar animations
  - Warning flashes
  - Activity notifications
  - Money display updates

---

## Implementation Order Summary

### Day 1 Focus: VISIBILITY
1. Fix character sprites (30 min)
2. Fix door animations (30 min)
3. Add clock display (1 hour)
4. Verify all objects visible (1 hour)

### Day 2 Focus: SYSTEMS
1. Time system ticking (1 hour)
2. Game state machine (1 hour)
3. Basic movement (2 hours)

### Day 3 Focus: INTERACTIONS
1. Door interactions (1 hour)
2. Schedule system (1 hour)
3. Activity zones (2 hours)

### Day 4 Focus: NEEDS
1. Need decay system (1 hour)
2. Need restoration (1 hour)
3. Visual feedback (2 hours)

### Day 5 Focus: POLISH
1. Save/load system (2 hours)
2. Win/loss conditions (1 hour)
3. Final polish (1 hour)

---

## Success Metrics

### Day 1 Complete When:
- Inmate and guard visible
- Doors not animating
- Clock shows time

### Day 2 Complete When:
- Time advances (1 sec = 1 min)
- Inmate can move with keys
- Game can pause/unpause

### Day 3 Complete When:
- Doors open/close on interaction
- Schedule displays current activity
- Activities trigger in zones

### Day 4 Complete When:
- Needs decay over time
- Food/cleaning restore needs
- Visual warnings work

### Day 5 Complete When:
- Game saves and loads
- Win at day 5
- Loss at 0 needs

---

## Critical Path

**MUST HAVE** (Days 1-3):
- Character visibility
- Time system
- Basic movement
- Door interactions
- Schedule system

**SHOULD HAVE** (Day 4):
- Needs system
- Food/cleaning

**NICE TO HAVE** (Day 5):
- Save/load
- Polish

---

## Notes for Implementation

1. **Start Simple**: Get basic functionality working before adding complexity
2. **Test Often**: Run game after each major addition
3. **Use Placeholder Values**: Hard-code values first, make configurable later
4. **Follow Existing Structure**: Use the objects already created in IDE
5. **Incremental Progress**: Commit working code frequently

---

## Next Immediate Actions

1. Open obj_inmate Draw_0.gml and add `draw_self();`
2. Open obj_guard Draw_0.gml and add `draw_self();`
3. Open obj_door Create_0.gml and add `image_speed = 0;`
4. Open obj_time_system Draw_64.gml and add time display code
5. Test game to verify all fixes work