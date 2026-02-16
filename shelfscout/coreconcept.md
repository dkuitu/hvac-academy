# ShelfScout — Game Design Document

> **Scout. Snap. Conquer.**

---

## 1. Overview

### 1.1 Elevator Pitch

ShelfScout is a location-based grocery price hunting game. Players compete weekly to find and verify the lowest prices on selected staple items in their region. The game transforms ordinary grocery shopping into a strategic, territory-based competition where players claim stores, steal crowns, and dominate leaderboards.

The goal is not just to collect price data — it is to create a competitive, map-driven experience centered around discovery, validation, and regional dominance.

### 1.2 Design Pillars

| Pillar | Description |
|---|---|
| **Territory** | Stores are visible on a live map and can be scouted or left unexplored. The map is the game board. |
| **Competition** | Lowest verified price wins the crown. Every price is a challenge to beat. |
| **Proof** | Every submission requires visual validation. No trust without evidence. |

### 1.3 Experience Goals

The game should feel:

| Instead of... | It should feel... |
|---|---|
| Passive | **Active** — players go out and hunt |
| Analytical | **Competitive** — there are winners and losers |
| Bureaucratic | **Playful** — snapping prices feels fun, not tedious |
| Random | **Strategic** — where and when you scout matters |

> **Guiding principle:** It is a game first, data network second.

### 1.4 Core Gameplay Loop

```
Open Map → Identify Opportunity → Visit Store → Capture Proof → Submit → Compete → Defend or Steal Crown → Repeat
```

Simple. Clear. Addictive.

---

## 2. Game Structure

### 2.1 Weekly Cycle

Each week follows a consistent rhythm:

| Phase | What Happens |
|---|---|
| **Reset (Monday 00:00)** | All regions reset. Stores return to unscouted. A new set of staple items is announced (e.g., Milk, Bread, Apples). |
| **Hunt (Mon–Sat)** | Players compete to find and submit the lowest verified price per item. Crowns are contested. |
| **Final Push (Saturday)** | Last chance to steal crowns. Tension peaks. |
| **Archive (Sunday)** | Winners are recorded. Crowns are locked into history. Weekly leaderboards finalize. |

> **Design rationale:** Weekly resets prevent stagnation, ensure fairness for new players, and create a recurring sense of urgency. The cadence mirrors real grocery shopping habits.

### 2.2 Daily Engagement

To keep players active between major hunts:

#### Crown Defense Alerts
- Push notifications fire when another player submits a price within a threshold of your crown (e.g., within $0.25).
- Notifications escalate in urgency: *"Your Milk crown is being challenged at FreshCo!"* → *"Crown stolen! Reclaim it?"*
- A crown under attack shows a visual "contested" state on the map (e.g., flickering icon).
- **Design rationale:** Loss aversion is one of the strongest engagement drivers. Players will return to defend what they've earned.

#### Daily Login Rewards
- **Day 1–6:** Small XP bonuses, cosmetic unlocks, or validation tokens.
- **Day 7 (full streak):** A meaningful reward — bonus badge, crown multiplier for the week, or early access to next week's item list.
- Streaks reset if a day is missed but offer a "streak shield" (one free miss per month) to reduce frustration.
- **Design rationale:** Streak systems create habit loops. The shield prevents rage-quitting from a single missed day.

#### Optional: Daily Scout Challenge
- One bonus micro-task per day (e.g., *"Scout any unscouted store"* or *"Validate 3 submissions"*).
- Rewards small XP to keep casual players progressing.

### 2.3 Seasonal Rhythm

The game operates in layered cycles:

| Cycle | Duration | Purpose |
|---|---|---|
| **Daily** | 24 hrs | Login streaks, scout challenges, crown defense |
| **Weekly** | 7 days | Core competition loop, item rotation, leaderboard reset |
| **Monthly** | ~4 weeks | Monthly champion titles, cumulative stats |
| **Seasonal** | ~3 months | Major events, themed competitions, meta-leaderboards |

**Emotional arc across the week:**
- **Monday:** Excitement at reset — fresh map, new items, open territory
- **Midweek:** Strategic positioning — scouting gaps, building lead
- **Friday/Saturday:** Pressure — last-minute crown steals, defensive plays
- **Sunday:** Pride — results locked in, history written

---

## 3. Map & Navigation

### 3.1 Map as Primary Interface

The map is the main game board. When players open the app, they see:

