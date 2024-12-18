import { NextApiRequest, NextApiResponse } from "next";
import { Client } from "pg";

// استبدل هذه القيم بقيمك الحقيقية
const client = new Client({
  user: "postgres.gusdxofystpxngfvkgay", // اسم المستخدم الخاص بقاعدة البيانات
  host: "aws-0-eu-central-1.pooler.supabase.com", // عنوان الخادم من Supabase
  database: "postgres", // اسم قاعدة البيانات
  password: "bahaa12345678ADSA", // كلمة المرور الخاصة بقاعدة البيانات
  port: 5432, // المنفذ (عادة 5432)
});

client
  .connect()
  .then(() => {
    console.log("Successfully connected to the database"); // رسالة عند نجاح الاتصال
  })
  .catch((error) => {
    console.error("Error connecting to the database:", error); // رسالة عند فشل الاتصال
  });

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  if (req.method === "POST") {
    const { group_name, selected_date } = req.body;

    let query = "SELECT * FROM Lectures";
    let params: (string | number)[] = []; // Explicitly typing params

    // إذا تم اختيار "جميع المحاضرات"
    if (selected_date === "all") {
      query = "SELECT * FROM Lectures";
    } else if (group_name && selected_date) {
      // إذا تم اختيار مجموعة وتاريخ
      query = `
        SELECT * FROM Lectures
        WHERE group_id = (SELECT group_id FROM Groups WHERE group_name = $1)
        AND lecture_date = $2
      `;
      params = [group_name, selected_date];
    } else if (group_name) {
      // إذا تم اختيار مجموعة فقط
      query = `
        SELECT * FROM Lectures
        WHERE group_id = (SELECT group_id FROM Groups WHERE group_name = $1)
      `;
      params = [group_name];
    } else if (selected_date) {
      // إذا تم اختيار تاريخ فقط
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
