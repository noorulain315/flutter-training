# Flutter Training

A Flutter training project covering core Flutter concepts progressively across ten assignments — from basic UI and state management to clean architecture and dependency injection.

## Assignments

| # | Topic | Key Concepts |
|---|-------|-------------|
| 1 | Trip Repository | Dart classes, lists, data modeling |
| 2 | Trip List Screen | StatelessWidget, ListView, basic UI |
| 3 | List Builders | `ListView.builder`, `SliverList` |
| 4 & 5 | Add Trip + Navigation | Forms, GoRouter, passing data between screens |
| 6 | Cubit | `flutter_bloc`, `Cubit`, `BlocBuilder` |
| 7 | Bloc | `Bloc`, events, states, pull-to-refresh |
| 8 | Dio + Remote Data | Dio, JSON serialization (`json_annotation`), `PostRemoteDataSource` |
| 9 | Riverpod | `flutter_riverpod`, `FutureProvider`, `ConsumerWidget` |
| 10 | Clean Architecture + DI | Domain/Data/Presentation layers, `FutureProvider` as DI, use cases, repository pattern |

## Architecture (Assignment 10)

```
assignment_ten/
├── domain/               # Pure Dart — no framework dependencies
│   ├── entities/         # PostEntity
│   ├── repositories/     # Abstract PostRepository
│   └── usecases/         # GetPostsUseCase
├── data/                 # Framework-aware implementations
│   ├── models/           # PostModel (fromJson, toEntity)
│   ├── datasources/      # Abstract + Dio implementation
│   └── repositories/     # PostRepositoryImpl
├── presentation/
│   ├── providers/        # FutureProvider wired to use case
│   └── screens/          # ConsumerWidget with pull-to-refresh
└── di/
    └── injection.dart    # Riverpod providers — the DI container
```

## Tech Stack

- **Flutter** + **Dart**
- **GoRouter** — declarative navigation
- **flutter_bloc** — Cubit and Bloc state management
- **flutter_riverpod** — provider-based state management and DI
- **Dio** — HTTP client
- **json_annotation** / **json_serializable** — JSON code generation
- **mocktail** / **bloc_test** — testing utilities

## Getting Started

```bash
flutter pub get
flutter run
```

Navigate between assignments using the icons in the AppBar on the Trips screen.
