# Recipe Manager

A web-based application for meal planning, recipe management, and automated shopping list generation.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Network Hosting for Demo](#network-hosting-for-demo)
- [API Documentation](#api-documentation)
- [Project Structure](#project-structure)
- [Team](#team)
- [License](#license)

---

## Overview

Recipe Manager is a web-based application designed to be the one-stop location for meal planning and cooking organization. It helps users store custom recipes in an organized digital format, plan meals on a weekly schedule, and automatically generate shopping lists based on selected meals.

By integrating recipe storage, meal planning, and ingredient aggregation into a single platform, the system minimizes food waste and streamlines grocery shopping for home cooks and families.

---

## Features

| Feature | Description |
|---------|-------------|
| **User Authentication** | Secure JWT-based registration and login with persistent sessions across page refreshes |
| **Recipe Management** | Create, view, edit, and delete recipes with ingredients, instructions, images (with upload support), and custom tags |
| **Search and Filter** | Find recipes by name or filter by tags (Breakfast, Lunch, Dinner, etc.) with alphabetical sorting |
| **Recipe Sorting** | Sort recipes by date added (newest/oldest) or alphabetically by name |
| **Weekly Meal Planner** | Plan meals for the entire week with 4 meal slots per day (Breakfast, Lunch, Dinner, Dessert/Snacking) |
| **Smart Randomizer** | Two modes: Smart Match (assigns recipes by tags) or Full Random (any recipe in any slot) |
| **Shopping List Generator** | Automatically generate a categorized shopping list from the weekly meal plan |
| **Shopping List Management** | Check/uncheck items, clear checked items, and see remaining item counts |
| **Recipe Sharing** | Share recipes via URL with base64-encoded recipe data for easy import |
| **Profile Settings** | Update name, email, password, and configure meal planner randomizer mode |
| **Mobile Responsive** | Fully optimized UI for mobile devices with responsive navigation, tables, and modals |
| **Network Hosting** | Support for multi-device access on the same network for live demos |

---

## Tech Stack

### Frontend

- React 19.2
- Vite 7.2
- Tailwind CSS 4.1
- Lucide React 0.562

### Backend

- FastAPI 0.115+
- SQLAlchemy 2.0+
- Pydantic 2.8+
- Python 3.11+
- Uvicorn 0.30+ (ASGI server)
- JWT Authentication (Python-Jose 3.3+)
- Passlib 1.7.4+ (bcrypt password hashing)
- Email Validator 2.1+

### Database

- SQLite (Development)
- PostgreSQL-compatible (via psycopg 3.2+)

---

## Getting Started

### Prerequisites

- Node.js 18+
- Python 3.11+
- uv (Python package installer) or pip

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/PBL4-2025/PBL_GroupG_Foood.git
cd PBL_GroupG_Foood
```

2. **Backend Setup**

```bash
cd backend

# Using uv (recommended)
uv venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
uv pip install -r requirements.txt

# OR using pip
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

3. **Environment Variables**

Create a `.env` file in the `backend` directory:

```env
DATABASE_URL=sqlite:///./recipe_manager.db
JWT_SECRET=your-secret-key-change-in-production
JWT_EXPIRE_MINUTES=60
CORS_ORIGINS=http://localhost:5173,http://localhost:5174
```

4. **Frontend Setup**

```bash
cd frontend
npm install
```

Create a `.env` file in the `frontend` directory (optional for local development):

```env
VITE_API_BASE_URL=http://127.0.0.1:8000
VITE_APP_URL=http://localhost:5173
```

5. **Run the Application**

```bash
# Terminal 1 - Backend
cd backend
uv run uvicorn app.main:app --reload

# Terminal 2 - Frontend
cd frontend
npm run dev
```

6. **Access the Application**

Open your browser and navigate to:
- Frontend: `http://localhost:5173`
- Backend API: `http://localhost:8000`
- API Docs: `http://localhost:8000/docs`

---

## Network Hosting for Demo

To host the application on your local network for live demonstrations:

### Setup

1. **Find your computer's IP address**

```bash
# Windows
ipconfig

# macOS/Linux
ifconfig
```

Look for your IPv4 address

2. **Update Backend `.env`**

```env
CORS_ORIGINS=http://localhost:5173,http://###.###.#.##:5173
```

3. **Create Frontend `.env`**

```env
VITE_API_BASE_URL=http://###.###.#.##:8000
VITE_APP_URL=http://###.###.#.##:5173
```

4. **Run Servers with Network Access**

```bash
# Terminal 1 - Backend
cd backend
uv run uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload

# Terminal 2 - Frontend
cd frontend
npm run dev
```

The frontend will automatically serve on all network interfaces (`0.0.0.0`) via Vite configuration.

### Access from Other Devices

On any device connected to the same WiFi network, navigate to:

```
http://###.###.#.##:5173
```

Replace `###.###.#.##` with your actual IP address.

### Features in Network Mode

- All user data persists across devices (shared SQLite database)
- Multiple users can access simultaneously with their own accounts
- Recipe sharing works across all devices
- Real-time updates when refreshing pages

---

## API Documentation

### Authentication

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/register` | Register a new user |
| POST | `/auth/login` | Login and receive JWT token |
| GET | `/auth/me` | Get current user info (validates session) |

### Recipes

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/recipes` | Get all user recipes |
| GET | `/recipes/{id}` | Get recipe details |
| POST | `/recipes` | Create new recipe |
| PUT | `/recipes/{id}` | Update recipe |
| DELETE | `/recipes/{id}` | Delete recipe |

### Ingredients

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/ingredients` | Get all ingredients |
| POST | `/ingredients` | Create new ingredient |

### Tags

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/tags` | Get all tags |
| POST | `/tags` | Create new tag |

### Meal Planning

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/meal-plan` | Get user's meal plan |
| POST | `/meal-plan` | Create or update meal plan |
| DELETE | `/meal-plan/{id}` | Delete meal plan entry |

### Shopping List

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/shopping-lists` | Get user's shopping lists |
| POST | `/shopping-lists` | Create shopping list |
| PUT | `/shopping-lists/{id}` | Update shopping list |
| DELETE | `/shopping-lists/{id}` | Delete shopping list |

For full API documentation with request/response schemas, visit `http://localhost:8000/docs` when the backend is running.

---

## User Flows

### Authentication Flow

1. User navigates to app
2. If no auth token: Shows login/signup screen
3. User registers or logs in
4. Backend returns JWT token
5. Frontend stores token in `localStorage`
6. Token sent with all subsequent API requests
7. On page refresh: Auto-login via `/auth/me` endpoint

### Recipe Management Flow

1. User navigates to "My Recipes" tab
2. System fetches recipes via GET `/recipes`
3. User can:
   - Search recipes by name
   - Filter by tags (Breakfast, Lunch, Dinner, etc.)
   - Sort by date or alphabetically
   - View 12 recipes per page (pagination)
4. Click "+ Add Recipe" to create new recipe
5. Fill in title, description, ingredients, instructions, tags, and upload image
6. Click "Create Recipe" to save
7. Edit or delete existing recipes via icon buttons

### Meal Planning Flow

1. User opens "Weekly Meal Planner" tab
2. System displays 7 days × 4 meals grid
3. For each slot, user can:
   - Select recipe from dropdown
   - Remove assigned recipe with X button
4. Click "Randomize" to auto-fill based on selected mode (Settings)
5. Click "Clear All" to reset entire week
6. Changes save automatically

### Shopping List Flow

1. User opens "Shopping List" tab
2. System generates list from all planned recipes
3. Ingredients grouped by category with headers
4. User can:
   - Check/uncheck individual items
   - Check All / Uncheck All with buttons
   - Clear Checked items
5. Item counts update in real-time

### Recipe Sharing Flow

1. User clicks share icon on any recipe
2. System encodes recipe data to base64 URL
3. On mobile: Opens native share sheet
4. On desktop: Copies URL to clipboard
5. Recipient opens shared URL
6. System decodes recipe and shows import confirmation
7. User clicks "Add to Recipes" to save

---

## Project Structure

```
PBL_GroupG_Foood/
├── backend/
│   ├── app/
│   │   ├── api/
│   │   │   ├── deps.py                    # Dependency injection (auth)
│   │   │   └── routes/
│   │   │       ├── auth.py                # Authentication endpoints
│   │   │       ├── recipes.py             # Recipe CRUD
│   │   │       ├── meal_plan.py           # Meal planning
│   │   │       ├── shopping_lists.py      # Shopping list management
│   │   │       ├── ingredients.py         # Ingredient management
│   │   │       └── tags.py                # Tag management
│   │   ├── core/
│   │   │   ├── config.py                  # Environment configuration
│   │   │   └── security.py                # JWT and password hashing
│   │   ├── crud/
│   │   │   ├── user.py                    # User database operations
│   │   │   ├── recipe.py                  # Recipe database operations
│   │   │   ├── meal_plan.py               # Meal plan operations
│   │   │   ├── shopping_list.py           # Shopping list operations
│   │   │   ├── ingredient.py              # Ingredient operations
│   │   │   └── tag.py                     # Tag operations
│   │   ├── db/
│   │   │   ├── base.py                    # SQLAlchemy base
│   │   │   └── session.py                 # Database session
│   │   ├── models/                        # SQLAlchemy models
│   │   │   ├── user.py
│   │   │   ├── recipe.py
│   │   │   ├── ingredient.py
│   │   │   ├── tag.py
│   │   │   ├── meal_plan.py
│   │   │   ├── shopping_list.py
│   │   │   ├── shopping_list_item.py
│   │   │   ├── recipe_ingredient.py
│   │   │   └── recipe_tag.py
│   │   └── schemas/                       # Pydantic schemas
│   │       ├── auth.py
│   │       ├── recipe.py
│   │       ├── ingredient.py
│   │       ├── tag.py
│   │       ├── meal_plan.py
│   │       ├── shopping_list.py
│   │       └── user.py
│   ├── main.py                            # FastAPI app entry point
│   ├── pyproject.toml                     # Python dependencies (uv)
│   └── .env                               # Environment variables (not committed)
├── frontend/
│   ├── src/
│   │   ├── RecipeManager.jsx              # Main React component (all-in-one)
│   │   ├── main.jsx                       # React entry point
│   │   └── index.css                      # Global styles + Tailwind
│   ├── public/                            # Static assets
│   ├── package.json                       # Node dependencies
│   ├── vite.config.js                     # Vite configuration (network hosting)
│   ├── tailwind.config.js                 # Tailwind CSS config
│   └── .env                               # Environment variables (not committed)
├── .gitignore                             # Git ignore rules
└── README.md                              # This file
```

---

## Team

| Name  | Role |
|------|------|
| Jordan Keiwein Lay | Co-founder, full-stack developer|
| Maydebura Yaroslav | Coofounder, full-stack developer|

**Last Updated:** January 2026

---

## License

This project is licensed under the MIT License.