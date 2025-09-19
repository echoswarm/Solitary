# Solitary — Vertical Slice Scope & Checklist (GMS2)

> **Pitch:** A cozy‑bleak, clock‑driven prison micro‑sim. In the slice you supervise **one inmate** and **one guard**. You run on a weekly budget, schedule meals/showers/yard, buy food, and simply keep the days turning until the sentence expires. The slice is a polished nucleus that later scales to a full idle/sim.

---

## Design Pillars
- **Always‑on world:** Time advances whether the app is open; reopening feels like peeking back into a living sim.
- **Simple loop, deep systems:** One inmate, one guard—but real scheduling, economy, traits, and incidents.
- **Readable at a glance:** Large clock, clear schedule blocks, explicit needs bars, hover tooltips.
- **Friction becomes mastery:** Early micro‑purchases (meals per day) → later QoL (bulk food, auto‑restock).

## Core Loop (Vertical Slice)
1) **Time ticks** (1 real min = 1 in‑game hour). 2) **Daily schedule** triggers activities (feed, clean, yard). 3) **Needs** (Hunger, Cleanliness, etc.) move toward/away from thresholds. 4) **Guard** executes tasks; you pay wages weekly. 5) **You manage** purchases (food), keep the schedule valid, and ride out the sentence. 6) **Release** when the clock reaches sentence end.

### Time & Scaling
- Sim minute: **1 real minute = 1 sim hour** (24 sim hrs/day).  
- Assume **30‑day months** for the slice (configurable). 5 months = 150 days = **3,600 sim hours = 3,600 real minutes = 60 real hours**.

## Slice Feature Set (MoSCoW)
**Must‑Have**
- M1. **Time System** with pause/resume & speed 1× (dev hotkeys for 8× for QA only).
- M2. **Daily Schedule** (per‑hour blocks; feed, clean/shower, yard, sleep).
- M3. **Needs Model** (Hunger, Cleanliness; tunable decay & fulfillment curves).
- M4. **Single Inmate** with **trait set** (e.g., *Bookworm*) affecting rates/tooltips.
- M5. **One Guard** job queue/pathing lite (teleport/slide acceptable for slice).
- M6. **Economy**: weekly wages, daily food cost; **budget UI**.
- M7. **Food Inventory**: buy per‑meal; **bulk purchase** toggle appears after day 3.
- M8. **UI/UX**: clock, schedule panel, needs bars, tooltips, buttons (Feed, Clean), money, days remaining.
- M9. **Save/Load + Offline Catch‑up** (compute elapsed real time, fast‑forward sim deterministically).
- M10. **End‑of‑Sentence Release** flow → simple win screen + summary.

**Should‑Have**
- S1. **Random Events** (low frequency, time‑gated; e.g., “late delivery” → skip a meal unless stock).
- S2. **Trait Generator** with 5–8 traits and a rarity weight.
- S3. **Basic Audio** cues (meal served, shower start, yard whistle, payday).

**Could‑Have**
- C1. **Auto‑restock threshold** toggle when funds allow.
- C2. **Guard Overtime** option (temporary wage bump → more tasks covered at night).
- C3. **Simple Reputation** score (quiet week +1; missed meal −1) for future hooks.

**Won’t (in slice)**
- W1. Multiple inmates/rooms.  
- W2. Complex pathfinding/combat.  
- W3. Construction/expansion systems.

---

## System Specs

### A. Time & Schedule
- **Clock:** 24h digital; day counter; sentence days remaining.
- **Scheduler:** Array of 24 slots with activity enums `{Sleep, Eat, Clean, Yard, Free}`.
- **Tick:** 1 min real → advance hour; on hour‑change, **post activity events** into task queue.

### B. Needs & Activities
- **Stats:** Hunger [0..100], Cleanliness [0..100]. 0 is bad.
- **Decay:** Per‑hour linear (trait‑modified).  
- **Fulfillment:** Actions set deltas over an activity duration (e.g., Eat +60 over 1h).
- **Thresholds:** <20 warns; <5 triggers soft incident (mood debuff / budget penalty).

