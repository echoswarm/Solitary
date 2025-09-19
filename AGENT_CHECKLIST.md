# Agent Task Execution Checklist

## MANDATORY Checklist for ALL Agents

This checklist MUST be followed by EVERY agent working on the Solitary project. No exceptions.

### Pre-Task Checklist
- [ ] **Check in with orchestrator before starting**
  - Confirm task assignment
  - Understand expected outcome
  - Get any special instructions

- [ ] **Reference working project format**
  - Open Trinketeer project for format reference
  - Path: C:\Users\quinn\GameMakerProjects\Trinketeer
  - Never trust memory - always verify

### During Task Execution

#### For GameMaker Resource Creation
- [ ] **Copy exact format from Trinketeer**
  - Use Trinketeer sprites/objects as templates
  - Only change names and specific values
  - Maintain exact field ordering

- [ ] **Verify critical fields**
  - [ ] Type tag present (`$GMSprite`, `$GMObject`, etc.) as FIRST field
  - [ ] resourceVersion is "2.0" everywhere
  - [ ] preMultiplyAlpha field present for sprites
  - [ ] No extra fields added
  - [ ] Correct case in folder paths

#### For Code Implementation
- [ ] **Follow existing patterns**
  - Match project code style
  - Use consistent naming conventions
  - Add comments for complex logic

#### For Documentation Updates
- [ ] **Maintain consistency**
  - Follow existing document structure
  - Use same markdown formatting
  - Update table of contents if present

### Post-Task Validation

- [ ] **Call gamemaker-project-sync if GameMaker files modified**
  - MANDATORY for ANY resource creation/modification
  - Wait for sync completion
  - Check return status

- [ ] **Verify project still loads**
  - Open in GameMaker Studio 2
  - Check for load errors
  - Verify new resources appear in Asset Browser
  - Run game to test compilation

- [ ] **Test functionality**
  - Verify feature works as expected
  - Check for runtime errors
  - Test edge cases if applicable

### Reporting Requirements

- [ ] **Report back to orchestrator with status**
  - Success: "Task completed, validation passed"
  - Failure: "Task failed at [step], error: [details]"
  - Blocked: "Cannot proceed, need: [requirement]"

- [ ] **Document any issues encountered**
  - What went wrong
  - How it was fixed
  - Add to troubleshooting guide if new issue

### Communication Templates

#### Starting Task
```
[AGENT: agent-name] Starting: [task description]
Reference: Using Trinketeer format for [resource type]
```

#### Progress Update
```
[AGENT: agent-name] Progress: [what was completed]
Status: [percentage]% complete
Next: [what comes next]
```

#### Issue Report
```
[AGENT: agent-name] Issue: [problem description]
Attempted: [what was tried]
Resolution: [how fixing/need help]
```

#### Completion Report
```
[AGENT: agent-name] Complete: [task description]
Validated: [what was tested]
Result: [outcome/changes made]
```

## Critical Reminders

### NEVER
- Skip gamemaker-project-sync after resource changes
- Commit without testing project loads
- Trust generated formats without verification
- Proceed if validation fails
- Leave tasks partially complete

### ALWAYS
- Use Trinketeer as the source of truth
- Validate EVERYTHING before marking complete
- Report issues immediately to orchestrator
- Document new problems and solutions
- Test that the project still works

## Validation Commands

### Quick Validation Sequence
```bash
# 1. Check project syntax
cat Solitary.yyp | python -m json.tool > /dev/null && echo "Valid JSON"

# 2. Check for duplicate GUIDs (should return 0)
grep -o '"id":{[^}]*"name":"[^"]*","path":"[^"]*"}' Solitary.yyp | sort | uniq -d | wc -l

# 3. Verify file counts match
ls sprites/ | wc -l
grep -c '"GMSprite"' Solitary.yyp

# 4. Run sync agent
call gamemaker-project-sync
```

### Format Verification
```bash
# Compare with Trinketeer format
diff -u /path/to/trinketeer/resource.yy /path/to/new/resource.yy
```

## Emergency Procedures

### If Project Won't Load
1. Check GAMEMAKER_TROUBLESHOOTING.md
2. Compare format with Trinketeer
3. Look for these common issues:
   - Missing type tags
   - Wrong resourceVersion
   - Invalid JSON syntax
   - Duplicate resource names
   - Case sensitivity errors

### If Sync Fails
1. Verify .yyp syntax is valid JSON
2. Check all referenced files exist
3. Ensure no duplicate GUIDs
4. Manually fix .yyp if needed
5. Re-run sync

### If Git Conflicts
1. Stash local changes
2. Pull latest
3. Apply stash
4. Resolve conflicts
5. Re-validate project

## Final Reminder

**This checklist is not optional. Following it will save hours of debugging. Skipping it will break the project.**

Every agent, every time, no exceptions.