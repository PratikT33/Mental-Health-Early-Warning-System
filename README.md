# 🧠 MindGuard — AI-Powered Mental Health Early Warning System

A full-stack application that proactively monitors user well-being through daily check-ins, sentiment analysis, and automated "Red Flag" warnings.

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | React 19 + Vite + Tailwind CSS v4 + Recharts |
| **Backend** | Python FastAPI + TextBlob + Motor (async MongoDB) |
| **Database** | MongoDB |
| **Auth** | JWT (python-jose) + Bcrypt (passlib) |

## Quick Start

### Prerequisites
- Python 3.10+
- Node.js 18+
- MongoDB (local or Atlas)

### 1. Backend Setup

```bash
cd backend
pip install -r requirements.txt
python -c "import textblob; textblob.download_corpora()"

# Edit .env with your MongoDB connection string
python run.py
```
Backend runs at `http://localhost:8000`

### 2. Frontend Setup

```bash
cd frontend
npm install
npm run dev
```
Frontend runs at `http://localhost:5173`

## API Endpoints

| Method | Endpoint | Auth | Description |
|--------|----------|:----:|-------------|
| POST | `/auth/register` | ✗ | Create account |
| POST | `/auth/login` | ✗ | Login, get JWT |
| POST | `/api/log-mood` | ✓ | Submit daily mood check-in |
| GET | `/api/dashboard` | ✓ | Wellness score + mood trend |
| GET | `/api/history` | ✓ | Paginated mood log history |
| GET | `/api/get-warnings` | ✓ | Active warning alerts |
| PATCH | `/api/acknowledge-warning/:id` | ✓ | Dismiss a warning |

## Early Warning Engine

Uses a **7-day moving average** of mood scores with 3-tier severity:

| Severity | Threshold | Trigger |
|----------|-----------|---------|
| 🟡 Yellow | Score < 40% | Mild concern |
| 🟠 Orange | Score < 30% | Moderate concern |
| 🔴 Red | Score < 20% **or** 3+ consecutive negative days | Crisis-level |

## Project Structure

```
├── backend/
│   ├── app/
│   │   ├── main.py           # FastAPI app
│   │   ├── config.py         # Environment config
│   │   ├── models/           # Pydantic schemas
│   │   ├── routes/           # API route handlers
│   │   ├── services/         # Business logic
│   │   └── middleware/       # JWT auth middleware
│   ├── requirements.txt
│   └── run.py
├── frontend/
│   └── src/
│       ├── api/              # Axios API client
│       ├── context/          # Auth context
│       ├── components/       # Reusable UI components
│       └── pages/            # Route pages
└── README.md
```

## License

MIT — Built as a B.E. Final Year Project
