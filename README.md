# Employee Tracker (Flutter + SQLite)

A simple Flutter app that displays a list of employees and highlights those who have been active in the company for more than 5 years.

---

## 📱 Features

- Loads employee data from a local JSON file on first launch
- Stores data in a local SQLite database using `sqflite`
- Uses `Riverpod` for state management
- Flags employees in **green** if:
  - They are active (`isActive == true`)
  - They have been with the company for more than 5 years

---

## 📦 Tech Stack

- Flutter
- SQLite (`sqflite` package)
- Riverpod
- JSON data loader
- Clean architecture with modular code

---

## 🏗️ Project Structure

