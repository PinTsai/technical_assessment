# Junior Flutter Developer - Technical Assessment

A simple Flutter app that fetches posts from [JSONPlaceholder](https://jsonplaceholder.typicode.com)  
– Displays a list of posts (title + body preview)  
– Tap a post to view details  
– Unit & Widget tests included


---

## Table of Contents

- [Prerequisites](#prerequisites)  
- [Installation](#installation)  
- [Running the App](#running-the-app)  
- [Networking Library](#networking-library)  
- [State Management](#state-management)  
- [Running Tests](#running-tests)  
- [License](#license)  

---

## Prerequisites
- Flutter 3.0.0 or later  
- Dart 2.17 or later  
- A working Android/iOS emulator or physical device

---

## Installation
1. Clone the repo  
   ```bash
   git clone [https://github.com/PinTsai/technical_assessment.git]
   cd technical_assessment
2. Install dependencies
   ```bash
   flutter pub get
   
## Running the App
   ```bash
   flutter runfew

---

## Networking Library

This app uses the http package for making network requests. The PostApi class handles all API communications:
- Base URL: https://jsonplaceholder.typicode.com
- Endpoint: /posts
- HTTP client injection for better testability

---

## State Management

The app implements Provider pattern with ChangeNotifier for state management:
- PostProvider manages the application state
- Four distinct states: initial, loading, loaded, and error
- Reactive UI updates through notifyListeners()

---

## Running Tests

Running All Tests
```bash
flutter test

Running Unit Tests Only
```bash
flutter test test/unit/

Running Widget Tests Only
```bash
flutter test test/widget/



