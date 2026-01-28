# true_crazy

A Flutter application scaffolded as "truly_crazy". This repository contains a Flutter app with a modular project structure, routing, theming, utilities, and network client setup.

## Quick start

Prerequisites:
- Flutter SDK (recommended channel: stable). See https://docs.flutter.dev/get-started/install
- A device or emulator to run the app.

To run locally:
1. Clone the repository
   ```
   git clone https://github.com/FahadQasim283/true_crazy.git
   ```
2. Install dependencies
   ```
   flutter pub get
   ```
3. Run the app
   ```
   flutter run
   ```
4. To run analyzer/lints:
   ```
   flutter analyze
   ```

## Project layout (top-level overview)

- .metadata — Flutter metadata used by the Flutter tool (tracked in repo).
- README.md — This file.
- pubspec.yaml — Project manifest: dependencies, assets and fonts.
- pubspec.lock — Locked dependency versions.
- analysis_options.yaml — Linting and analyzer configuration.
- flutter_launcher_icons.yaml — Configuration for generating app icons.
- lib/ — Main Dart source folder. Notable subfolders and files:
  - lib/app.dart — App widget and router configuration (MaterialApp.router).
  - lib/core/ — Core utilities, constants, theme, routes and services:
    - core/constants/ — e.g. app strings, app images, API endpoints.
    - core/theme/ — AppTheme, text styles, and related helpers.
    - core/routes/ — Route names, route generator and navigation helpers.
    - core/services/ — e.g. network ApiClient using Dio.
    - core/utils/ — helpers and validators used across the app.
    - core/enums/ — enum definitions (example: UserStatus).
  - lib/presentation/ — UI screens and presentation layer (e.g. profile screen exports).
  - lib/main.dart — (typically the app entrypoint; check this file if present).
- assets/ — (referenced in pubspec.yaml)
  - assets/icons/ — app icons and icon assets
  - assets/images/ — image assets (e.g. logo.png)
  - assets/font/ — custom fonts (Poppins)
- .env — environment file used with flutter_dotenv (listed in assets in pubspec.yaml)

Note: The repo contains additional files and folders not listed above. My code search was used to build this summary and may be incomplete; view the repository code search for more details: https://github.com/FahadQasim283/true_crazy/search?q=

## Notable dependencies
Defined in pubspec.yaml:
- go_router — navigation/routing
- dio + pretty_dio_logger — network client and logging
- cached_network_image — image caching
- flutter_secure_storage — secure storage for tokens/credentials
- flutter_dotenv — environment variables
- carousel_slider — carousel UI
- flutter_launcher_icons — icon generation

## Useful development tips
- Generate app icons:
  ```
  flutter pub run flutter_launcher_icons:main
  ```
- If using environment variables, create a `.env` file at project root or set appropriate values before running.
- Tokens are persisted using a TokenStorage utility (check lib/core/services/local_storage/token_storage.dart if present).

## Contributing
If you want me to update this README in the repository, I can:
- commit the change directly to a branch, or
- open a pull request with the README update.

Tell me which option you prefer and the branch name you'd like (or I can create one for you).
