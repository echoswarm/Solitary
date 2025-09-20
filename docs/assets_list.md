# Solitary - Game Assets List

## Character Sprites

### spr_guard
- **Dimensions:** 16x32 pixels
- **Origin:** Middle Center
- **Frames:** 4 frames (directional)
  - Frame 1: Facing Right
  - Frame 2: Facing Up
  - Frame 3: Facing Left
  - Frame 4: Facing Down
- **Animation:** Static frames, direction-based
- **Usage:** Guard character movement and directional facing

### spr_inmate
- **Dimensions:** 16x32 pixels
- **Origin:** Middle Center
- **Frames:** 4 frames (directional)
  - Frame 1: Facing Right
  - Frame 2: Facing Up
  - Frame 3: Facing Left
  - Frame 4: Facing Down
- **Animation:** Static frames, direction-based
- **Usage:** Player character movement and directional facing

## Environment Sprites

### spr_cell_tileset
- **Dimensions:** 768x768 pixels
- **Type:** Tilemap source
- **Tile Size:** 32x32 pixels per tile
- **Grid:** 24x24 tiles
- **Associated Tileset:** ts_cell
- **Usage:** Cell room environment construction

### spr_yard_tileset
- **Dimensions:** 768x768 pixels
- **Type:** Tilemap source
- **Tile Size:** 32x32 pixels per tile
- **Grid:** 24x24 tiles
- **Associated Tileset:** ts_yard
- **Usage:** Outdoor yard environment construction

### spr_door
- **Dimensions:** 54x72 pixels
- **Origin:** Default (Top Left)
- **Frames:** 3 frames
  - Frame 1: Closed state
  - Frame 2: Opening transition
  - Frame 3: Open state
- **Animation Speed:** 1 FPS
- **Usage:** Interactive door animations between rooms

## Item Sprites

### spr_food_tray
- **Dimensions:** 96x96 pixels
- **Origin:** Default (Top Left)
- **Frames:** 2 frames
  - Frame 1: Table with food tray
  - Frame 2: Table without food tray (empty)
- **Animation:** Static, state-based
- **Usage:** Cafeteria interaction object

## UI Elements

### spr_money_icon
- **Dimensions:** 64x64 pixels
- **Origin:** Default (Top Left)
- **Frames:** 4 frames
  - Frame 1: Normal state
  - Frame 2-4: Flash animation (increasing intensity)
- **Animation Speed:** 7 FPS
- **Usage:** Currency display and transaction feedback

### spr_schedule_block
- **Dimensions:** 535x211 pixels
- **Origin:** Default (Top Left)
- **Frames:** 1 frame
- **Features:**
  - Calendar icons
  - Close button (top-right)
  - "Schedule" title text
  - Book and clock decorative icons
- **Usage:** Daily schedule UI panel

### spr_ui_bar_empty
- **Dimensions:** 97x26 pixels
- **Origin:** Default (Top Left)
- **Frames:** 1 frame
- **Usage:** Background/container for progress bars

### spr_ui_bar_fill
- **Dimensions:** 97x26 pixels
- **Origin:** Middle Left (for pixel-perfect overlay)
- **Frames:** 1 frame
- **Usage:** Fill overlay for progress bars, scales horizontally

### spr_ui_button
- **Dimensions:** 32x32 pixels
- **Origin:** Default (Top Left)
- **Frames:** 3 frames
  - Frame 1: Unselected/normal state
  - Frame 2: Selected/pressed state
  - Frame 3: Hover state
- **Animation:** State-based
- **Usage:** Interactive UI buttons

### spr_ui_panel
- **Dimensions:** 535x211 pixels
- **Origin:** Default (Top Left)
- **Frames:** 1 frame
- **Features:**
  - Empty panel background
  - Close button (top-right corner)
- **Usage:** Generic UI panel container

## Asset Organization

### Sprite Categories
1. **Characters** - Player and NPC sprites with directional frames
2. **Environment** - Tilesets and static world elements
3. **Items** - Interactive objects with state variations
4. **UI Elements** - Interface components and HUD elements

### Naming Convention
- Prefix: `spr_` for all sprites
- Category identifiers: `guard`, `inmate`, `ui_`, etc.
- Descriptive suffixes: `_tileset`, `_icon`, `_panel`, etc.

### Technical Notes
- All sprites are stored in the GameMaker project's sprites folder
- Tilesets (ts_cell, ts_yard) reference their corresponding sprite assets
- UI elements use specific origin points for proper alignment
- Character sprites use middle center origin for collision accuracy