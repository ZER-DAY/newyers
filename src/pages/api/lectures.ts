import { NextApiRequest, NextApiResponse } from "next";
import { Client } from "pg";

const client = new Client({
  user: "postgres.gusdxofystpxngfvkgay",
  host: "aws-0-eu-central-1.pooler.supabase.com",
  database: "postgres",
  password: "bahaa12345678ADSA",
  port: 5432,
});

client
  .connect()
  .then(() => {
    console.log("Successfully connected to the database");
  })
  .catch((error) => {
    console.error("Error connecting to the database:", error);
  });

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  if (req.method === "POST") {
    const { group_name, selected_date } = req.body;

    let query = "SELECT * FROM Lectures";
    let params: (string | number)[] = [];

    if (selected_date === "all") {
      query = "SELECT * FROM Lectures";
    } else if (group_name && selected_date) {
      query = `
        SELECT * FROM Lectures
        WHERE group_id = (SELECT group_id FROM Groups WHERE group_name = $1)
        AND lecture_date = $2
      `;
      params = [group_name, selected_date];
    } else if (group_name) {
      query = `
        SELECT * FROM Lectures
        WHERE group_id = (SELECT group_id FROM Groups WHERE group_name = $1)
      `;
      params = [group_name];
    } else if (selected_date) {
      query = "SELECT * FROM Lectures WHERE lecture_date = $1";
      params = [selected_date];
    }

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
      console.error(error);
      res.status(500).json({ error: "Error retrieving lectures" });
    }
  } else {
    res.status(405).json({ error: "Method not allowed" });
  }
}
