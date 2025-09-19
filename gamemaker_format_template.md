# GameMaker Studio Format Template

This document describes the correct format for GameMaker Studio project files based on the working Trinketeer project reference.

## Critical Version Requirements

### Project File (.yyp)
- Must use: `"$GMProject":"v1"`
- Resource version: `"resourceVersion":"2.0"`

### Sprite Files (.yy)
All sprite files must include these critical fields with correct values:

1. **preMultiplyAlpha field**
   - Location: After parent field, before resourceType
   - Value: `"preMultiplyAlpha":false`
   - This field is REQUIRED

2. **Sequence structure**
   ```json
   "sequence":{
     "$GMSequence":"v1",  // NOT "" - must be "v1"
     "%Name":"sprite_name",
     // ... other fields
   }
   ```

3. **Events structure**
   ```json
   "events":{
     "$KeyframeStore<MessageEventKeyframe>":"",  // NOT "$GMEventList"
     "Keyframes":[],
     "resourceType":"KeyframeStore<MessageEventKeyframe>",  // NOT "GMEventList"
     "resourceVersion":"2.0",
   }
   ```

4. **Moments structure**
   ```json
   "moments":{
     "$KeyframeStore<MomentsEventKeyframe>":"",  // NOT "$GMMomentList"
     "Keyframes":[],
     "resourceType":"KeyframeStore<MomentsEventKeyframe>",  // NOT "GMMomentList"
     "resourceVersion":"2.0",
   }
   ```

5. **Nine-slice data (if present)**
   - Must be properly formatted JSON structure or null
   - Cannot have malformed numeric values

### Tileset Files (.yy)
Tilesets require specific formatting:

1. **GMTileSet version**
   ```json
   "$GMTileSet":"v1"  // NOT "" - must be "v1"
   ```

2. **macroPageTiles structure**
   ```json
   "macroPageTiles":{
     "SerialiseHeight":0,
     "SerialiseWidth":0,
     "TileCompressedData":[],
     "TileDataFormat":1,
   }
   ```
   Note: Do NOT include `"$GMTileListData":""` or resource type/version fields in macroPageTiles

3. **Resource version**
   ```json
   "resourceVersion":"2.0"  // NOT "0.0" or "1.0"
   ```

## Common Errors and Fixes

### Error: "Record version 0 is different than that of this release: 1"
**Cause**: Tileset has wrong version in `$GMTileSet`
**Fix**: Change `"$GMTileSet":""` to `"$GMTileSet":"v1"`

### Error: Missing preMultiplyAlpha field
**Cause**: Sprite files missing required field
**Fix**: Add `"preMultiplyAlpha":false` after parent field

### Error: Unsigned 32-bit number error in nineslice
**Cause**: Malformed nineslice data structure
**Fix**: Ensure nineslice is either null or properly formatted JSON

### Error: Wrong event/moment list types
**Cause**: Using GM-prefixed types instead of KeyframeStore
**Fix**: Replace GMEventList with KeyframeStore<MessageEventKeyframe> and GMMomentList with KeyframeStore<MomentsEventKeyframe>

## Complete Sprite Template

