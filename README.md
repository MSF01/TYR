# Track Your Routine (TYR)

<div align="center">

**This project is NOT AI made. Yes Readme is AI generated (if anyone good at documentation it's a good chance to make a contribution to this project. Cheers 🥂**

**A modern Flutter application for tracking your daily routines and tasks with smart notifications**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Enabled-orange.svg)](https://firebase.google.com)

</div>

---

## 📖 About

Track Your Routine (TYR) is a comprehensive Flutter application designed to help users manage their daily routines and tasks efficiently. The app provides a seamless experience for creating, organizing, and tracking tasks with intelligent notification reminders. Built with Firebase for authentication and data storage, TYR ensures your tasks are securely synced across all your devices.

### Current Status

🛠️ **Under Development** - Actively being improved with new features and enhancements.

---

## ✨ Features

### 🔐 Authentication & Security

- **User Registration & Login** - Secure authentication powered by Firebase Auth
- **Remember Me** - Stay logged in across app sessions
- **Password Management** - Change password functionality with secure re-authentication
- **Profile Management** - Update username and view account information

### 📝 Task Management

- **Create Tasks** - Add tasks with title, description, date, and time
- **Task Categories** - Organize tasks by category:
  - 💼 Work/Business
  - 🏖️ Vacation/Travel
  - 🎊 Party/Events
- **Task List View** - View all your tasks in a clean, organized list
- **Real-time Sync** - Tasks are automatically synced with Firebase Firestore

### 🔔 Notifications

- **Local Notifications** - Receive reminders for your scheduled tasks
- **Smart Alerts** - Get notified when your task time arrives
- **Task Creation Confirmation** - Instant notification when a task is created

### 🎨 User Interface

- **Modern Dark Theme** - Beautiful Material Design 3 dark theme
- **Responsive Design** - Works seamlessly across all screen sizes
- **Google Fonts** - Elegant typography using Google Fonts
- **Intuitive Navigation** - Easy-to-use drawer navigation

### 📱 Multi-Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ Linux
- ✅ macOS

---

## 🛠️ Tech Stack

### Core Framework

- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language (SDK >=2.19.3 <3.0.0)

### Backend & Services

- **Firebase Core** - Firebase initialization
- **Firebase Authentication** - User authentication and management
- **Cloud Firestore** - NoSQL database for task storage

### Key Dependencies

- `google_fonts: ^4.0.4` - Custom typography
- `shared_preferences: ^2.1.1` - Local data persistence
- `flutter_local_notifications: ^15.1.1` - Local notification system
- `intl: ^0.18.1` - Internationalization and date formatting
- `file_picker: ^5.5.0` - File selection capabilities
- `cupertino_icons: ^1.0.2` - iOS-style icons

---

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (>=2.19.3) - [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter)
- **Firebase Account** - [Create Firebase Project](https://console.firebase.google.com/)
- **IDE** - Android Studio, VS Code, or IntelliJ IDEA with Flutter plugins
- **Platform-specific tools**:
  - **Android**: Android Studio with Android SDK
  - **iOS**: Xcode (macOS only)
  - **Web**: Chrome (for web development)

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/MSF01/tyr.git
cd tyr
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Firebase Setup

#### Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or use an existing one
3. Enable **Authentication** (Email/Password method)
4. Enable **Cloud Firestore** database

#### Configure Firebase for Your Platform

**Android:**

1. Download `google-services.json` from Firebase Console
2. Place it in `android/app/` directory
3. The file should already be present in the project

**iOS:**

1. Download `GoogleService-Info.plist` from Firebase Console
2. Place it in `ios/Runner/` directory
3. Update `ios/Runner/Info.plist` if needed

**Web:**

1. Add Firebase configuration to `web/index.html`
2. Follow [FlutterFire setup guide](https://firebase.flutter.dev/docs/overview)

#### Update Firebase Options

Update `lib/firebase_options.dart` with your Firebase project configuration, or regenerate it using:

```bash
flutterfire configure
```

### 4. Run the Application

```bash
# Run on connected device/emulator
flutter run

# Run on specific platform
flutter run -d chrome          # Web
flutter run -d windows         # Windows
flutter run -d macos           # macOS
flutter run -d linux           # Linux
```

### 5. Build for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Windows
flutter build windows --release
```

---

## 📱 Usage

### First Time Setup

1. Launch the app
2. Tap **"Register Now"** to create a new account
3. Enter your username, email, and password
4. You'll be redirected to the login screen
5. Log in with your credentials

### Creating a Task

1. From the home screen, tap **"Click me to Create"**
2. Enter task title (required)
3. Select date and time using the date/time pickers
4. Add an optional description
5. Choose a category (Work 💼, Vacation 🏖️, or Party 🎊)
6. Tap **"Create"** to save the task
7. You'll receive a confirmation notification

### Viewing Tasks

1. Open the navigation drawer (☰)
2. Tap **"Tasks"**
3. View all your tasks in a scrollable list
4. Tasks are automatically synced in real-time

### Managing Profile

1. Open the navigation drawer
2. Tap **"Profile"**
3. View your account information
4. Change username or password as needed
5. Logout when finished

### Notifications

- Notifications are automatically scheduled when you create a task
- You'll receive a reminder when the task time arrives
- Make sure to grant notification permissions when prompted

---

## 📁 Project Structure

```
tyr/
├── lib/
│   ├── main.dart                 # App entry point and routing
│   ├── splash.dart               # Splash screen
│   ├── color.dart                # Color constants
│   ├── firebase_options.dart     # Firebase configuration
│   ├── Pages/
│   │   ├── home.dart             # Home screen with feed
│   │   ├── login_page.dart       # Login screen
│   │   ├── register_page.dart    # Registration screen
│   │   ├── tasks.dart            # Task list view
│   │   ├── create_task.dart      # Task creation form
│   │   └── profile.dart          # User profile screen
│   └── components/
│       ├── app_drawer.dart       # Navigation drawer
│       ├── card.dart             # Feed card component
│       ├── textfield.dart        # Custom text field
│       ├── password_textfield.dart # Password input field
│       ├── character_limit_textfield.dart # Text field with character limit
│       ├── gradient_button.dart  # Gradient button component
│       ├── local_notification.dart # Notification service
│       └── variables.dart        # Shared variables
├── android/                      # Android platform files
├── ios/                          # iOS platform files
├── web/                          # Web platform files
├── windows/                      # Windows platform files
├── linux/                        # Linux platform files
├── macos/                        # macOS platform files
├── test/                         # Test files
├── pubspec.yaml                  # Dependencies and project config
└── README.md                     # This file
```

---

## 🔧 Configuration

### Notification Permissions

**Android:**

- Permissions are automatically handled by `flutter_local_notifications`
- Ensure notification channel is created (already implemented)

**iOS:**

- Add notification permissions to `ios/Runner/Info.plist`:

```xml
<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>remote-notification</string>
</array>
```

### Theme Customization

Modify the theme in `lib/main.dart`:

```dart
theme: ThemeData.dark(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(color: Colors.black),
)
```

---

## 🤝 Contributing

Contributions are welcome! This is an open-source project, and we appreciate any help you can provide.

### How to Contribute

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### Contribution Guidelines

- Follow the existing code style
- Write clear commit messages
- Add comments for complex logic
- Test your changes before submitting
- Update documentation if needed

### Reporting Issues

If you find a bug or have a feature request, please open an issue on GitHub with:

- Clear description of the problem/feature
- Steps to reproduce (for bugs)
- Expected vs actual behavior
- Screenshots (if applicable)
- Device/platform information

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2023 Muhammad Shayaan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 👤 Author

**Muhammad Shayaan**

- GitHub: [@MSF01](https://github.com/MSF01)

---

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev/) for the amazing framework
- [Firebase](https://firebase.google.com/) for backend services
- [Google Fonts](https://fonts.google.com/) for beautiful typography
- All contributors and users of this project

---

## 📸 Screenshots

> **Note:** Screenshots will be added soon. If you'd like to contribute screenshots, please open a pull request!

---

## 🔮 Future Enhancements

- [ ] Task editing and deletion
- [ ] Task completion tracking
- [ ] Recurring tasks
- [ ] Task priorities
- [ ] Search and filter functionality
- [ ] Task sharing
- [ ] Dark/Light theme toggle
- [ ] Multiple language support
- [ ] Task statistics and analytics
- [ ] Export tasks to calendar
- [ ] Widget support for home screen

---

## 📞 Support

If you have any questions or need help, please:

- Open an issue on GitHub
- Check existing issues for solutions
- Review the documentation

---

<div align="center">

**Made with ❤️ using Flutter**

⭐ Star this repo if you find it helpful!

</div>
