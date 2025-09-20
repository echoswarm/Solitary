# TILEMAP DRAWING GUIDE
## Prison Level Design Instructions
## Room: rm_prison_main (3840x2160 pixels / 120x68 tiles)

---

## QUICK REFERENCE
- **Tile Size**: 32x32 pixels
- **Room Size**: 3840x2160 (120x68 tiles)
- **Viewport**: 1280x720 (40x22.5 tiles visible)
- **Grid**: Always snap to 32x32 grid

---

## LAYER STRUCTURE (Bottom to Top)

### 1. Background Layer (VISUAL)
**Purpose**: Sky/distant background (if visible through windows)

### 2. Tiles_Background (MAIN FLOOR LAYER)
**Tileset**: ts_cell for interior, ts_yard for exterior
**Z-Depth**: Deepest tiles

**WHAT TO DRAW**:
- All floor tiles (concrete, dirt, grass)
- Base walls (not the bars)
- Foundation elements

### 3. Collision_Layer (INVISIBLE)
**Tileset**: ts_cell (use solid red tile)
**IMPORTANT**: Set layer to invisible after drawing

**PAINT COLLISION ON**:
- All walls (entire wall thickness)
- Cell fixtures (toilet, bed, sink)
- Counters and tables
- Cell bars locations
- Room boundaries
- Fence perimeters

### 4. Tiles_Foreground (OVERLAY ELEMENTS)
**Tileset**: ts_cell
**Z-Depth**: Above player

**WHAT TO DRAW**:
- Cell bars (vertical and horizontal)
- Window bars
- Overhead pipes
- Wall tops that should overlap player

### 5. Instances_Main (OBJECTS)
**Already Contains**: System controllers at y=0

**ADD HERE**:
- obj_door instances
- obj_food_station instances
- Interactive objects

### 6. Instances_Top (CHARACTERS)
**ADD HERE**:
- obj_inmate (player start position)
- obj_guard instances

---

## DETAILED AREA LAYOUTS

### CELL BLOCK A (Top-Left)
**Location**: 0,0 to 960,640 (30x20 tiles)
**Layout**:
```
+------------------+
| C1 | C2 | C3 | C4|  Each cell: 192x192 (6x6 tiles)
+----+----+----+----+
| C5 | C6 | C7 | C8|  Corridor: 2 tiles wide
+------------------+
```

**Each Cell Contains**:
- Floor: Gray concrete tiles
- Walls: Dark gray wall tiles
- Fixtures (place in each cell):
  - Toilet: Top-left corner (1x1 tile)
  - Bed: Against right wall (2x1 tiles)
  - Sink: Near toilet (1x1 tile)
- Cell Bars: On Tiles_Foreground layer
- Door Gap: Leave 2-tile opening for obj_door

### MAIN CORRIDOR
**Location**: 960,0 to 1280,1080 (10x34 tiles wide)
**Features**:
- Different floor pattern (worn concrete)
- 3 tiles wide minimum
- Connect all areas
- Add wear marks and stains for atmosphere

### CAFETERIA
**Location**: 1280,320 to 1920,960 (20x20 tiles)
**Layout**:
```
Kitchen Counter (back wall)
[========================]

Tables (4x2 each):
[Table] [Table] [Table]
[Table] [Table] [Table]
```

**Tiles**:
- Floor: Light gray cafeteria tiles
- Counter: Kitchen counter tiles along back
- Tables: Use table tiles (leave walkways)

### RECREATION ROOM
**Location**: 1280,960 to 1920,1440 (20x15 tiles)
**Features**:
- Open floor space
- TV area (corner)
- Seating tiles
- Book shelf tiles against wall

### YARD AREA (Exterior)
**Location**: 1920,0 to 3840,1440 (60x45 tiles)
**Tileset**: Switch to ts_yard

**Zones**:
1. **Exercise Area** (1920,0 to 2560,640)
   - Concrete ground with painted lines
   - Weight bench tiles
   - Pull-up bar tiles

2. **Basketball Court** (2560,0 to 3200,640)
   - Court floor tiles
   - Hoop tiles at each end
   - Court lines (use line tiles)

3. **Open Yard** (1920,640 to 3840,1440)
   - Grass and dirt tiles (vary for realism)
   - Walking path tiles
   - Bench tiles scattered
   - Picnic table tiles

**Perimeter**:
- Chain-link fence tiles (entire perimeter)
- Guard tower tiles (corners)
- Razor wire tiles (top of fence)

### SOLITARY CELLS (Bottom Area)
**Location**: 320,1440 to 960,1920 (20x15 tiles)
**Features**:
- Smaller cells (4x4 tiles each)
- Heavier door sprites
- Darker floor tiles
- Minimal fixtures (just toilet and bed)

