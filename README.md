# 🔗 Nubank Link Shortener — Flutter Take-Home Test

> **Candidate:** [Your Name]
> **Delivery Date:** [Date]
> **Platform:** Flutter (Android & iOS)

---

## 📋 About the Project

A Flutter URL shortener application built as part of Nubank's mobile engineering selection process. The app allows users to shorten URLs, view a history of recently shortened links, copy them to the clipboard, open the original URLs in a browser, and remove entries from history. History is persisted locally via `SharedPreferences` so it survives app restarts.

---

## 🎨 Layout

The design is inspired by Nubank's visual identity, using a purple-based color system with a modern, minimalist, and premium aesthetic.

| Feature | Description |
|---|---|
| Splash screen | Logo centered on primary-color background, auto-navigates after 2s |
| Header | Logo + "Link Shortener" title |
| Input | Text field for URL entry with validation |
| Button | "Shorten link" with loading indicator |
| History | Scrollable list of recently shortened links |
| Actions | Copy, open in browser, and delete each link |
| Empty state | Icon + friendly message when history is empty |

---

## 🏗️ Architecture

The project follows **Clean Architecture** with a **feature-first** folder organization.

```
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── network/
│   ├── providers/
│   ├── responsive/
│   ├── router/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   └── home/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       └── presentation/
│           ├── pages/
│           ├── providers/
│           ├── view_data/
│           ├── views/
│           └── widgets/
│
├── splash/
│   └── presentation/
│       └── pages/
│
├── app.dart
└── main.dart
```

### Layers

| Layer | Responsibility |
|---|---|
| **Data** | API communication, DTOs, local storage, repository implementations |
| **Domain** | Entities, repository contracts, use cases |
| **Presentation** | UI, state management (Riverpod), user interactions |

---

## 🧰 Tech Stack

| Package | Usage |
|---|---|
| `flutter_riverpod` | State management |
| `riverpod_annotation` + `riverpod_generator` | Provider code generation |
| `go_router` | Declarative navigation |
| `dio` | HTTP client with interceptors and timeout handling |
| `freezed` + `freezed_annotation` | Immutable models and sealed union types |
| `json_annotation` + `json_serializable` | JSON serialization |
| `shared_preferences` | Local persistence of link history |
| `flutter_screenutil` | Responsive layout scaling |
| `equatable` | Value equality for domain entities |
| `url_launcher` | Open original URLs in the device browser |
| `mocktail` | Mocks for unit and widget tests |

---

## 🌐 API

**Base URL:** `https://url-shortener-server.onrender.com`

### POST `/api/alias` — Shorten URL

**Request:**
```json
{
  "url": "https://example.com"
}
```

**Response (201):**
```json
{
  "alias": "abc123",
  "_links": {
    "self": "https://example.com",
    "short": "https://url-shortener-server.onrender.com/api/alias/abc123"
  }
}
```

---

## 📐 Key Patterns

### Responsive Views

Each page has separate view files per breakpoint:

```
presentation/views/
  home_mobile_view.dart    (< 600px)
  home_tablet_view.dart    (600px – 1023px)
  home_desktop_view.dart   (≥ 1024px)
```

Breakpoints are handled by `ResponsiveLayout`, a `LayoutBuilder`-based widget that selects the correct view at runtime.

The **Page** is responsible for:
- Watching providers
- Handling async states (loading / success / error)
- Dispatching events via snackbars

The **Views** are responsible only for:
- Rendering the UI
- Receiving a `ViewData` object as a parameter

### ViewData Pattern

```dart
class HomeViewData {
  final List<LinkEntity> links;
  final bool isLoading;
}
```

Views **never** call `ref.watch` directly.

### Riverpod Code Generation

```dart
@riverpod
class ShortenLink extends _$ShortenLink {
  // ...
}
```

Using `StateNotifierProvider` directly is **forbidden**.

### Local Persistence

History is stored via `SharedPreferences` using a JSON-encoded list under the key `shortened_links`. The `LinkHistoryProvider` loads persisted links on initialization and saves on every mutation (add, remove, clear).

`SharedPreferences` is injected as a provider override, making it fully testable without platform dependencies.

### Error Handling

Repositories return `Result<T>` types using sealed classes via `freezed`:

```dart
// Success
Result.success(entity)

// Failure
Result.failure(Failure.network())
Result.failure(Failure.serverError(statusCode: 500))
Result.failure(Failure.notFound())
Result.failure(Failure.unknown())
```

Errors are surfaced to the user via snackbars in the `HomePage`, which listens to `shortenLinkProvider` state changes.

---

## 🧪 Tests

### Coverage

| Type | File | Scenarios |
|---|---|---|
| **Unit — Use Case** | `shorten_link_usecase_test.dart` | success, failure, repository call verification |
| **Unit — Repository** | `link_repository_impl_test.dart` | success, network error, timeout, 404, 500, unknown exception, local get/save |
| **Provider — ShortenLink** | `shorten_link_provider_test.dart` | initial state, loading → success, loading → error |
| **Provider — Persistence** | `link_persistence_test.dart` | persist and reload across container restart |
| **Widget — HomePage** | `home_page_test.dart` | initial state, link card after shortening, site name (WWW stripping), error snackbar |
| **Widget — SplashPage** | `splash_page_test.dart` | logo render, navigation after 2s |
| **Integration** | `app_integration_test.dart` | full E2E flows on device |

