"use client";
import { useState } from "react";
import { Lecture } from "@/types/types";

const Home = () => {
  const [groupName, setGroupName] = useState<string>("");
  const [lectures, setLectures] = useState<Lecture[]>([]);
  const [selectedDate, setSelectedDate] = useState<string>("today");
  const [noLecturesMessage, setNoLecturesMessage] = useState<string>("");

  const getNextDate = (date: string) => {
    const today = new Date();
    let nextDate = new Date(today);

    if (date === "tomorrow") {
      nextDate.setDate(today.getDate() + 1);
    } else if (date === "dayAfter") {
      nextDate.setDate(today.getDate() + 2);
    } else if (date === "today") {
      nextDate = today;
    }

    return nextDate.toISOString().split("T")[0];
  };

  const fetchLectures = async () => {
    const body =
      selectedDate === "all"
        ? {}
        : { group_name: groupName, selected_date: getNextDate(selectedDate) };

    try {
      const res = await fetch("/api/lectures", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(body),
      });

      if (res.ok) {
        const data: Lecture[] = await res.json();
        setLectures(data);

        if (data.length === 0) {
          setNoLecturesMessage("No lectures found for the selected date.");
        } else {
          setNoLecturesMessage("");
        }
      } else {
        console.error("Failed to fetch lectures:", res.status);
        setNoLecturesMessage("Failed to fetch data. Please try again.");
      }
    } catch (error) {
      console.error("Error fetching lectures:", error);
      setNoLecturesMessage("An error occurred while fetching data.");
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-r from-purple-600 to-indigo-600 flex items-center justify-center p-8 relative">
      <div className="absolute inset-0 bg-black opacity-50 animate-pulse"></div>
      <div className="bg-white p-8 rounded-lg shadow-xl w-full max-w-2xl relative z-10">
        <h1 className="text-3xl font-bold text-center text-gray-800 mb-6">
          Find Lectures
        </h1>

        <div className="mb-6 flex justify-center">
          <iframe
            src="https://giphy.com/embed/qrhKvS6Kz8yfC"
            width="480"
            height="274"
            frameBorder="0"
            className="giphy-embed rounded-lg shadow-md"
            allowFullScreen
            title="Lecture GIF"
          ></iframe>
        </div>

        <div className="mb-6">
          <label className="block text-sm font-semibold text-gray-600">
            Group Name
          </label>
          <input
            type="text"
            placeholder="Enter group name"
            value={groupName}
            onChange={(e) => setGroupName(e.target.value)}
            className="w-full p-3 mt-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
          />
        </div>

        <div className="mb-6">
          <label className="block text-sm font-semibold text-gray-600">
            Select Date
          </label>
          <div className="mt-2">
            <select
              value={selectedDate}
              onChange={(e) => setSelectedDate(e.target.value)}
              className="w-full p-3 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
            >
              <option value="today">Today</option>
              <option value="tomorrow">Tomorrow</option>
              <option value="dayAfter">Day After Tomorrow</option>
              <option value="all">All Lectures</option>
            </select>
          </div>
        </div>

        <button
          onClick={fetchLectures}
          className="w-full py-3 bg-indigo-600 text-white rounded-md shadow-lg hover:bg-indigo-700 transition duration-300 ease-in-out mb-4"
        >
          Search
        </button>

        {noLecturesMessage && (
          <div className="text-center text-red-500 font-semibold mb-6">
            {noLecturesMessage}
          </div>
        )}

        <div className="mt-8 space-y-6">
          {lectures.map((lecture) => (
            <div
              key={lecture.lecture_id}
              className="bg-gray-50 p-4 rounded-lg shadow-md"
            >
              <h3 className="text-xl font-semibold text-gray-800">
                {lecture.lecture_name}
              </h3>
              <p className="text-sm text-gray-600">
                Date: {lecture.lecture_date}
              </p>
              <p className="text-sm text-gray-600">
                Room: {lecture.room_number}
              </p>
              <p className="text-sm text-gray-600">Time: {lecture.time_slot}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Home;