- Nearby grocery stores as pins
- Visual states for each store (unscouted, scouted, crowned)
- Indicators for which items have been submitted at each store
- Heat zones showing player activity density

The map drives behavior:
- Players look for **unexplored stores** (opportunity)
- Players target **regions with weak competition** (strategy)
- Players strategically choose **where and when** to hunt (tactics)

> The map should feel alive and dynamic — not a static directory.

### 3.2 Store States

Each store exists in a per-item visual state:

| State | Icon/Visual | Meaning |
|---|---|---|
| **Unscouted** | Grey pin / fog overlay | No submissions this week. Opportunity zone. |
| **Scouted** | Colored pin (item-coded) | At least one verified submission exists. |
| **Crowned** | Gold crown icon + glow | Currently holds the lowest verified price in the region. |
| **Contested** | Flickering/pulsing crown | Crown is within striking range of being stolen. |

**Visual clarity is critical.** A player should instantly understand:
- Where action is happening
- Where opportunity exists
- Where crowns are held
- Where crowns are under threat

### 3.3 Region Definition

> **Status: Under evaluation.** The region model is critical to balancing competition and must be validated through playtesting.

**Options under consideration:**

| Model | Pros | Cons |
|---|---|---|
| **City-level** | Simple, intuitive, matches real identity ("I'm #1 in Vancouver") | Huge population variance — NYC vs. a small town |
| **Postal/ZIP prefix** | Granular, data-driven, evenly distributed | Less meaningful to players ("I'm #1 in V5K") |
| **Dynamic radius** | Adapts to player density, always competitive | Complex to implement, hard to communicate |
| **Hybrid** | City for identity + sub-zones for competition | Best of both, but adds complexity |

**Recommended approach:** Start with **city-level regions** for simplicity and player identity, with the option to introduce sub-zones in dense cities as the player base grows. Players say *"I own Vancouver"* — that's powerful.

---

## 4. Core Mechanics

### 4.1 Submission Flow

```
Select Item → Choose Store → Snap Photo → Auto-Extract → Confirm → Submit → Await Validation → Leaderboard Update
```

**Step-by-step:**

1. **Select item** — Player picks from the weekly item list.
2. **Choose store** — Player taps a store on the map (or the app auto-detects via GPS).
3. **Snap photo** — Player photographs the shelf price tag.
4. **Auto-extract** — OCR extracts price, item name, and store details.
5. **Confirm** — Player verifies extracted data (quick tap, not a form).
6. **Submit** — Entry becomes provisional (visible but unverified).
7. **Validation** — Community validates via photo review.
8. **Verified** — Leaderboard updates. Crown transfers if applicable.

**Design goals:**
- Submission should take **under 30 seconds** from photo to submit.
- The flow must feel fast and rewarding — never tedious.
- Haptic feedback and animations on submission to reinforce the action.

**Edge cases:**
- **No GPS signal:** Allow manual store selection with reduced trust score.
- **Blurry photo:** Prompt for re-capture before submission.
- **Duplicate submission:** Show existing price and ask player to confirm or update.
- **Store not on map:** Allow players to suggest new stores for admin review.

### 4.2 Crown Mechanics

Each region maintains per-item crown state:

| Element | Description |
|---|---|
| **Lowest verified price** | The current winning price for each item in the region |
| **Crown holder** | The player who submitted (or last defended) the lowest price |
| **Crown history** | Full log of who held the crown and when transfers happened |

**Crown transfer rules:**
- A new submission that **beats** the current lowest price triggers a transfer.
- The previous holder receives a push notification: *"Your crown was stolen!"*
- The new holder receives a celebration animation + XP reward.
- Leaderboards update in real time.
- **Tied prices:** First submission wins. Encourages speed.

> **Design rationale:** Crown transfers should feel **dramatic and satisfying** — the core emotional payoff of the game. Think: a brief full-screen animation, sound effect, and confetti. This is the moment players remember.

### 4.3 Validation System

All submissions require community validation to prevent fraud.

**Validation flow:**

1. Submission enters a **pending** queue with the photo visible.
2. Other players review the photo and confirm or flag it.
3. **Consensus threshold:** 3 confirmations with no flags = verified. (Tunable.)
4. Flagged submissions go to a secondary review queue.
5. Verified submissions update the leaderboard.

**Validator incentives:**
- XP for each validation completed.
- "Trusted Validator" badge after consistent accurate reviews.
- Trusted validators' votes count double (reduces queue times).

