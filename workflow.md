# Solitary Project Development Workflow

## Overview
This document describes the development workflow for the Solitary GameMaker project, including agent collaboration patterns, development practices, and validation procedures.

## Agent Architecture

### Primary Orchestrator
The orchestrator (claude.md) serves as the main entry point and coordinator for all development tasks.

**Responsibilities:**
- Receives and analyzes all user requests
- Delegates tasks to specialized agents
- Maintains project momentum
- Ensures end-to-end task completion

### Specialized Agents

#### 1. Git Project Manager
**Role:** Version control operations
**Triggers:**
- After file modifications
- When pushing to remote
- For branch operations

**Commands:**
```bash
# Common operations handled
git add .
git commit -m "message"
git push origin branch
git pull origin branch
```

#### 2. Kanban Project Manager
**Role:** Task tracking and project management
**Triggers:**
- Task status changes
- Sprint planning
- Progress reporting

**Board States:**
- Incoming → In Progress → Review → Complete

#### 3. GameMaker Project Sync
**Role:** Project file synchronization
**Triggers:**
- After creating new assets
- When modifying project structure
- For .yyp validation

**Validates:**
- Resource registration in .yyp
- Folder structure consistency
- Asset Browser synchronization

## Development Workflow

### 1. Task Reception
```mermaid
User Request → Orchestrator → Analysis → Task Planning
```

### 2. Implementation Flow
```mermaid
Plan → Code → Test → Validate → Commit → Update Kanban
```

### 3. Agent Collaboration Pattern

#### For New Features:
1. Orchestrator receives feature request
2. Kanban Manager creates task entry
3. Orchestrator implements feature
4. GameMaker Sync validates project files
5. Git Manager commits changes
6. Kanban Manager updates task status

#### For Bug Fixes:
1. Orchestrator identifies issue
2. Implements fix directly
3. Tests solution
4. Git Manager commits with fix description
5. Kanban Manager marks as resolved

## File Operations

### Creating New GameMaker Assets

1. **Objects:**
   ```
   objects/obj_name/obj_name.yy
   objects/obj_name/Create_0.gml
   objects/obj_name/Step_0.gml
   ```

2. **Sprites:**
   ```
   sprites/spr_name/spr_name.yy
   sprites/spr_name/[frame].png
   ```

3. **Scripts:**
   ```
   scripts/scr_name/scr_name.gml
   scripts/scr_name/scr_name.yy
   ```

### Registration Process
1. Create asset files in appropriate directory
2. Update Solitary.yyp with resource entry
3. Update Solitary.resource_order if needed
4. Validate with GameMaker Sync agent

## Git Workflow

### Branch Strategy
```
main          - Production-ready code
├── feature/* - New features
├── bugfix/*  - Bug fixes
└── hotfix/*  - Emergency fixes
```

### Commit Message Format
```
type: description

[optional body]

Agent: [orchestrator|git-manager|kanban|gamemaker-sync]
```

Types: feat, fix, docs, style, refactor, test, chore

### Push Procedure
1. Stage all changes
2. Create descriptive commit
3. Push to remote branch
4. Update kanban board

## Testing Procedures

### Automated Validation
- File syntax checking
- Project structure validation
- Git repository health
- Asset registration verification

### Manual Testing Steps
1. Open project in GameMaker Studio 2
2. Verify new assets appear in Asset Browser
3. Run game to test functionality
4. Check for compilation errors
5. Validate expected behavior

## Quality Standards

### Code Quality
- Follow GameMaker GML best practices
- Use descriptive variable names
- Comment complex logic
- Maintain consistent indentation

### Documentation
- Update relevant .md files
- Keep kanban board current
- Document API changes
- Maintain clear commit messages

### Project Structure
```
Solitary/
├── .git/                 # Version control
├── .claude/              # AI agent configuration
│   └── agents/           # Agent instruction files
├── objects/              # Game objects
├── sprites/              # Visual assets
├── scripts/              # Reusable code
├── rooms/                # Game levels
├── sounds/               # Audio assets
├── options/              # Platform settings
├── datafiles/            # External data
├── Solitary.yyp          # Main project file
├── Solitary.resource_order # Resource ordering
├── claude.md             # Orchestrator instructions
├── kanban.md             # Task tracking
├── workflow.md           # This file
└── README.md             # Project documentation
```

## Error Recovery

### Common Issues and Solutions

#### 1. GameMaker Sync Failure
```bash
# Validate .yyp syntax
# Check for duplicate GUIDs
# Ensure file paths are correct
# Rebuild resource tree if needed
```

#### 2. Git Conflicts
```bash
git stash           # Save local changes
git pull            # Get remote changes
git stash pop       # Apply local changes
# Resolve conflicts manually
git add .
git commit
```

#### 3. Missing Assets
- Check file exists in filesystem
- Verify registration in .yyp
- Update resource_order file
- Restart GameMaker if needed

## Performance Optimization

### Token Management
- Summarize long outputs
- Clear context between major tasks
- Use references instead of full content
- Batch related operations

### Execution Efficiency
- Plan before implementing
- Batch file operations
- Minimize redundant validations
- Cache frequently accessed data

## Validation Checklist

### Per-Task Validation
- [ ] Code compiles without errors
- [ ] Tests pass successfully
- [ ] Files properly registered
- [ ] Git commit created
- [ ] Kanban board updated
- [ ] Documentation current

### Sprint Validation
- [ ] All tasks moved to Complete
- [ ] Code pushed to remote
- [ ] Sprint retrospective documented
- [ ] Next sprint planned
- [ ] Backlog groomed

## Communication Patterns

### Status Updates
```
[PHASE] Status: description
Example: [CODE] Status: Creating player object with movement controls
```

### Error Reporting
```
[ERROR] Issue: description
Action: resolution steps being taken
```

### Completion Notification
```
[COMPLETE] Task: description
Result: what was accomplished
Next: suggested follow-up actions
```

## Continuous Improvement

### Metrics to Track
- Tasks completed per sprint
- Time from Incoming to Complete
- Number of validation failures
- Commit frequency
- Documentation updates

### Review Process
1. Weekly backlog grooming
2. Sprint retrospectives
3. Workflow optimization
4. Tool effectiveness assessment
5. Documentation updates

## Remember
The workflow prioritizes:
1. **Autonomy** - Complete tasks without interruption
2. **Quality** - Maintain high standards
3. **Efficiency** - Optimize for speed and accuracy
4. **Documentation** - Keep everything current
5. **Collaboration** - Agents work seamlessly together