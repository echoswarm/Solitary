# Solitary - Ultra-Minimal Vertical Slice GDD

## Core Concept
**ONE SENTENCE**: A real-time prison micro-sim where you keep one inmate alive for their 5-day sentence using a daily schedule and limited budget.

## Absolute Minimum Viable Features (2-Week Sprint)

### MUST-HAVE SYSTEMS (Priority Order)

#### 1. Time System [FOUNDATION]
- Real-time clock: 1 real minute = 1 game hour
- 24-hour day cycle with day counter
- Pause/resume functionality
- Display: Current time, current day, days remaining

#### 2. Game State Controller [FOUNDATION]
- Central game loop managing all systems
- State machine: Menu → Playing → Paused → End
- Update all systems each tick
- Handle transitions between states

#### 3. Save/Load System [FOUNDATION]
- Save game state to JSON
- Load and restore state
- Auto-save every game hour
- Single save slot for simplicity

#### 4. Daily Schedule System [CORE GAMEPLAY]
- 24-hour schedule grid (hardcoded for MVP)
- Fixed activities: Sleep (22-06), Eat (07,12,18), Clean (08), Yard (14), Free (rest)
- Visual schedule display
- Current activity indicator

#### 5. Needs System [CORE GAMEPLAY]
- Two needs: Hunger (0-100), Cleanliness (0-100)
- Hunger: -6/hour awake, -3/hour sleep, +60 when eating
- Cleanliness: -4/hour, +70 when cleaning
- Visual bars showing current levels
- Warning at <20, critical at <5

#### 6. Economy System [CORE GAMEPLAY]
- Starting budget: $500
- Food cost: $5 per meal
- Guard wage: $100/week (auto-deduct Mondays)
- Buy button for food (1 meal at a time)
- Display: Current money, food inventory count

#### 7. Win/Loss Conditions [CORE LOOP CLOSURE]
- Win: Inmate survives 5 days (120 hours)
- Loss: Any need hits 0
- Simple end screen with result

## REMOVED FROM SCOPE (For Post-MVP)
- ❌ Guard character and pathfinding
- ❌ Inmate traits and personality
- ❌ Random events
- ❌ Bulk purchasing
- ❌ Multiple speed settings
- ❌ Offline progression
- ❌ Mood system
- ❌ Visual prison rooms
- ❌ Animations
- ❌ Sound effects
- ❌ Multiple inmates
- ❌ Reputation system
- ❌ Tooltips and help text

## Technical Implementation Plan

### GameMaker Objects Required
1. `obj_game_controller` - Main game loop and state management
2. `obj_time_system` - Clock and day tracking
3. `obj_schedule_system` - Daily schedule management
4. `obj_needs_system` - Hunger/cleanliness tracking
5. `obj_economy_system` - Money and inventory
6. `obj_save_system` - Save/load functionality
7. `obj_ui_controller` - All UI rendering

### Room Structure
1. `rm_menu` - Start screen
2. `rm_game` - Main gameplay room
3. `rm_end` - Win/loss screen

### Data Structure (Global)
```gml
global.game_state = {
    current_hour: 0,
    current_day: 1,
    total_days: 5,
    is_paused: false,

    inmate_hunger: 100,
    inmate_cleanliness: 100,

    money: 500,
    food_inventory: 10,

    schedule: [array of 24 activity enums]
}
```

## Development Priority (Sprint 2)

### Week 1: Foundation
1. **Day 1-2**: Time system with pause/resume
2. **Day 3-4**: Game controller and state machine
3. **Day 5**: Save/load system

### Week 2: Gameplay
4. **Day 6-7**: Schedule system with UI
5. **Day 8-9**: Needs system with decay/fulfillment
6. **Day 10-11**: Economy with purchasing
7. **Day 12**: Win/loss conditions and end screen

### Final Testing
8. **Day 13-14**: Bug fixes and balance tuning

## Success Criteria
- [ ] Game runs for 5 full days without crashes
- [ ] Time advances correctly at 1:1 ratio
- [ ] Needs decay and restore as specified
- [ ] Money deducts for purchases and wages
- [ ] Game ends appropriately on win/loss
- [ ] Save/load preserves exact game state

## Key Metrics
- Target frame rate: 60 FPS
- Save file size: <10KB
- Load time: <1 second
- Memory usage: <50MB

## Risk Mitigation
- **RISK**: Scope creep → **SOLUTION**: Strictly follow this GDD, no additions
- **RISK**: Time calculations → **SOLUTION**: Use GameMaker's built-in delta_time
- **RISK**: Save corruption → **SOLUTION**: Validate JSON, keep backup
- **RISK**: Balance issues → **SOLUTION**: Use constants for easy tuning

## Notes for Developers
- Start with `obj_game_controller` as the foundation
- All systems should be modular and communicate through the controller
- Use GameMaker's built-in JSON functions for save/load
- Keep UI simple - text and rectangles only for MVP
- Test with accelerated time (dev mode) to verify 5-day playthrough