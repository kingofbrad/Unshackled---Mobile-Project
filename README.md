# Unshackled

Unshackled is an early iOS application prototype created as a five-person client project for a university development module. The brief explored how a mobile app might support survivors of sexual assault through private journaling, emotion tracking, personal planning, and communication.

This repository contains the iOS work. The Android version described in the original brief was outside the scope of this prototype. Some screens and features remain incomplete or use placeholder content.

> **Prototype notice:** This is an educational project, not a published or production support service. Do not use it to store real personal or sensitive information, and do not rely on it for urgent or crisis support.

## Project work

The iOS prototype explores:

- SwiftUI onboarding and email/password account flows using Firebase Authentication.
- User-scoped journal data stored in Cloud Firestore.
- Emotion logging and related app screens.
- Foundations for one-to-one messaging backed by Firestore.
- Planning and interface work developed alongside the design team using Miro and Figma.

The original brief also proposed goals, group chat, and broader support features. These should be treated as planned or incomplete work rather than finished functionality.

## Technology

- Swift and SwiftUI
- iOS 16 or later deployment target
- Xcode 14 project
- Firebase Authentication
- Cloud Firestore
- Swift Package Manager for Firebase dependencies
- Figma and Miro for design and user-flow collaboration

## Getting started

### Requirements

- macOS
- Xcode 14 or later
- An iOS 16 or later simulator, or a compatible iPhone

### Open the project

1. Clone the repository:

   ```bash
   git clone https://github.com/kingofbrad/Unshackled---Mobile-Project.git
   cd Unshackled---Mobile-Project
   ```

2. Open `Unshackled.xcodeproj` in Xcode.
3. Allow Xcode to resolve the Swift Package Manager dependencies.
4. Select an iOS simulator and run the `Unshackled` scheme.

### Firebase configuration

The app is configured to use Firebase and expects `Unshackled/GoogleService-Info.plist`.

To connect a Firebase project you control:

1. Register an iOS app in Firebase using the bundle identifier `Bradlee.King.Unshackled`.
2. Add that Firebase project's `GoogleService-Info.plist` to the `Unshackled` app target, replacing the existing configuration if needed.
3. Enable Email/Password sign-in in Firebase Authentication and configure Cloud Firestore.
4. Set Firestore security rules that restrict access to authenticated users and their own data before using any Firebase project.

Firebase client configuration does not replace database security rules. Keep this prototype disconnected from real user data.

## Repository layout

- `Unshackled/` — SwiftUI app, view models, controllers, and app assets.
- `Unshackled_Assets/` — exported design assets used during development.
- `UnshackledTests/` — unit-test target.
- `UnshackledUITests/` — UI-test target.

## Project context

This project was developed for the DM2111 Development Focus A module (2022–23, Semester 1). The app and its supporting content were created for a client brief as part of a team project. The repository is retained as a record of that learning and prototype work.
