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


---

### Steps to Follow:
1. **Replace placeholders**: In the README file, make sure to replace the repository link (`https://github.com/your-username/lecture-api.git`) and database connection details with actual information.
   
2. **Create `.env` file**: Ensure your environment variables (like database credentials) are stored securely in a `.env` file (do not commit this file to GitHub). Here's an example `.env` file for local development:

    ```txt
    DATABASE_URL=postgres://postgres.gusdxofystpxngfvkgay:bahaa12345678ADSA@aws-0-eu-central-1.pooler.supabase.com:5432/postgres
    ```

3. **Deploy**: Once your project is ready and tested locally, you can deploy it to a platform like **Vercel** (ideal for Next.js) or **Heroku**.

4. **Design Consideration**: You can further enhance the README by adding any design choices, flowcharts, or diagrams explaining how the API works or how the database schema is structured.

5. **Database Schema**:
   - **Lectures Table**: Contains lecture-related information.
   - **Teachers Table**: Contains details about the teachers.
   - **Groups Table**: Contains information about the groups.

---

### Example of Usage:

1. To test the API, you can use tools like **Postman** or **cURL** to send `POST` requests with different filters, e.g.:
   
   ```bash
   curl -X POST http://localhost:3000/api/lectures \
     -H "Content-Type: application/json" \
     -d '{"group_name": "Group A", "selected_date": "2024-12-25"}'


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


![image](https://github.com/user-attachments/assets/8e943aa8-1a1b-4d0a-b20c-642e3b61d263)


