# Solitary Project Kanban Board

## Board Overview
This kanban board tracks all development tasks for the Solitary GameMaker project. Tasks move through stages from left to right as work progresses.

## Workflow States

### 📥 INCOMING
New tasks and ideas that need to be prioritized

### 🎯 READY FOR SCOPE
Tasks that have been prioritized and are ready to be worked on

### 🚀 IN PROGRESS
Tasks actively being worked on (limit: 3)

### 👀 REVIEW
Tasks completed but awaiting validation

### ✅ COMPLETE
Finished tasks with all acceptance criteria met

---

## Current Sprint: Sprint 2 - Foundation Systems

### 📥 INCOMING

#### Must-Have Features (To be scheduled)
- **SOL-006: Win/Loss Conditions**
  - Epic: Core Loop Closure
  - Implement win condition (survive 5 days)
  - Implement loss condition (needs hit 0)
  - Create end screen with result display
  - Estimated: 2 hours
  - Priority: Must-Have
  - Dependencies: Needs System, Time System

#### Should-Have Features (Post-MVP)
- **SOL-007: Visual Polish**
  - Add room backgrounds
  - Implement basic animations
  - Create particle effects
  - Priority: Should-Have
  - Status: Deferred to post-MVP

- **SOL-008: Audio System**
  - Add sound effects for activities
  - Implement background music
  - Create audio manager
  - Priority: Should-Have
  - Status: Deferred to post-MVP

- **SOL-009: Inmate Traits**
  - Implement trait system
  - Add 5-8 different traits
  - Modify needs decay based on traits
  - Priority: Should-Have
  - Status: Deferred to post-MVP

- **SOL-010: Random Events**
  - Create event system
  - Implement 2-3 basic events
  - Add event probability calculations
  - Priority: Should-Have
  - Status: Deferred to post-MVP

### 🎯 READY FOR SCOPE

- **SOL-001: Time System Implementation**
  - Epic: Foundation Systems
  - Create obj_time_system
  - Implement real-time clock (1 min = 1 hour)
  - Add pause/resume functionality
  - Display current time and day counter
  - Show days remaining in sentence
  - Estimated: 3 hours
  - Priority: Must-Have (P1)
  - Acceptance Criteria:
    - Clock advances at correct 1:1 ratio
    - Pause stops all time progression
    - Time display updates every frame
    - Day counter increments at midnight

- **SOL-002: Game State Controller**
  - Epic: Foundation Systems
  - Create obj_game_controller
  - Implement state machine (Menu/Playing/Paused/End)
  - Set up main game loop
  - Handle system updates each tick
  - Estimated: 4 hours
  - Priority: Must-Have (P1)
  - Dependencies: None
  - Acceptance Criteria:
    - All states transition correctly
    - Systems update in correct order
    - No memory leaks between states
    - Proper initialization/cleanup

- **SOL-003: Save/Load System**
  - Epic: Foundation Systems
  - Create obj_save_system
  - Implement JSON serialization
  - Add auto-save every game hour
  - Single save slot implementation
  - Estimated: 3 hours
  - Priority: Must-Have (P1)
  - Dependencies: Game Controller
  - Acceptance Criteria:
    - Save preserves exact game state
    - Load restores all values correctly
    - Auto-save triggers hourly
    - No data corruption on save/load

- **SOL-004: Daily Schedule System**
  - Epic: Core Gameplay
  - Create obj_schedule_system
  - Implement 24-hour schedule grid
  - Fixed activities (Sleep/Eat/Clean/Yard/Free)
  - Visual schedule display with current activity
  - Estimated: 4 hours
  - Priority: Must-Have (P2)
  - Dependencies: Time System
  - Acceptance Criteria:
    - Schedule triggers at correct hours
    - Current activity clearly indicated
    - All activities have defined time slots
    - Visual grid shows full day schedule

- **SOL-005: Needs System**
  - Epic: Core Gameplay
  - Create obj_needs_system
  - Implement Hunger and Cleanliness stats
  - Add decay rates (hunger -6/hr, clean -4/hr)
  - Add fulfillment rates (eat +60, clean +70)
  - Visual bars with warnings
  - Estimated: 4 hours
  - Priority: Must-Have (P2)
  - Dependencies: Schedule System
  - Acceptance Criteria:
    - Needs decay at specified rates
    - Activities restore needs correctly
    - Visual warnings at <20
    - Critical state at <5

### 🚀 IN PROGRESS

