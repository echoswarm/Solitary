# Sprint 2: Foundation Systems - Implementation Plan

## Sprint Overview
**Duration**: 5 days (Days 1-5 of development)
**Goal**: Build the technical foundation that all gameplay systems will depend on
**Success Criteria**: All three foundation systems operational and integrated

## Why These Systems First?

### 1. Time System (SOL-001) - FIRST PRIORITY
**Why First**: Everything in Solitary revolves around time. The real-time clock drives:
- When activities happen
- When needs decay
- When the game ends
- When saves trigger

Without time, nothing else can function. This is the heartbeat of the game.

### 2. Game State Controller (SOL-002) - SECOND PRIORITY
**Why Second**: The controller orchestrates all systems and manages game flow:
- Initializes and updates all other systems
- Handles state transitions (menu → playing → end)
- Manages the game loop
- Prevents memory leaks and ensures clean transitions

This is the nervous system connecting all parts.

### 3. Save/Load System (SOL-003) - THIRD PRIORITY
**Why Third**: Critical for development efficiency and player experience:
- Allows testing without losing progress
- Enables quick iteration during development
- Provides data persistence foundation
- Required for any real playtesting

This is the memory of the game.

## Implementation Schedule

### Day 1: Time System Core
**Morning (2 hours)**
- Create obj_time_system object
- Implement basic time tracking variables
- Set up 1:1 real-time to game-time ratio

**Afternoon (2 hours)**
- Add pause/resume functionality
- Implement day counter and rollover at midnight
- Create time display formatting

### Day 2: Time System Polish & Controller Start
**Morning (2 hours)**
- Add days remaining calculation
- Test time system thoroughly
- Document time system API

**Afternoon (2 hours)**
- Create obj_game_controller
- Implement basic state machine
- Set up state transition functions

### Day 3: Game Controller Completion
**Morning (2 hours)**
- Implement system initialization
- Add update loop for all systems
- Create system registration mechanism

**Afternoon (2 hours)**
- Test state transitions
- Add error handling
- Ensure proper cleanup on state changes

### Day 4: Save System Core
**Morning (2 hours)**
- Create obj_save_system
- Implement JSON serialization of game state
- Create save file writing

**Afternoon (2 hours)**
- Implement load and deserialization
- Add data validation
- Test save/load cycle

### Day 5: Integration & Testing
**Morning (2 hours)**
- Implement auto-save on hour change
- Integrate all three systems
- Fix any integration issues

**Afternoon (2 hours)**
- Comprehensive testing
- Performance validation
- Documentation updates

## Technical Specifications

### Time System API
```gml
// Public functions
time_system_init()
time_system_update(delta_time)
time_system_pause()
time_system_resume()
time_system_get_current_hour()
time_system_get_current_day()
time_system_get_days_remaining()
```

### Game Controller States
```gml
enum GAME_STATE {
    MENU,
    PLAYING,
    PAUSED,
    END
}
```

### Save Data Structure
```json
{
    "version": 1,
    "timestamp": 1234567890,
    "time": {
        "current_hour": 14,
        "current_day": 3,
        "is_paused": false
    },
    "game": {
        "state": "PLAYING",
        "total_days": 5
    }
}
```

## Definition of Done
- [ ] Time advances at exactly 1 real minute = 1 game hour
- [ ] Pause completely stops time progression
- [ ] Day counter increments correctly at midnight
- [ ] Game controller manages all state transitions
- [ ] Save preserves exact game state
- [ ] Load restores game to exact saved state
- [ ] Auto-save triggers every game hour
- [ ] All systems integrate without conflicts
- [ ] Frame rate remains stable at 60 FPS
- [ ] No memory leaks detected

## Risks & Mitigations
1. **Time drift**: Use delta_time for accuracy, not frame counting
2. **Save corruption**: Validate JSON before writing, keep backup
3. **State conflicts**: Clear state machine with no ambiguous transitions
4. **Integration issues**: Test each system in isolation first

## Next Sprint Preview
Once foundation is complete, Sprint 3 will add:
- Daily Schedule System (builds on Time)
- Needs System (builds on Time + Schedule)
- Win/Loss Conditions (builds on all systems)

These require the foundation to be rock-solid.

## Notes for Developers
- Keep each system modular and independent
- Use clear naming conventions (prefix with system name)
- Comment all public functions
- Test edge cases (midnight rollover, pause during save, etc.)
- Use constants for all magic numbers