### C. Characters
- **Inmate:** id, name, sentence_end_ts, traits[], needs, mood, activity_state.
- **Guard:** wage/week, availability blocks, task_queue; executes when activity fires.

### D. Economy & Inventory
- **Budget:** `$` integer; **weekly payroll** (auto‑deduct on Monday 08:00).  
- **Food Units:** inventory_count; **cost/unit**; bulk pack (e.g., 14 meals at discount).  
- **Purchases:** simple shop modal; disabled if insufficient funds.

### E. Events & Incidents
- **Deterministic RNG** seeded at new game, advanced only on event roll.  
- **Event table:** `{time_window, chance, effect}`; e.g., *Late Delivery* (12:00–14:00, 3%) → `skip one Eat` unless `inventory_count>0`.

### F. Save/Load & Offline Simulation
- **State Snapshot** (JSON): clock timestamp, RNG seed/step, schedule, needs, inventory, budget, entities, pending tasks.  
- **Offline Catch‑up:** on load, compute real‑time delta; fast‑simulate hour‑by‑hour applying schedule and events (cap at 7 days per load for perf).

### G. UI/UX
- **Panels:** Clock/Date, Money, Inmate Card (name/traits), Needs Bars, Schedule grid, Buttons (Feed/Clean shortcuts), Tooltips on hover.
- **Toasts:** Payday, Meal Served, Inventory Low, Sentence End.
- **Accessibility:** Large fonts, color‑agnostic bars w/ icons, pause.

### H. Art/Audio (Slice)
- Use existing mock style; reuse Kenney packs where possible.
- Static cell + yard background, 2–3 simple animations (guard handoff, tray place, shower spray).
- Minimal SFX set.

---

## Data Model (GMS2‑friendly)
- `global.game`: `{ seed, epoch_start, real_to_sim_ratio, day_len_hours=24, month_len_days=30 }`
- `SaveState`: `{ ts_real_last, ts_sim, day, rng_step, budget, food, inmate, guard, schedule[24], events_state }`
- `Inmate`: `{ id, name, traits[], needs:{hunger,clean}, mood, sentence_end_sim_ts }`
- `Guard`: `{ wage_week, on_duty_hours[24], task_queue[] }`
- `Event`: `{ id, window:{start,end}, chance, effect_id }`

---

## Acceptance Criteria (Definition of Done)
**Time & Schedule**
- [ ] Clock advances 1 sim hour per real minute; persists across saves.  
- [ ] Changing hour posts correct activity to the guard’s queue.

**Needs**
- [ ] Hunger and Cleanliness decay at configured rates; tooltips show exact rates and modifiers.  
- [ ] Activities raise needs over their duration; bars animate smoothly.

**Economy & Inventory**
- [ ] Budget UI updates on purchases and weekly payroll.  
- [ ] Buying food adjusts inventory; meal fails if no stock (and event fires).

**Guard Execution**
- [ ] Guard picks up tasks, teleports/lerps to stations, and resolves actions within the hour block.  
- [ ] Visuals: tray placed, shower particles, yard gate toggle.

**Traits**
- [ ] New game rolls 1–2 traits that visibly affect rates (e.g., *Bookworm*: slower yard decay, faster boredom when no yard).

**Save/Load + Offline**
- [ ] Quit/reopen after N hours fast‑simulates missed hours deterministically and updates all systems.

**Release**
- [ ] On sentence end, guard escorts to gate; summary modal shows days served, spend, incidents, and outcome.

---

## Risks & Mitigations
- **Offline catch‑up complexity:** Keep hour‑step deterministic; cap step count; test with property‑based cases.  
- **RNG drift:** Store seed + step; never call RNG in rendering.  
- **Scope creep:** One inmate, one guard; no construction; no pathfinding beyond lerp.

---

## Milestones & Checklists (with IDs)

