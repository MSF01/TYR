# Track Your Routine (TYR)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Enabled-orange.svg)](https://firebase.google.com)

A Flutter app I built to track my daily tasks and routines. It's pretty simple - you create tasks, set dates/times, and get notifications when they're due. Everything syncs to Firebase so your tasks follow you across devices.

Started this back in May 2023 as a way to learn Flutter. Still working on it, adding features as I go.

## What it does

- Create tasks with title, description, date, and time
- Organize tasks by category (work, vacation, party)
- Get local notifications when tasks are due
- Sync everything to Firebase Firestore
- User accounts with Firebase Auth
- Change username/password
- Dark theme UI (because dark mode is better)

Works on Android, iOS, Web, Windows, Linux, and macOS. I've only really tested on Android and Web though, so YMMV on other platforms.

## Tech stuff

Built with:
- Flutter/Dart (SDK >=2.19.3)
- Firebase Auth for user accounts
- Cloud Firestore for storing tasks
- Local notifications for reminders
- SharedPreferences for "remember me" functionality

Main dependencies:
- `google_fonts: ^4.0.4` - for fonts
- `shared_preferences: ^2.1.1` - local storage
- `flutter_local_notifications: ^15.1.1` - notifications
- `intl: ^0.18.1` - date formatting
- `file_picker: ^5.5.0` - file picking (not really used yet)

## Getting started

### Prerequisites

You'll need:
- Flutter SDK (>=2.19.3) - [Install Flutter](https://flutter.dev/docs/get-started/install)
- A Firebase project (free tier works fine) - [Firebase Console](https://console.firebase.google.com/)
- Android Studio, VS Code, or IntelliJ IDEA with Flutter plugins

For platform-specific builds:
- Android: Android Studio with Android SDK
- iOS: Xcode (macOS only)
- Web: Chrome for testing

### Setup

1. Clone the repo:
```bash
git clone https://github.com/MSF01/TYR.git
cd tyr
```

2. Install dependencies:
```bash
flutter pub get
```

3. Firebase setup:
   - Create a Firebase project at https://console.firebase.google.com/
   - Enable Authentication (Email/Password method)
   - Enable Cloud Firestore database
   
   **Android:**
   - Download `google-services.json` from Firebase Console
   - Place it in `android/app/` directory
   
   **iOS:**
   - Download `GoogleService-Info.plist` from Firebase Console
   - Place it in `ios/Runner/` directory
   - Update `ios/Runner/Info.plist` if needed
   
   **Web:**
   - Add Firebase configuration to `web/index.html`
   - Follow [FlutterFire setup guide](https://firebase.flutter.dev/docs/overview)
   
   Then update `lib/firebase_options.dart` with your Firebase config, or run:
   ```bash
   flutterfire configure
   ```

4. Run it:
```bash
flutter run
```

Or build for specific platforms:
```bash
flutter run -d chrome          # Web
flutter run -d windows         # Windows
flutter run -d macos           # macOS
flutter run -d linux           # Linux
```

Build for production:
```bash
flutter build apk --release              # Android APK
flutter build appbundle --release        # Android App Bundle
flutter build ios --release              # iOS
flutter build web --release              # Web
flutter build windows --release         # Windows
```

That's it. If something breaks, check the Firebase setup - that's usually where things go wrong.

## How to use

1. Launch the app
2. Register an account (or login if you have one)
3. Click "Click me to Create" on the home screen
4. Fill in task details:
   - Enter task title (required)
   - Pick date and time using the pickers
   - Add description (optional)
   - Choose a category (Work, Vacation, or Party)
5. Tap "Create" to save
6. Tasks show up in the Tasks page (open the drawer menu ☰)
7. You'll get a notification when the task time arrives

Pretty straightforward. The UI isn't perfect but it works.

## Configuration

### Notifications

Android should work out of the box - permissions are handled automatically by `flutter_local_notifications`.

For iOS, you might need to add notification permissions to `ios/Runner/Info.plist`:

```xml
<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>remote-notification</string>
</array>
```

### Theme

The dark theme is hardcoded in `lib/main.dart`. If you want to change it, modify the `ThemeData.dark()` section:

```dart
theme: ThemeData.dark(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(color: Colors.black),
)
```

## Contributing

Contributions are welcome! I'm still learning Flutter, so if you see something that could be done better, feel free to:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
5. Push to the branch (`git push origin feature/AmazingFeature`)
6. Open a Pull Request

Try to follow the existing code style. Write clear commit messages. Add comments for complex logic. Test your changes before submitting. Update docs if needed.

### Reporting Issues

If you find a bug or have a feature request, open an issue on GitHub with:
- Clear description of the problem/feature
- Steps to reproduce (for bugs)
- Expected vs actual behavior
- Screenshots (if applicable)
- Device/platform information

## License

MIT License - do whatever you want with it.

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

## Author

Muhammad Shayaan - [@MSF01](https://github.com/MSF01)

Started this project in May 2023 to learn Flutter. Still learning, still building.

## Acknowledgments

Thanks to:
- Flutter team for the framework
- Firebase for backend services
- Google Fonts for typography
- Everyone who's contributed or given feedback

## Screenshots

Don't have any screenshots yet (will put on next update on Readme). If you want to add some, feel free to open a PR!

---

Made with Flutter. If you find it useful, star the repo! ⭐

