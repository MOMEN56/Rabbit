Hello guys! Today, I'm excited to release the first version of my app.

---

##  Project Overview

App name: Rabbit

This project is a Flutter-based **Internet Speed Test application** that allows users to measure their **download speed, upload speed, ping**, and view their **public IP address** with a smooth and modern UI.

The app focuses on real-time network status detection, clean architecture, and responsive animations to provide a polished user experience.

---

## ✨ Key Features

* 📶 Real-time internet connection monitoring (Connected / No Access / Disconnected)
* 🚀 Animated start experience with Lottie
* 📊 Live download & upload speed tracking
* ⏱ Accurate ping measurement
* 🌐 Public IP detection
* 🧠 Smart test cancellation & timeout handling
* 🔄 Automatic state management using Bloc (Cubit)
* 📱 Fully responsive UI using ScreenUtil

---

## 🧱 Technical Stack & Architecture

### **Framework & Language**

* Flutter (Dart)

### **State Management**

* `flutter_bloc` (Cubit-based architecture)

### **Architecture Pattern**

* Feature-based clean architecture
* Separation of concerns:

  * Presentation layer (UI)
  * State management layer (Cubits & States)
  * Core utilities & shared components

### **Networking & Utilities**

* Internet connectivity & availability detection
* Speed testing & ping measurement

---

## 🗂 Project Structure

```
lib/
├── core/
│   ├── utils/
│   │   ├── app_assets.dart
│   │   ├── app_colors.dart
│   │   ├── app_dimensions.dart
│   │   ├── format_helper.dart
│   │   └── routing/
│   │       └── app_router.dart
│   │
│   └── widgets/
│       ├── custom_app_bar.dart
│       └── custom_snack_bar.dart
│
├── features/
│   ├── start/
│   │   ├── presentation/
│   │   │   ├── cubits/
│   │   │   │   └── start_view_cubit/
│   │   │   ├── views/
│   │   │   └── widgets/
│   │
│   └── home/
│       ├── presentation/
│       │   ├── cubits/
│       │   │   ├── internet_checker_cubit/
│       │   │   └── internet_settings_cubit/
│       │   ├── views/
│       │   └── widgets/
│
└── main.dart
```

---

## 📦 Packages Used & Their Purpose

### **State Management**

* **flutter_bloc** → Handles business logic and UI state separation
* **equatable** → Simplifies state comparison

### **Networking & Internet**

* **connectivity_plus** → Detects network connectivity changes
* **internet_connection_checker_plus** → Verifies actual internet access
* **flutter_speed_test_plus** → Performs download & upload speed tests
* **dart_ping** → Measures network ping

### **UI & Animations**

* **lottie** → Smooth JSON-based animations
* **syncfusion_flutter_gauges** → Speedometer gauge visualization
* **flutter_screenutil** → Responsive UI across devices
* **google_fonts** → Custom typography

### **Device Features**

* **vibration** → Haptic feedback on user actions

---

## 🧠 App Flow Summary

1. App starts with internet state monitoring
2. User presses start → animation plays
3. Speed test begins (download → upload)
4. Live results are displayed
5. User can cancel the test at any time
6. Final results are shown with smooth transitions

---

## 📌 Notes

* The app is designed to be easily scalable
* Each feature is isolated for maintainability
* Built with performance and UX in mind

---

Thank you for checking out the project! 🚀
Feel free to contribute, report issues, or suggest improvements.
