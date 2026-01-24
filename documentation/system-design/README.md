# Recipe Manager - System Overview

## What is Recipe Manager?

A web application for managing personal recipes, planning weekly meals, and generating shopping lists.

## Core Features

1. **My Recipes** - Create, edit, and organize personal recipes
2. **Browse Library** - Discover and save recipes from public library
3. **Meal Planner** - Plan weekly meals with drag-drop interface
4. **Shopping List** - Auto-generated list from meal plan

## Tech Stack

### Frontend
- **Framework**: React 18 with Vite
- **Styling**: Tailwind CSS
- **Animations**: Framer Motion
- **Icons**: Lucide React
- **Routing**: React Router DOM

### Backend
- **Framework**: FastAPI (Python)
- **Database**: PostgreSQL
- **ORM**: SQLAlchemy 2.0
- **Auth**: JWT tokens (access + refresh)
- **Email**: SMTP for verification

### Infrastructure
- **Frontend Hosting**: Vercel/Netlify
- **Backend Hosting**: Railway
- **Database**: Railway PostgreSQL

## Key Documentation

| Document | Description |
|----------|-------------|
| [architecture.md](./architecture.md) | Technical architecture and data flow |
| [features.md](./features.md) | Complete feature list with status |
| [roadmap.md](./roadmap.md) | Development roadmap and priorities |

## Quick Start

### Frontend
```bash
cd frontend
npm install
npm run dev
```

### Backend
```bash
cd backend
pip install -r requirements.txt
uvicorn app.main:app --reload
```

## Project Structure

```
Foood/
├── frontend/                 # React application
│   ├── src/
│   │   ├── components/       # Reusable components
│   │   ├── pages/            # Route pages
│   │   ├── App.jsx           # Main router
│   │   └── RecipeManager.jsx # Main app component
│   └── package.json
│
├── backend/                  # FastAPI application
│   ├── app/
│   │   ├── api/routes/       # API endpoints
│   │   ├── models/           # SQLAlchemy models
│   │   ├── schemas/          # Pydantic schemas
│   │   ├── crud/             # Database operations
│   │   └── core/             # Security, config
│   ├── migrations/           # SQL migrations
│   └── scripts/              # Seeding scripts
│
└── documentation/            # Project documentation
    ├── explore-tab/          # Browse feature docs
    ├── image-fix/            # Image issues docs
    └── system-design/        # Architecture docs
```

## Environment Variables

### Frontend (.env)
```
VITE_API_BASE_URL=http://127.0.0.1:8000
VITE_APP_URL=http://localhost:5173
```

### Backend (.env)
```
DATABASE_URL=postgresql://user:pass@host:port/db
JWT_SECRET=your-secret-key
SMTP_HOST=smtp.example.com
SMTP_USER=user@example.com
SMTP_PASSWORD=password
```

## Database Schema Overview

```
users
  ├── recipes (user-created)
  ├── user_saved_recipes (library saves)
  ├── tags (user's tags)
  ├── meal_plan_entries
  └── shopping_lists

recipes
  ├── recipe_ingredients
  ├── recipe_tags
  └── user_saved_recipes (who saved it)
```

## API Overview

| Base Path | Description |
|-----------|-------------|
| `/auth` | Authentication (login, signup, verify) |
| `/recipes` | User's personal recipes |
| `/library` | Public recipe library |
| `/meal-plan` | Weekly meal planning |
| `/shopping-lists` | Shopping list management |
| `/tags` | User's recipe tags |
| `/ingredients` | Ingredient management |

## Contributing

1. Check [roadmap.md](./roadmap.md) for current priorities
2. Pick a task from "TODO" section
3. Create feature branch
4. Submit PR with description
