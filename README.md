# Supermarket

Flutter marketplace app for house booking, home services, and tuition. Users can sign up as students, house owners, or service providers and manage listings, bookings, and orders from role-based dashboards.

## Features

- Role-based auth (student, house owner, service provider)
- NID verification flow
- House search, details, and booking
- Service search, details, and ordering (cleaning, repair, plumbing, and more)
- Tuition listings and applications (primary through university)
- Smart search, maps, chat, reviews, emergency contacts, and complaints
- Notifications
- Light/dark theme support (Material Design, Poppins font)
- State management with Riverpod
- Mock API layer for local development

## Requirements

- Flutter SDK (Dart `>=3.0.0 <4.0.0`)
- Android Studio / Xcode or a device emulator
- (Optional) Firebase project if you wire up real push notifications

## Getting started

```bash
cd Supermarket-main
flutter pub get
flutter run
```

To generate Riverpod code when needed:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Project structure

```
Supermarket-main/
├── pubspec.yaml
└── lib/
    ├── main.dart                 # App entry (ProviderScope)
    ├── app.dart                  # MaterialApp + themes
    ├── routes.dart               # Named routes
    ├── screens/
    │   ├── auth/                 # Login, signup, NID
    │   ├── common/               # Splash, onboarding, notifications
    │   ├── dashboards/           # Role dashboards
    │   ├── house_booking/
    │   ├── service_ordering/
    │   ├── tuition/
    │   ├── features/             # Maps, chat, reviews, etc.
    │   └── profile/
    ├── services/                 # Mock API, location, storage, notifications
    ├── state/
    │   ├── models/
    │   └── providers/
    ├── theme/
    ├── utils/
    └── widgets/
```

## User roles

| Role              | What they can do |
|-------------------|------------------|
| Student           | Book houses, order services, apply for tuition |
| House owner       | Manage house listings and bookings |
| Service provider  | Manage services and orders |

## Main dependencies

- `flutter_riverpod` - state management
- `dio` / `http` - networking
- `shared_preferences` / `sqflite` - local storage
- `geolocator` / `google_maps_flutter` - location and maps
- `firebase_core` / `firebase_messaging` - notifications
- `image_picker` / `cached_network_image` - images

## Notes

- API calls currently go through a mock service (`lib/services/mock_api_service.dart`). Point `AppConstants.baseUrl` at a real backend when you are ready.
- Assets are declared under `assets/images/`, `assets/icons/`, `assets/animations/`, and Poppins fonts under `assets/fonts/`. Add those folders if they are missing before a full build.

## License

Use and modify freely for learning and development.