**What validators check:**
- Price tag matches the claimed price
- Item matches the claimed item
- Photo appears genuine (not edited, not a screenshot)
- Store signage or context matches the claimed store

---

## 5. Progression & Identity

### 5.1 Leaderboards

Leaderboards exist at multiple levels:

| Level | Scope | Reset Cadence |
|---|---|---|
| **Regional** | Province / State / City | Weekly |
| **National** | Country-wide | Weekly + all-time |
| **Global** | Worldwide (future) | Seasonal |

**Leaderboard ranking factors:**
- Number of crowns currently held
- Total crown-hours (how long you've held crowns)
- Submission volume
- Validation accuracy

> Winning a week matters. History should be preserved and visible.

### 5.2 Player Identity & Reputation

Players build status through sustained performance:

| Activity | What it Builds |
|---|---|
| Weekly wins | Titles, crown count |
| Contribution volume | Reputation tier |
| Validation participation | Trust score |
| Special achievements | Unique badges |
| Consecutive weeks active | Streak indicators |

**Identity elements:**

- **Titles** — Earned and displayed (e.g., *"Price Hunter"*, *"Crown Collector"*, *"Regional Tyrant"*)
- **Badges** — Permanent achievements (e.g., *"First Crown"*, *"10-Week Streak"*, *"100 Validations"*)
- **Crown Count** — Lifetime crowns earned, displayed on profile
- **Regional Dominance** — Visual indicator showing which regions a player has historically dominated

> **Design goal:** Create attachment and reputation. Players should feel that their history *matters* and is visible to others.

### 5.3 Suggested Badge System

| Badge | Criteria | Rarity |
|---|---|---|
| First Scout | Submit your first price | Common |
| Crown Thief | Steal a crown from another player | Common |
| Week Champion | Hold the most crowns at end of week | Uncommon |
| Iron Streak | 4-week login streak | Uncommon |
| Trusted Eye | 50 accurate validations | Rare |
| Regional Tyrant | Win 4 consecutive weeks in a region | Epic |
| Nationally Ranked | Top 10 on national leaderboard | Legendary |

---

## 6. Events & Quests

Beyond the standard weekly hunts, events add variety and urgency.

### 6.1 Flash Hunts

- **Duration:** 24–48 hours
- **Trigger:** Announced via push notification mid-week
- **Mechanic:** A surprise bonus item appears. First player to find and verify it earns bonus rewards.
- **Purpose:** Spikes mid-week engagement, creates FOMO.

### 6.2 Regional Bounties

- **Mechanic:** Specific stores or areas are marked as "bounty zones" — higher XP/rewards for scouting there.
- **Purpose:** Drives coverage to under-scouted areas. Balances data across the map.

### 6.3 Global Events

- **Mechanic:** All regions compete toward a shared goal (e.g., *"Collectively scout 10,000 stores this week"*).
- **Reward:** Exclusive cosmetics, titles, or global leaderboard placement.
- **Purpose:** Community cohesion, shared identity.

### 6.4 High-Difficulty Targets

- **Mechanic:** Rare or niche items with higher reward multipliers (e.g., *"Find the cheapest organic free-range eggs"*).
- **Purpose:** Rewards dedicated players, adds depth.

> All events should be **time-limited and clearly framed** — urgency drives engagement.

---

## 7. New Player Experience

> *Suggested section — not in original concept.*

### 7.1 Onboarding Flow

New players need to understand the loop within their first session:

1. **Welcome screen** — Brief animated intro: *"Every grocery store is a battlefield. Prices are the weapons. You are the scout."*
2. **Guided first hunt** — Tutorial walks the player through: select item → snap price → submit. Uses a nearby real store.
3. **First crown** — If possible, place the player in a low-competition zone so their first submission has a chance of earning a crown immediately. **Early wins create retention.**
4. **Map reveal** — Show the full regional map with unscouted stores. The sheer number of grey pins should create a sense of opportunity.
5. **First validation** — Ask the player to validate one other submission to teach the mechanic.

### 7.2 Early Game Hooks

| Timing | Hook |
|---|---|
| First 5 minutes | Guided tutorial with guaranteed reward |
| First day | "Scout 3 stores" quest with badge |
| First week | Weekly recap showing their impact |
| First month | Monthly rank + encouragement to beat it next month |

> **Design rationale:** The first session must answer: *"What do I do?"* and *"Why should I come back?"* within 3 minutes.

---

## 8. Monetization

> *Suggested section — not in original concept. The game needs a sustainable model that doesn't compromise competitive integrity.*

### 8.1 Recommended Model: Free-to-Play with Cosmetic Monetization

| Revenue Stream | Description | Integrity Risk |
|---|---|---|
| **Cosmetic map pins** | Custom pin styles for stores you've scouted | None |
| **Profile themes** | Visual customization for player profiles | None |
| **Crown skins** | Cosmetic variants for held crowns (fire crown, ice crown, etc.) | None |
| **Streak shields** | Purchasable insurance against losing a login streak | Low |
| **Early item reveal** | See next week's items 24 hours early (premium subscription) | Low — information only, no gameplay advantage in scouting |

### 8.2 What to Avoid

- **Pay-to-win mechanics** — Never sell crown advantages, validation bypasses, or leaderboard boosts. Competitive integrity is the foundation of the game.
- **Aggressive ads** — If ads are used, never interrupt the submission flow. Reward-based video ads (watch to earn XP) are acceptable.
- **Paywalled regions** — All regions and items must be accessible to free players.

> **Guiding principle:** If a paying player and a free player both find the same price, they should have exactly the same competitive outcome.

---

## 9. Anti-Abuse & Trust

### 9.1 Design Principles

The game must assume:
- Some users will attempt false submissions.
- Competitive systems invite edge cases and manipulation.
- Safeguards must exist, but remain **invisible and frictionless** for honest players.
- Fairness must feel **natural, not restrictive**.

### 9.2 Suggested Safeguards

| Threat | Mitigation |
|---|---|
| Fake/edited photos | EXIF metadata validation, photo freshness checks, AI-assisted tamper detection |
| Price fabrication | Cross-reference with historical data and other submissions at the same store |
| Location spoofing | GPS validation + require photo metadata to match claimed store location |
| Validation collusion | Randomize which submissions are shown to which validators, flag suspicious patterns |
| Bot accounts | Rate limiting, CAPTCHA on account creation, device fingerprinting |

### 9.3 Trust Score

Each player maintains an invisible trust score:

- Starts at a neutral baseline.
- Increases with accurate submissions and validations.
- Decreases with flagged or rejected submissions.
- High trust = faster validation, lower scrutiny.
- Low trust = submissions require more validators, possible soft-ban from crowns.

> Players should never see their exact trust score — only the benefits of being trustworthy (faster processing, Trusted Validator badge).

---

## 10. Visual & UX Direction

### 10.1 Style Guide

| Attribute | Direction |
|---|---|
| **Tone** | Clean but energetic |
| **Personality** | Bold but not childish |
| **Competitive feel** | Fierce but not aggressive |
| **Layout** | Map-centric, state-driven |
| **Color language** | Grey (unscouted) → Brand color (scouted) → Gold (crowned) → Red pulse (contested) |
| **Typography** | Strong, legible, slightly condensed — works on map overlays |
| **Animations** | Snappy micro-animations on submit, crown transfer, validation. Never slow or floaty. |

### 10.2 Reference Tone

The experience should feel closer to a **location-based mobile game** (think Pokemon GO's map energy) than a budgeting app. Players should *want* to open the map and scan for opportunity.

---

## 11. Long-Term Expansion

Potential future layers (in rough priority order):

| Feature | Phase | Complexity |
|---|---|---|
| Additional item categories | Phase 2 | Low |
| Regional sub-zones | Phase 2 | Medium |
| Team-based play (crews/guilds) | Phase 3 | Medium |
| Regional tournaments | Phase 3 | Medium |
| Cooperative global goals | Phase 3 | Medium |
| Data insights dashboard | Phase 4 | High |
| Retailer partnerships | Phase 4 | High |
| API for price data consumers | Phase 5 | High |

> **Golden rule:** Expansion should never overwhelm the core loop. The core loop remains: **Scout. Snap. Conquer.**

---

## 12. The Mentality of ShelfScout

ShelfScout is about:

- **Exploration** — There's always another store to scout.
- **Competition** — There's always a crown to steal.
- **Proof** — Nothing counts without evidence.
- **Regional pride** — Your city, your turf, your legacy.
- **Tactical movement** — Where you go and when you go matters.

It turns price awareness into a social, strategic game.

> *It should feel like a weekly treasure hunt hiding in plain sight — inside every grocery store.*
