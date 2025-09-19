# GameMaker Format Troubleshooting Guide

## Overview
This document captures all the format issues encountered during GameMaker sprite and resource creation, their root causes, and solutions. Reference project: Trinketeer.

## Critical Format Issues and Solutions

### 1. Missing Resource Type Tags

**Error Message:**
```
ERROR: Resource file is missing required $GMSprite tag
```

**Root Cause:**
GameMaker resources require specific type tags at the beginning of the JSON structure.

**Broken Format:**
```json
{
  "%Name": "spr_example",
  "resourceType": "GMSprite",
  ...
}
```

**Working Format:**
```json
{
  "$GMSprite": "",
  "%Name": "spr_example",
  "resourceType": "GMSprite",
  ...
}
```

**Solution:**
- ALWAYS include the appropriate type tag as the first field
- Common tags: `$GMSprite`, `$GMObject`, `$GMRoom`, `$GMScript`
- The tag value is always an empty string

**Prevention:**
- Use Trinketeer project as reference for all resource creation
- Verify type tag presence before saving any resource file

### 2. Resource Version Mismatch

**Error Message:**
```
ERROR: Invalid resource version "1.0" - expected "2.0"
```

**Root Cause:**
GameMaker 2024.8+ uses resourceVersion 2.0 for all resources.

**Broken Format:**
```json
{
  "resourceVersion": "1.0"
}
```

**Working Format:**
```json
{
  "resourceVersion": "2.0"
}
```

**Solution:**
- ALL resources must use `"resourceVersion": "2.0"`
- This applies to main resource, frames, layers, and all nested structures

**Prevention:**
- Never use outdated templates
- Always verify version against working projects

### 3. Missing preMultiplyAlpha Field

**Error Message:**
```
ERROR: Sprite missing required field 'preMultiplyAlpha'
```

**Root Cause:**
Sprites require the preMultiplyAlpha field for proper alpha channel handling.

**Broken Format:**
```json
{
  "$GMSprite": "",
  "%Name": "spr_example",
  "origin": 0,
  "parent": {...},
  "resourceType": "GMSprite"
}
```

**Working Format:**
```json
{
  "$GMSprite": "",
  "%Name": "spr_example",
  "origin": 0,
  "parent": {...},
  "preMultiplyAlpha": false,
  "resourceType": "GMSprite"
}
```

**Solution:**
- Add `"preMultiplyAlpha": false` after the parent field
- This field is MANDATORY for all sprites

**Prevention:**
- Include in all sprite templates
- Verify field presence in generated sprites

### 4. Incorrect Field Ordering

**Error Message:**
```
ERROR: Unexpected field 'originX' at position X
```

**Root Cause:**
GameMaker expects fields in a specific order, especially for sprites.

**Broken Format:**
```json
{
  "$GMSprite": "",
  "%Name": "spr_example",
  "originX": 0,
  "originY": 0,
  "origin": 0,
  ...
}
```

**Working Format (Correct Order):**
```json
{
  "$GMSprite": "",
  "%Name": "spr_example",
  "bboxMode": 0,
  "bbox_bottom": 31,
  "bbox_left": 0,
  "bbox_right": 31,
  "bbox_top": 0,
  "collisionKind": 1,
  "collisionTolerance": 0,
  "DynamicTexturePage": false,
  "edgeFiltering": false,
  "For3D": false,
  "frames": [...],
  "gridX": 0,
  "gridY": 0,
  "height": 32,
  "HTile": false,
  "layers": [...],
  "name": "spr_example",
  "nineSlice": null,
  "origin": 0,
  "parent": {...},
  "preMultiplyAlpha": false,
  "resourceType": "GMSprite",
  "resourceVersion": "2.0",
  "sequence": {...},
  "swatchColours": null,
  "swfPrecision": 0.5,
  "textureGroupId": {...},
  "type": 0,
  "VTile": false,
  "width": 32
}
```

**Solution:**
- Follow exact field order from working sprites
- originX and originY are NOT sprite fields (they belong in sequences)

**Prevention:**
- Use field order from Trinketeer sprites as template
- Never add fields not present in working examples

### 5. highlightColour Format Issue

**Error Message:**
```
ERROR: Invalid highlightColour format - expected number, got array
```

**Root Cause:**
The highlightColour field in tracks should be a single number, not an array.

**Broken Format:**
```json
"highlightColour": [4293173671]
```

**Working Format:**
```json
"highlightColour": 4293173671
```

**Solution:**
- Use single number value for highlightColour
- Default value: 4293173671

**Prevention:**
- Never wrap highlightColour in array brackets
- Verify format in sequence tracks

### 6. Case Sensitivity in Folder Paths

**Error Message:**
```
ERROR: Cannot find folder 'folders/Sprites/Ui.yy'
```

**Root Cause:**
GameMaker is case-sensitive for folder references, even on Windows.

**Broken Format:**
```json
"parent": {
  "name": "Ui",
  "path": "folders/Sprites/Ui.yy"
}
```

**Working Format:**
```json
"parent": {
  "name": "UI",
  "path": "folders/Sprites/UI.yy"
}
```

**Solution:**
- Match exact case of actual folder names
- Common issue: UI vs Ui, ui vs UI