### M0 — Project Bootstrap
- [ ] **SOL‑001** Create GMS2 project, rooms (`rm_cell`, `rm_yard`), global constants.
- [ ] **SOL‑002** Debug console overlay + FPS/tick readout.
- [ ] **SOL‑003** Input: pause/unpause; dev fast‑forward (hidden).

### M1 — Time & Schedule Backbone
- [ ] **SOL‑010** Clock/Calendar model; 30‑day month setting.
- [ ] **SOL‑011** Scheduler data (24‑slot enum array).
- [ ] **SOL‑012** Hour‑change dispatcher → activity events.
- [ ] **SOL‑013** UI: digital clock + day counter; sentence countdown.

### M2 — Needs & Activities
- [ ] **SOL‑020** Needs component + decay/fulfill math.
- [ ] **SOL‑021** Activities: Eat, Clean/Shower, Yard, Sleep, Free.
- [ ] **SOL‑022** Visual feedback on start/finish; tooltips with rates/traits.

### M3 — Characters
- [ ] **SOL‑030** Inmate entity; trait generator (table + weights).
- [ ] **SOL‑031** Guard entity; wage config; on‑duty hours.
- [ ] **SOL‑032** Simple task executor (teleport/lerp).

### M4 — Economy & Inventory
- [ ] **SOL‑040** Budget ledger; weekly payroll timer.
- [ ] **SOL‑041** Food inventory + purchase modal.
- [ ] **SOL‑042** Bulk pack unlock after Day 3.

### M5 — UI/UX
- [ ] **SOL‑050** HUD: money, inmate card, needs bars, schedule grid.
- [ ] **SOL‑051** Buttons: Feed/Clean shortcuts (trigger immediate next hour task).
- [ ] **SOL‑052** Toasts: Payday, Low Food, Sentence End.
- [ ] **SOL‑053** Tooltip system (hover reveals exact math + trait icons).

### M6 — Save/Load & Offline
- [ ] **SOL‑060** JSON save snapshot; manual Save/Load for QA.
- [ ] **SOL‑061** On load, compute real‑time delta and fast‑simulate hours.
- [ ] **SOL‑062** Deterministic RNG (seed + step).

### M7 — Events & Polish
- [ ] **SOL‑070** Random Event table (2–3 soft events).
- [ ] **SOL‑071** Minimal SFX set; volume slider.
- [ ] **SOL‑072** Release flow + summary modal.
- [ ] **SOL‑073** QA pass: 5‑day burn; offline reopen tests; edge cases (0 food, 0 budget, payroll day on load).

---

## Balancing & Defaults (Tunable)
- Hunger decay: −6/hr awake; −3/hr asleep. Eat +60 over 1h.  
- Cleanliness decay: −4/hr; Shower +70 over 1h.  
- Weekly wage: $100; Food/unit: $5; Bulk(14): $60.  
- Event chances: 1–3% in defined windows.  
- Traits (examples): *Bookworm* (yard need decays slower), *Light Sleeper* (sleep restores less), *Picky Eater* (Eat +50 not +60), *Neat Freak* (cleanliness decay −1/hr).

---

## Test Scenarios (QA)
- **TS‑01:** Leave app closed 3 real hours → expect 3 sim days; budget/payday processed; needs/effects accurate.
- **TS‑02:** Hit 0 food before lunch → missed meal incident; toast; mood penalty.
- **TS‑03:** Bulk purchase at Day 4 → inventory increases; discount applied.
- **TS‑04:** Sentence ends during offline period → on reopen, instant release summary.

---

## Nice‑To‑Add After Slice
- Weather affecting yard, visitor day event, contraband checks, multiple inmates/blocks, construction, reports/graphs, mod hooks.

---

### Notes for Implementation Agents
- Keep **logic deterministic** and **side‑effect free** per tick; rendering separate.  
- Centralize **rate math** for tooltips = truth source.  
- Store **RNG step** with saves; no RNG in draw events.