### Integration Test Scenarios

| Scenario |
|---|
| Display shortened link in history after submitting valid URL |
| Show error snackbar when submitting an invalid URL |
| Show network error message when API call fails |
| Remove link from history when delete button is pressed |
| Clear all history when clear button is pressed |
| Persist history after app restart |
| Show confirmation snackbar when copy button is pressed |
| Not duplicate a link with the same alias in history |

### Test Structure

```
test/
├── features/
│   └── link_shortener/
│       ├── data/
│       │   └── repositories/
│       │       └── link_repository_impl_test.dart
│       ├── domain/
│       │   └── usecases/
│       │       └── shorten_link_usecase_test.dart
│       └── presentation/
│           ├── pages/
│           │   └── home_page_test.dart
│           └── providers/
│               ├── shorten_link_provider_test.dart
│               └── link_persistence_test.dart
└── features/
    └── splash/
        └── presentation/
            └── pages/
                └── splash_page_test.dart

integration_test/
└── app_integration_test.dart
```

### Run tests

```bash
# Unit and widget tests
flutter test

# Integration tests (requires a connected device or emulator)
flutter test integration_test/app_integration_test.dart -d <device-id>
```

### Coverage report

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.x`
- Dart SDK `>=3.x`

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/your-username/nubank-link-shortener.git
cd nubank-link-shortener

# 2. Install dependencies
flutter pub get

# 3. Generate files (Riverpod + Freezed + JSON)
dart run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

> **Note:** In debug mode the app wraps in `DevicePreview`, which allows previewing multiple device form factors without a physical device.

---

## ✅ Delivery Checklist

- [x] Clean Architecture applied
- [x] Riverpod with code generation
- [x] Responsive layout (mobile / tablet / desktop)
- [x] Local history persistence via SharedPreferences
- [x] Unit tests (use cases and repositories)
- [x] Provider tests
- [x] Widget tests
- [x] Integration tests (E2E on device)
- [x] No lint warnings
- [x] No hardcoded colors
- [x] No business logic inside widgets
- [x] Proper error handling (loading / success / error)
- [x] URL validation before API call
- [x] Duplicate alias prevention in history
- [x] Readable folder structure
- [x] Senior-level code organization

---

## 📁 Conventions

| Item | Pattern |
|---|---|
| Folders | `snake_case` |
| Classes & Widgets | `PascalCase` |
| Files | `snake_case.dart` |
| 1 public widget per file | ✅ required |
| Max widget size | ~250–300 lines |

### Forbidden Patterns

- Multiple widgets in one file
- Internal `_build` methods
- Business logic inside widgets
- Hardcoded strings
- Direct API calls in UI
- Inline colors (`Colors.white`, `Color(0xFF...)`)
- Inline `TextStyle`
- `Navigator.push`

---

## 🎨 Design System

### Colors (AppColors)

| Token | Value | Usage |
|---|---|---|
| `AppColors.primary` | `#959BE1` | Main purple — accents, icons, links |
| `AppColors.primaryDark` | `#4A0A8E` | Darker purple variant |
| `AppColors.primaryLight` | `#F7E7FF` | Light purple — card surfaces |
| `AppColors.surface` | `#FFFFFF` | Cards and containers |
| `AppColors.textPrimary` | `rgba(36,42,50,0.92)` | Primary text |
| `AppColors.textSecondary` | `#666666` | Secondary text / subtitles |
| `AppColors.error` | `#E53E3E` | Error states, delete actions |
| `AppColors.success` | `#2E7D32` | Success states (copy confirmation) |
| `AppColors.warning` | `#D69E2E` | Warning states (invalid URL) |

### Typography (AppTextStyles)

```dart
AppTextStyles.h1(context)         // Screen titles — 30sp, w800
AppTextStyles.h2(context)         // Subtitles — 20sp, bold
AppTextStyles.bodyMedium(context) // Body text — 12sp, normal
AppTextStyles.caption(context)    // Labels and hints — 12sp, secondary color
AppTextStyles.link(context)       // Tappable links — 13sp, primary color
```

---

## 🗒️ Technical Notes

**On local persistence:** The test spec states that data persistence is optional ("Must data be stored? No. Just keep it in memory."). `SharedPreferences`-backed history was implemented as a deliberate enhancement to demonstrate local storage patterns, layered architecture, and testability — the `LinkLocalDataSource` abstraction makes it trivially swappable for a pure in-memory implementation without touching any other layer.

**On the GET `/api/alias/:id` endpoint:** The spec lists this endpoint but also states "Must all API endpoints be used? No. Use only what you feel it's required for solving the problem." Only the POST endpoint is used, as it provides all the data needed to populate the history (alias, original URL, and short URL) in a single response.

---

*Built with 💜 for Nubank's engineering selection process.*