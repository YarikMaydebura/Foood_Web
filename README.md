# Recipe Manager

A web-based application for meal planning, recipe management, and automated shopping list generation.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Architecture](#architecture)
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
| **User Authentication** | Secure registration and login system ensuring private, personalized access to recipes |
| **Recipe Management** | Create, view, edit, and delete recipes with ingredients, instructions, images, and custom tags |
| **Search and Filter** | Find recipes by name or filter by tags for easy organization |
| **Weekly Meal Planner** | Plan meals for the entire week by assigning recipes to specific days and meal slots |
| **Shopping List Generator** | Automatically generate a consolidated shopping list from the weekly meal plan |
| **Ingredient Aggregation** | Smart merging of ingredient quantities across recipes with unit conversion |

---

## Tech Stack

### Frontend

- React 18
- Vite
- CSS Modules

### Backend

- FastAPI (Python)
- SQLAlchemy ORM
- Pydantic

### Database

- PostgreSQL

---

## Getting Started

### Prerequisites

- Node.js 18+
- Python 3.11+
- PostgreSQL 15+

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/usagirenko/PBL4_G.git
cd PBL4_G
```

2. **Backend Setup**

```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

3. **Database Setup**

```bash
createdb recipe_manager
alembic upgrade head
```

4. **Frontend Setup**

```bash
cd frontend
npm install
```

5. **Environment Variables**

Create `.env` files in both backend and frontend directories:

Backend `.env`:
```
DATABASE_URL=postgresql://user:password@localhost/recipe_manager
SECRET_KEY=your-secret-key
```

Frontend `.env`:
```
VITE_API_URL=http://localhost:8000
```

6. **Run the Application**

```bash
# Terminal 1 - Backend
cd backend
uvicorn main:app --reload

# Terminal 2 - Frontend
cd frontend
npm run dev
```

---

## API Documentation

### Authentication

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/register` | Register a new user |
| POST | `/auth/login` | Login and receive JWT token |
| POST | `/auth/recover` | Request password recovery |

### Recipes

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/recipes` | Get all user recipes |
| GET | `/recipes/{id}` | Get recipe details |
| POST | `/recipes` | Create new recipe |
| PUT | `/recipes/{id}` | Update recipe |
| DELETE | `/recipes/{id}` | Delete recipe |
| PATCH | `/recipes/{id}/tags` | Update recipe tags |

### Meal Planning

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/mealplan/week` | Get weekly meal plan |
| PUT | `/mealplan/entry` | Add or update meal slot |
| DELETE | `/mealplan/entry` | Remove meal from slot |

### Shopping List

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/shopping-list` | Get aggregated shopping list |
| PATCH | `/shopping-list/item` | Mark item as purchased |

---

## Sequence Diagrams

### Login Flow

1. User enters email and password, clicks "Log in"
2. Frontend sends POST request to `/auth/login` with credentials
3. Backend queries database for user by email
4. Backend verifies password hash
5. On success: Returns 200 OK with session token, redirects to Dashboard
6. On failure: Returns 401 Unauthorized, displays error message
7. Optional: User can click "Forgot Password" to trigger recovery flow

### Recipe Management Flow

1. User opens "Recipes" section
2. System fetches and displays recipe list via GET `/recipes`
3. User can click a recipe to view details via GET `/recipes/{id}`
4. User can create new recipe via POST `/recipes`
5. User can edit existing recipe via PUT `/recipes/{id}`
6. User can delete recipe via DELETE `/recipes/{id}` with confirmation
7. User can add or remove tags via PATCH `/recipes/{id}/tags`

### Meal Planning Flow

1. User opens "Meal Planner"
2. System fetches weekly entries via GET `/mealplan/week`
3. User selects day, meal slot, and recipe
4. System updates entry via PUT `/mealplan/entry`
5. User can modify or remove planned meals
6. Changes are persisted immediately

### Shopping List Flow

1. User opens "Shopping List"
2. System checks if meal plan exists
3. If empty: Shows empty state message
4. If populated: Fetches ingredients from all planned recipes
5. Backend aggregates and combines ingredient quantities
6. Frontend displays consolidated checklist
7. User can mark items as purchased via PATCH `/shopping-list/item`

---

## Project Structure

```
PBL4_G/
├── backend/
│   ├── app/
│   │   ├── api/
│   │   │   ├── auth.py
│   │   │   ├── recipes.py
│   │   │   ├── mealplan.py
│   │   │   └── shopping.py
│   │   ├── models/
│   │   ├── schemas/
│   │   └── core/
│   ├── main.py
│   └── requirements.txt
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── hooks/
│   │   └── services/
│   ├── package.json
│   └── vite.config.js
├── docs/
│   ├── diagrams/
│   └── requirements.pdf
└── README.md
```

---

## Team

| Name | Student ID |
|------|------------|
| Kanato Nishiura | 2600240283-0 |
| Jordan Keiwein Lay | 2600240467-1 |
| Maydebura Yaroslav | 2600240001-3 |
| DENG JIAJUN | 260024****** |
| Islam Md Refadul | 2600240464-7 |

**Course:** PBL 4  
**Institution:** Ritsumeikan University  
**Date:** December 2025

---

## License

This project is licensed under the MIT License.