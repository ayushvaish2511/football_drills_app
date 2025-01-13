# Football Drills App

A Flutter application for tracking football drills progress and competing with other players.

## Overview

Football Drills App is a mobile application that helps users track their football drill practices, compare performance with others, and maintain their training progress. The app features user authentication, personalized dashboards, and a global leaderboard system.

## Features

- 🔐 User Authentication (Login/Logout)
- 📱 Persistent Login State
- 🏃 Football Drills Dashboard
- 📊 Personal Progress Tracking
- 🏆 Global Leaderboard
- 📸 Drill Images and Descriptions
- 📱 Cross-platform Support (Android/iOS)

## Technical Stack

- Frontend: Flutter
- Backend: Firebase
- Authentication: Firebase Auth
- Storage: Firebase Storage

## Screens

1. **Login Screen**
   - User authentication
   - Persistent login state

2. **Home Screen**
   - List of available drills
   - Drill details (name, total count, image)
   - Navigation to drill detail page

3. **User Dashboard Screen**
   - Personal drill history
   - Progress tracking
   - Completed drills overview

4. **Leaderboard Screen**
   - Global rankings
   - Total scores
   - User performance comparison

## Setup Instructions

### Prerequisites
- Flutter SDK
- Firebase Account
- MongoDB Atlas Account
- Android Studio/VS Code

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/football_drills_app.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:

Add google-services.json to app
Update Firebase configuration in lib/firebase_options.dart

4. Run the app:
```bash
flutter run
```

5. Build APK
Debug version:
```bash
flutter build apk --debug
```

6. Release version:
```bash
flutter build apk --release
```

Contributing
- Fork the repository
- Create your feature branch
- Commit your changes
- Push to the branch
- Create a Pull Request