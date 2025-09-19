# Solitary - Visual Assets Documentation

## Overview
This document lists all visual assets created for the Solitary prison micro-sim project.
All sprites are currently placeholder graphics that should be replaced with final art.

## Sprites

### Characters
| Name | Dimensions | Purpose | Status |
|------|------------|---------|---------|
| spr_inmate | 32x32 | Main prisoner character sprite | Placeholder (orange square) |
| spr_guard | 32x32 | Guard character sprite (future use) | Placeholder (blue square) |

### Environment
| Name | Dimensions | Purpose | Status |
|------|------------|---------|---------|
| spr_cell_tileset | 256x256 | Prison cell environment tileset | Placeholder (gray with grid) |
| spr_yard_tileset | 256x256 | Outdoor yard environment tileset | Placeholder (brown with grid) |
| spr_door | 32x64 | Cell door sprite | Placeholder (dark gray rectangle) |

### UI Elements
| Name | Dimensions | Purpose | Status |
|------|------------|---------|---------|
| spr_ui_bar_empty | 100x20 | Empty status bar background | Placeholder (dark gray) |
| spr_ui_bar_fill | 100x20 | Status bar fill overlay | Placeholder (green) |
| spr_ui_panel | 128x128 | UI panel background (9-slice) | Placeholder (very dark gray) |
| spr_ui_button | 64x32 | Button sprite | Placeholder (medium gray) |
| spr_schedule_block | 32x32 | Schedule grid cell | Placeholder (light gray) |

### Items
| Name | Dimensions | Purpose | Status |
|------|------------|---------|---------|
| spr_food_tray | 16x16 | Meal/food icon | Placeholder (tan) |
| spr_money_icon | 16x16 | Currency icon | Placeholder (gold) |

## Tilesets

| Name | Based On | Tile Size | Purpose |
|------|----------|-----------|---------|
| ts_cell | spr_cell_tileset | 32x32 | Cell environment tiles |
| ts_yard | spr_yard_tileset | 32x32 | Yard environment tiles |

## Color Scheme (Placeholders)

- **Inmate**: Orange (#FF8C00) - Classic prison jumpsuit color
- **Guard**: Blue (#464696) - Authority figure color
- **Environment**: Gray (#646464) - Institutional/prison aesthetic
- **Yard**: Brown (#8B4513) - Outdoor/dirt aesthetic
- **UI Background**: Dark Gray (#282828) - Non-intrusive UI
- **UI Active**: Green (#00C800) - Positive/active status
- **Items**: Tan/Gold - Distinguishable from environment

## Next Steps

1. **Replace Placeholder Graphics**: All current sprites are simple colored rectangles and need to be replaced with proper pixel art
2. **Add Animations**: Character sprites will need walking animations (4 directions)
3. **Enhance Tilesets**: Add variety to tileset sprites for more interesting environments
4. **Create Additional UI Elements**: May need icons for different activities, status effects, etc.
5. **Add Visual Effects**: Consider particle effects for certain actions

## File Structure

All sprites are located in:
- `C:/Users/quinn/GameMakerProjects/Solitary/sprites/[sprite_name]/`

Each sprite folder contains:
- `[sprite_name].yy` - GameMaker resource file
- `layers/[guid]/[guid].png` - Actual image file
- `frames/[guid]/` - Frame data

Tilesets are located in:
- `C:/Users/quinn/GameMakerProjects/Solitary/tilesets/[tileset_name]/`

## Notes

- All sprites use power-of-2 dimensions where possible for optimization
- Origins are set appropriately (center for characters, top-left for UI)
- Nine-slice is enabled for spr_ui_panel for flexible sizing
- Tilesets use 32x32 tile size for easy room design
- All assets are registered in Solitary.yyp and resource_order files