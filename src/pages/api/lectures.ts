import { NextApiRequest, NextApiResponse } from "next";
import { Pool } from "pg";

// Create a connection pool
const pool = new Pool({
  user: "postgres.gusdxofystpxngfvkgay",
  host: "aws-0-eu-central-1.pooler.supabase.com",
  database: "postgres",
  password: "bahaa12345678ADSA",
  port: 5432,
});

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  try {
    if (req.method === "POST") {
      const { group_name, selected_date } = req.body;

      let query = `
        SELECT 
          lectures.lecture_id, 
          lectures.lecture_name, 
          lectures.lecture_date, 
          lectures.room_number, 
          lectures.time_slot, 
          teachers.teacher_name
        FROM 
          Lectures AS lectures
        JOIN 
          Teachers AS teachers ON lectures.teacher_id = teachers.teacher_id
      `;
      let params: (string | number)[] = [];

      // Handle different filters for group_name and selected_date
      if (selected_date === "all") {
        query += " WHERE true";
      } else if (group_name && selected_date) {
        query += `
          WHERE lectures.group_id = (SELECT group_id FROM Groups WHERE group_name = $1)
          AND lectures.lecture_date = $2
        `;
        params = [group_name, selected_date];
      } else if (group_name) {
        query += `
          WHERE lectures.group_id = (SELECT group_id FROM Groups WHERE group_name = $1)
        `;
        params = [group_name];
      } else if (selected_date) {
        query += " WHERE lectures.lecture_date = $1";
        params = [selected_date];
      }

      // Get a client from the pool and query the database
      const client = await pool.connect();
      try {
        const result = await client.query(query, params);
        const lectures = result.rows.map((lecture) => ({
          ...lecture,
          lecture_date: new Date(lecture.lecture_date).toLocaleDateString(
            "ru-RU",
            {
              year: "numeric",
              month: "long",
              day: "numeric",
            }
          ),
        }));

        res.status(200).json(lectures);
      } catch (error) {
        console.error("Error retrieving lectures:", error);
        res.status(500).json({ error: "Error retrieving lectures" });
      } finally {
        client.release(); // Release the client back to the pool
      }
    } else {
      res.status(405).json({ error: "Method not allowed" });
    }
  } catch (error) {
    console.error("Error connecting to the database:", error);
    res.status(500).json({ error: "Database connection error" });
  }
}
