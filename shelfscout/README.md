# ShelfScout

> Scout. Snap. Conquer.

A location-based competitive grocery price-hunting game.

## Tech Stack

- **Mobile:** Flutter (Dart) with Provider
- **Backend:** Node.js + Express + TypeScript
- **Database:** PostgreSQL 16 + PostGIS 3.4
- **Migrations:** Knex
- **Cache / Realtime:** Redis

## Prerequisites

- Node.js >= 18
- Flutter SDK >= 3.x
- Docker & Docker Compose
- (Optional) Android Studio / Xcode for device emulators

## Getting Started

### 1. Start infrastructure

```bash
docker compose up -d
```

This starts PostgreSQL (with PostGIS) on port 5432 and Redis on port 6379.

### 2. Run the server

```bash
cd server
cp .env.example .env
npm install
npm run dev
```

The API will be available at `http://localhost:3000`.

### 3. Run the client

```bash
cd client
flutter pub get
flutter run
```

## Project Structure

```
shelfscout/
  coreconcept.md        # Game Design Document
  docker-compose.yml    # PostGIS + Redis
  server/               # Node.js + Express + TypeScript API
    src/
      config/
      middleware/
      routes/
      controllers/
      services/
      models/
      utils/
      types/
    migrations/
    seeds/
  client/               # Flutter mobile app
    lib/
      config/
      models/
      services/
      providers/
      screens/
      widgets/
      utils/
```

## Development

- **Server hot-reload:** `npm run dev` (nodemon + ts-node)
- **Run migrations:** `npx knex migrate:latest`
- **Lint server:** `npm run lint`
- **Flutter hot-reload:** `flutter run` (press `r` in terminal)