**Prevention:**
- Always verify folder case before referencing
- Use consistent naming conventions

## Complete Working Sprite Template

```json
{
  "$GMSprite": "",
  "%Name": "spr_example",
  "bboxMode": 0,
  "bbox_bottom": 31,
  "bbox_left": 0,
  "bbox_right": 31,
  "bbox_top": 0,
  "collisionKind": 1,
  "collisionTolerance": 0,
  "DynamicTexturePage": false,
  "edgeFiltering": false,
  "For3D": false,
  "frames": [
    {
      "$GMSpriteFrame": "",
      "%Name": "uuid-here",
      "name": "uuid-here",
      "resourceType": "GMSpriteFrame",
      "resourceVersion": "2.0"
    }
  ],
  "gridX": 0,
  "gridY": 0,
  "height": 32,
  "HTile": false,
  "layers": [
    {
      "$GMImageLayer": "",
      "%Name": "uuid-here",
      "blendMode": 0,
      "displayName": "default",
      "isLocked": false,
      "name": "uuid-here",
      "opacity": 100.0,
      "resourceType": "GMImageLayer",
      "resourceVersion": "2.0",
      "visible": true
    }
  ],
  "name": "spr_example",
  "nineSlice": null,
  "origin": 0,
  "parent": {
    "name": "sprites",
    "path": "folders/Sprites.yy"
  },
  "preMultiplyAlpha": false,
  "resourceType": "GMSprite",
  "resourceVersion": "2.0",
  "sequence": {
    "$GMSequence": "",
    "%Name": "spr_example",
    "autoRecord": true,
    "backdropHeight": 768,
    "backdropImageOpacity": 0.5,
    "backdropImagePath": "",
    "backdropWidth": 1366,
    "backdropXOffset": 0.0,
    "backdropYOffset": 0.0,
    "events": {
      "$KeyframeStore<MessageEventKeyframe>": "",
      "Keyframes": [],
      "resourceType": "KeyframeStore<MessageEventKeyframe>",
      "resourceVersion": "2.0"
    },
    "eventStubScript": null,
    "eventToFunction": {},
    "length": 1.0,
    "lockOrigin": false,
    "moments": {
      "$KeyframeStore<MomentsEventKeyframe>": "",
      "Keyframes": [],
      "resourceType": "KeyframeStore<MomentsEventKeyframe>",
      "resourceVersion": "2.0"
    },
    "name": "spr_example",
    "playback": 1,
    "playbackSpeed": 30.0,
    "playbackSpeedType": 0,
    "resourceType": "GMSequence",
    "resourceVersion": "2.0",
    "showBackdrop": true,
    "showBackdropImage": false,
    "timeUnits": 1,
    "tracks": [
      {
        "$GMSpriteFramesTrack": "",
        "builtinName": 0,
        "events": [],
        "inheritsTrackColour": true,
        "interpolation": 1,
        "isCreationTrack": false,
        "keyframes": {
          "$KeyframeStore<SpriteFrameKeyframe>": "",
          "Keyframes": [
            {
              "$Keyframe<SpriteFrameKeyframe>": "",
              "Channels": {
                "0": {
                  "$SpriteFrameKeyframe": "",
                  "Id": {
                    "name": "uuid-here",
                    "path": "sprites/spr_example/spr_example.yy"
                  },
                  "resourceType": "SpriteFrameKeyframe",
                  "resourceVersion": "2.0"
                }
              },
              "Disabled": false,
              "id": "uuid-here",
              "IsCreationKey": false,
              "Key": 0.0,
              "Length": 1.0,
              "resourceType": "Keyframe<SpriteFrameKeyframe>",
              "resourceVersion": "2.0",
              "Stretch": false
            }
          ],
          "resourceType": "KeyframeStore<SpriteFrameKeyframe>",
          "resourceVersion": "2.0"
        },
        "modifiers": [],
        "name": "frames",
        "resourceType": "GMSpriteFramesTrack",
        "resourceVersion": "2.0",
        "spriteId": null,
        "trackColour": 0,
        "tracks": [],
        "traits": 0
      }
    ],
    "visibleRange": null,
    "volume": 1.0,
    "xorigin": 0,
    "yorigin": 0
  },
  "swatchColours": null,
  "swfPrecision": 0.5,
  "textureGroupId": {
    "name": "Default",
    "path": "texturegroups/Default"
  },
  "type": 0,
  "VTile": false,
  "width": 32
}
```

## Verification Checklist

Before committing any GameMaker resource:

1. Verify type tag is present and first field
2. Check all resourceVersion fields are "2.0"
3. Confirm preMultiplyAlpha is present for sprites
4. Validate field order matches working examples
5. Check highlightColour is single number not array
6. Verify folder path case sensitivity
7. Test that project loads in GameMaker
8. Run gamemaker-project-sync agent

## Emergency Recovery

If project won't load:

1. Check Solitary.yyp for malformed entries
2. Compare against Trinketeer.yyp structure
3. Verify all referenced files exist
4. Check for duplicate resource names
5. Validate JSON syntax in all .yy files
6. Remove problematic resources from .yyp temporarily
7. Re-add resources one by one to isolate issue