```json
{
  "$GMSprite":"",
  "%Name":"sprite_name",
  "bboxMode":0,
  "bbox_bottom":31,
  "bbox_left":0,
  "bbox_right":31,
  "bbox_top":0,
  "collisionKind":1,
  "collisionTolerance":0,
  "DynamicTexturePage":false,
  "edgeFiltering":false,
  "For3D":false,
  "frames":[
    {"$GMSpriteFrame":"","%Name":"frame-id","name":"frame-id","resourceType":"GMSpriteFrame","resourceVersion":"2.0"}
  ],
  "gridX":0,
  "gridY":0,
  "height":32,
  "HTile":false,
  "layers":[
    {"$GMImageLayer":"","%Name":"layer-id","blendMode":0,"displayName":"default","isLocked":false,"name":"layer-id","opacity":100.0,"resourceType":"GMImageLayer","resourceVersion":"2.0","visible":true}
  ],
  "name":"sprite_name",
  "nineSlice":null,
  "origin":0,
  "originX":0,
  "originY":0,
  "parent":{
    "name":"folder_name",
    "path":"folders/Sprites/folder_name.yy"
  },
  "preMultiplyAlpha":false,
  "resourceType":"GMSprite",
  "resourceVersion":"2.0",
  "sequence":{
    "$GMSequence":"v1",
    "%Name":"sprite_name",
    "autoRecord":true,
    "backdropHeight":768,
    "backdropImageOpacity":0.5,
    "backdropImagePath":"",
    "backdropWidth":1366,
    "backdropXOffset":0.0,
    "backdropYOffset":0.0,
    "events":{
      "$KeyframeStore<MessageEventKeyframe>":"",
      "Keyframes":[],
      "resourceType":"KeyframeStore<MessageEventKeyframe>",
      "resourceVersion":"2.0"
    },
    "eventStubScript":null,
    "eventToFunction":{},
    "length":1.0,
    "lockOrigin":false,
    "moments":{
      "$KeyframeStore<MomentsEventKeyframe>":"",
      "Keyframes":[],
      "resourceType":"KeyframeStore<MomentsEventKeyframe>",
      "resourceVersion":"2.0"
    },
    "name":"sprite_name",
    "playback":1,
    "playbackSpeed":30.0,
    "playbackSpeedType":0,
    "resourceType":"GMSequence",
    "resourceVersion":"2.0",
    "showBackdrop":true,
    "showBackdropImage":false,
    "timeUnits":1,
    "tracks":[
      {"$GMSpriteFramesTrack":"","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<SpriteFrameKeyframe>":"","Keyframes":[
            {"$Keyframe<SpriteFrameKeyframe>":"","Channels":{"0":{"$SpriteFrameKeyframe":"","Id":{"name":"frame-id","path":"sprites/sprite_name/sprite_name.yy"},"resourceType":"SpriteFrameKeyframe","resourceVersion":"2.0"}},"Disabled":false,"id":"keyframe-id","IsCreationKey":false,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<SpriteFrameKeyframe>","resourceVersion":"2.0","Stretch":false}
          ],"resourceType":"KeyframeStore<SpriteFrameKeyframe>","resourceVersion":"2.0"},"modifiers":[],"name":"frames","resourceType":"GMSpriteFramesTrack","resourceVersion":"2.0","spriteId":null,"trackColour":0,"tracks":[],"traits":0}
    ],
    "visibleRange":null,
    "volume":1.0,
    "xorigin":0,
    "yorigin":0
  },
  "swatchColours":null,
  "swfPrecision":0.5,
  "textureGroupId":{
    "name":"Default",
    "path":"texturegroups/Default"
  },
  "type":0,
  "VTile":false,
  "width":32
}
```

## Complete Tileset Template

```json
{
  "$GMTileSet":"v1",
  "%Name":"tileset_name",
  "autoTileSets":[],
  "macroPageTiles":{
    "SerialiseHeight":0,
    "SerialiseWidth":0,
    "TileCompressedData":[],
    "TileDataFormat":1
  },
  "name":"tileset_name",
  "out_columns":8,
  "out_tilehborder":2,
  "out_tilevborder":2,
  "parent":{
    "name":"Tile Sets",
    "path":"folders/Tile Sets.yy"
  },
  "resourceType":"GMTileSet",
  "resourceVersion":"2.0",
  "spriteId":{
    "name":"sprite_name",
    "path":"sprites/sprite_name/sprite_name.yy"
  },
  "spriteNoExport":false,
  "textureGroupId":{
    "name":"Default",
    "path":"texturegroups/Default"
  },
  "tileAnimationFrames":[],
  "tileAnimationSpeed":15.0,
  "tileHeight":32,
  "tilehsep":0,
  "tilevsep":0,
  "tileWidth":32,
  "tilexoff":0,
  "tileyoff":0,
  "tile_count":64
}
```

## Validation Checklist

When fixing a project that won't load:

1. ✅ Check all tilesets have `"$GMTileSet":"v1"` not `""`
2. ✅ Check all sprites have `"preMultiplyAlpha":false`
3. ✅ Check all sprites have `"$GMSequence":"v1"` not `""`
4. ✅ Check events use `KeyframeStore<MessageEventKeyframe>` not `GMEventList`
5. ✅ Check moments use `KeyframeStore<MomentsEventKeyframe>` not `GMMomentList`
6. ✅ Verify all resource versions are `"2.0"`
7. ✅ Ensure nineslice data is valid JSON or null
8. ✅ Remove extra fields from macroPageTiles in tilesets

## Notes

- Field order matters in some cases - follow the templates exactly
- Always use `"resourceVersion":"2.0"` for current GameMaker versions
- The `$GM` prefixes must have the correct version string (usually "v1" or "")
- Some structures changed between GameMaker versions - always reference a working project