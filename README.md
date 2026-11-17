# SkillLink: Freelance Skill Sharing & Local Service Marketplace

**Module code:** ST6002CEM

SkillLink is a cross-platform peer-to-peer marketplace that helps people in Nepal find trusted local services and helps independent providers share their skills. The app currently includes realistic offline demo data in Nepalese rupees (NPR), so the core screens work without a backend.

## Architecture

The app follows MVVM with Provider. Views render screens and forward user actions, ChangeNotifier ViewModels own loading/error/data and filter state, repositories provide data and isolate API access, and models represent users, service gigs, bookings, and reviews. `ApiClient` uses Dio and defaults to `http://localhost:3000/api`; override it with `--dart-define=API_BASE_URL=https://your-api.example/api` when running against an Express API. Gig discovery falls back to Nepal-based mock services when the API is unavailable.

## Features

- Client and service provider role selection at sign in.
- Searchable local service feed with category, NPR price, and rating filters.
- Nepal-based service cards with provider, location, rating, and price.
- Booking status tracker for pending, in-progress, and completed services.
- Five-star booking review dialog.
- Provider-backed MVVM state and Dio REST client, with offline mock data.

## Flutter setup

Install the Flutter stable SDK and an Android, iOS, web, Windows, macOS, or Linux target. From the project root:

```sh
flutter pub get
flutter run
```

To use a local Express API, set its base URL at launch:

```sh
flutter run --dart-define=API_BASE_URL=http://localhost:3000/api
```

The demo can run immediately with the mock data. Run `flutter test` to execute the project tests.