- **IDE-001: Complete IDE Setup Phase 1-10**
  - Epic: Project Setup
  - Phase 1: Workflow Validation - STARTING NOW
  - Phase 2: Core Controllers Creation
  - Phase 3: Character Objects Setup
  - Phase 4: Interactive Objects
  - Phase 5: UI Display Objects
  - Phase 6: Room Structure with Layers
  - Phase 7: Tileset Implementation
  - Phase 8: Script Organization
  - Phase 9: Object Placement
  - Phase 10: Final Validation
  - Estimated: 2 hours
  - Priority: Must-Have (P0 - Blocker)
  - Dependencies: None
  - Started: 2025-09-19
  - Acceptance Criteria:
    - All objects created in IDE
    - Room layers properly structured
    - Scripts organized in folders
    - Project compiles without errors
    - All placeholder assets in place

### 👀 REVIEW

- **INIT-004: GameMaker Object Creation and Sync**
  - Create test object in GameMaker
  - Validate .yyp synchronization
  - Ensure Asset Browser registration
  - Status: Pending validation
  - Assigned: gamemaker-project-sync

### ✅ COMPLETE

- **INIT-001: Documentation Setup** ✓
  - Created claude.md with orchestrator instructions
  - Documented agent roles and responsibilities
  - Established token management strategy
  - Completed: 2025-09-19
  - Assigned: orchestrator

- **INIT-002: Git Repository Initialization** ✓
  - Initialized git repository
  - Created README.md
  - Set remote origin to GitHub
  - Made initial commit with all files
  - Pushed to remote successfully
  - Completed: 2025-09-19
  - Assigned: git-project-manager

- **INIT-003: Kanban Board Setup** ✓
  - Created kanban.md structure
  - Added workflow states
  - Documented current sprint
  - Tracked initialization tasks
  - Completed: 2025-09-19
  - Assigned: kanban-project-manager

- **INIT-005: Workflow Documentation** ✓
  - Created workflow.md
  - Documented agent collaboration patterns
  - Validated all systems working together
  - Completed: 2025-09-19
  - Assigned: orchestrator

---

## Sprint Planning

### Sprint 2: Foundation Systems (Week 1)
**Goal**: Implement core foundation systems that all gameplay depends on
**Duration**: 5 days
**Priority Tasks**:
1. SOL-001: Time System (Day 1-2)
2. SOL-002: Game Controller (Day 2-3)
3. SOL-003: Save/Load System (Day 4-5)

### Sprint 3: Core Gameplay (Week 2)
**Goal**: Implement the core gameplay loop
**Duration**: 5 days
**Planned Tasks**:
1. SOL-004: Schedule System (Day 6-7)
2. SOL-005: Needs System (Day 8-9)
3. SOL-006: Win/Loss Conditions (Day 10)

### Sprint 4: Economy & Polish
**Goal**: Add economy system and final polish
**Duration**: 4 days
**Planned Tasks**:
- Economy System implementation
- UI improvements
- Bug fixes and balance tuning
- Final testing

---

## Epics Breakdown

### Epic: Foundation Systems
**Description**: Core technical systems that everything else builds on
**Tasks**: SOL-001, SOL-002, SOL-003
**Status**: Ready to start
**Priority**: Highest

### Epic: Core Gameplay
**Description**: The main gameplay loop and player interactions
**Tasks**: SOL-004, SOL-005, SOL-006
**Status**: Pending foundation completion
**Priority**: High

### Epic: Economy System
**Description**: Money management and resource purchasing
**Tasks**: To be defined
**Status**: Not started
**Priority**: Medium

### Epic: Polish & UX
**Description**: Visual feedback, audio, and quality of life improvements
**Tasks**: SOL-007, SOL-008
**Status**: Deferred to post-MVP
**Priority**: Low

---

## Notes

### Task Format
```
- **[ID]: Task Title**
  - Epic: Parent epic name
  - Description of work
  - Acceptance criteria
  - Estimated: X hours
  - Priority: Must/Should/Could/Won't
  - Dependencies: Other task IDs
  - Status: Current status
  - Assigned: Agent/Person
```

### Priority System
- **P1**: Foundation - Required for anything else to work
- **P2**: Core Loop - Required for basic gameplay
- **P3**: Features - Enhance gameplay experience
- **P4**: Polish - Nice to have improvements

### Update Frequency
- Board updated with each task state change
- Sprint review at completion
- Daily standup notes in progress tasks

### Success Metrics
- Sprint 2: All foundation systems operational
- Sprint 3: Complete gameplay loop functional
- Sprint 4: Game playable start to finish
- Overall: 2-week delivery target met