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
lib/
├── main.dart
├── models/
│   └── employee.dart
├── db/
│   └── db_helper.dart
├── providers/
│   └── employee_provider.dart
├── screens/
│   └── home_screen.dart
assets/
└── employees.json

---

## 🧪 How to Run

1. Clone the repo
2. Run `flutter pub get`
3. Make sure the `employees.json` file is added to `assets/` and declared in `pubspec.yaml`:
    ```yaml
    flutter:
      assets:
        - assets/employees.json
    ```
4. Run the app with:
    ```bash
    flutter run
    ```

---

## 📁 Sample Data Format (employees.json)

```json
{
  "id": 1,
  "name": "Arun Sharma",
  "role": "Software Engineer",
  "startDate": "2017-03-15",
  "isActive": true
}


