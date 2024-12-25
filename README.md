# Lecture API - University Schedule System

This project provides an API to retrieve lecture schedules from a PostgreSQL database. The API allows users to filter lectures based on the group name and the selected date. It provides essential details such as lecture ID, lecture name, date, room number, time slot, and the teacher's name.

## Features
- **Fetch Lectures:** Get lectures by group name and date.
- **Date Format:** All dates are returned in Russian (formatted to `dd month yyyy`).
- **Flexible Filters:** Filter lectures by group and/or date.

## Tech Stack
- **Backend:** Next.js API routes
- **Database:** PostgreSQL
- **Authentication:** None (for demonstration purposes)
- **Deployment:** Can be deployed on platforms like Vercel, Heroku, or any cloud platform.

## Installation & Setup

### Requirements:
- Node.js (>= 16.x)
- PostgreSQL Database

### Steps to Run Locally:
1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/lecture-api.git
    cd lecture-api
    ```

2. Install dependencies:
    ```bash
    npm install
    ```

3. Set up your PostgreSQL database with the following tables:
    - **Lectures**: Stores lecture details.
    - **Teachers**: Stores teacher details.
    - **Groups**: Stores group information.

4. Create a `.env` file to store your database credentials:
    ```bash
    DATABASE_URL=postgres://your-username:your-password@aws-0-eu-central-1.pooler.supabase.com:5432/postgres
    ```

5. Run the Next.js development server:
    ```bash
    npm run dev
    ```

6. Visit `http://localhost:3000/api/lectures` to access the API.

## API Endpoint

### POST `/api/lectures`
**Description:** Retrieve lecture details filtered by group name and date.

#### Request Body:
```json
{
  "group_name": "Group A",
  "selected_date": "2024-12-25"
}



[
  {
    "lecture_id": 1,
    "lecture_name": "Computer Science 101",
    "lecture_date": "25 декабря 2024",
    "room_number": "A101",
    "time_slot": "10:00 - 11:30",
    "teacher_name": "Dr. John Doe"
  },
  {
    "lecture_id": 2,
    "lecture_name": "Mathematics 101",
    "lecture_date": "25 декабря 2024",
    "room_number": "B201",
    "time_slot": "12:00 - 13:30",
    "teacher_name": "Dr. Jane Smith"
  }
]



---