### GUARD STATION
**Location**: 960,1440 to 1280,1920 (10x15 tiles)
**Features**:
- Desk tiles
- Monitor/computer tiles
- Filing cabinet tiles
- Window overlooking cells

---

## OBJECT PLACEMENT COORDINATES

### REQUIRED OBJECTS

**Cell Doors** (obj_door):
- Cell 1: (192, 320)
- Cell 2: (384, 320)
- Cell 3: (576, 320)
- Cell 4: (768, 320)
- Cell 5: (192, 512)
- Cell 6: (384, 512)
- Cell 7: (576, 512)
- Cell 8: (768, 512)

**Area Doors**:
- Cafeteria Entry: (1280, 640)
- Yard Entry: (1920, 720)
- Solitary Entry: (640, 1440)

**Interactive Objects**:
- Food Station: (1600, 400) in cafeteria
- Commissary: (1120, 800)
- Phone: (1120, 320)

**Guard Patrols** (obj_guard):
- Corridor Guard: (1120, 540)
- Yard Guard: (2400, 720)
- Cafeteria Guard: (1600, 640)

**Player Start** (obj_inmate):
- In Cell 1: (96, 160)

---

## VISUAL DESIGN GUIDELINES

### Creating Atmosphere
1. **Floor Variation**:
   - Use 3-4 different floor tile variants
   - Add cracks and stains randomly
   - Darker tiles in corners
   - Worn paths in high-traffic areas

2. **Wall Details**:
   - Vary wall tiles slightly
   - Add graffiti tiles sparingly
   - Peeling paint tiles near bottom
   - Water damage tiles near sinks

3. **Lighting Hints** (visual only):
   - Brighter tiles under "windows"
   - Darker tiles in cell corners
   - Medium brightness in corridors

### Tile Variety Tips
- Never use the same tile more than 3 times in a row
- Rotate similar tiles for variety
- Mix clean and dirty tile variants
- Use transition tiles between areas

---

## COLLISION TESTING CHECKLIST

After drawing, test these areas:

### Movement Tests
- [ ] Player cannot walk through walls
- [ ] Player cannot walk through cell bars
- [ ] Player cannot walk through closed doors
- [ ] Player cannot walk through furniture
- [ ] Player cannot leave room boundaries

### Area Access Tests
- [ ] Can enter/exit cells when doors open
- [ ] Can navigate all corridors
- [ ] Can access cafeteria
- [ ] Can reach yard when allowed
- [ ] Cannot bypass security areas

### Object Interaction Tests
- [ ] Can reach food station
- [ ] Can reach all interactive objects
- [ ] Guards have clear patrol paths
- [ ] No objects blocking essential paths

---

## COMMON MISTAKES TO AVOID

1. **DON'T** forget to make Collision_Layer invisible
2. **DON'T** place bars on the wrong layer
3. **DON'T** forget door gaps in cell bars
4. **DON'T** make corridors too narrow (<2 tiles)
5. **DON'T** forget collision on decorative objects
6. **DON'T** leave gaps in perimeter walls
7. **DON'T** mix interior/exterior tiles incorrectly

---

## LAYER DEPTH REFERENCE
```
BACK                          FRONT
Background → Tiles_Background → Collision (invisible) →
Instances_Main → Tiles_Foreground → Instances_Top
```

---

## FINAL STEPS

1. **Save Frequently**: After completing each area
2. **Test Navigation**: Walk through with player object
3. **Check Layers**: Verify correct tile placement
4. **Hide Collision**: Set Collision_Layer invisible
5. **Place Objects**: Add all required objects
6. **Final Test**: Complete walkthrough test

---

## TROUBLESHOOTING

**Problem**: Player walks through walls
**Solution**: Check Collision_Layer has tiles at wall locations

**Problem**: Can't see cell bars
**Solution**: Move bars to Tiles_Foreground layer

**Problem**: Door doesn't align with opening
**Solution**: Ensure 2-tile gap in bars matches door width

**Problem**: Camera doesn't follow player
**Solution**: Verify obj_camera_controller is in room

---

## QUICK START SEQUENCE

1. Open rm_prison_main in Room Editor
2. Select Tiles_Background layer
3. Choose ts_cell tileset
4. Start with Cell Block A
5. Draw floors first, then walls
6. Switch to Collision_Layer
7. Paint red tiles on all solid areas
8. Hide Collision_Layer
9. Switch to Tiles_Foreground
10. Add bars and overlays
11. Place objects on Instance layers
12. Test and refine

**Remember**: The room is large! Use the Room Editor's zoom and pan features to navigate efficiently.