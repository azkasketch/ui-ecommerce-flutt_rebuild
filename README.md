# Vanta Market

A premium dark-first e-commerce mobile UI rebuild built with Flutter. This project reimagines a standard shopping app into a more editorial, lifestyle-first storefront with soft pastel accents, elevated card layering, and a refined premium visual system.

## Overview

The app is designed around a modern mobile shopping experience with:

- dark luxury base palette
- editorial hero sections and product storytelling
- soft coral, mint, and lavender accent colors
- rounded card surfaces with subtle depth and shadows
- product-focused browsing and cart/profile flows
- Material 3 styling with a custom premium design language

## Design Direction

This project follows a dark-first aesthetic with warm editorial typography and a mobile-first shopping flow. The visual identity uses:

- Instrument Serif for headline and editorial moments
- Instrument Sans for body text, labels, and interface copy
- subdued neutral surfaces with intentional contrast
- colorful product tiles and feature cards to keep the interface playful and contemporary

## Tech Stack

- Flutter
- Dart
- Material 3
- Google Fonts

## App Flow

The current UI includes:

- login screen
- home screen with search, hero banner, category chips, and featured items
- product detail page
- cart summary flow
- profile/account screen
- chat/message list screen

## Project Structure

```text
lib/
├── main.dart
├── theme.dart
├── pages/
│   ├── account_page.dart
│   ├── cart_page.dart
│   ├── detail_page.dart
│   ├── detail_chat.dart
│   ├── home_page.dart
│   ├── list_chat.dart
│   └── login_page.dart
└── widgets/
    ├── cart_item_samples.dart
    ├── categories_widget.dart
    ├── home_app_bar.dart
    └── items_widget.dart
```

## Getting Started

### Prerequisites

- Flutter SDK installed and configured
- Android/iOS emulator or physical device for testing

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

### Run tests

```bash
flutter test
```

### Static analysis

```bash
flutter analyze
```

## Notes

This is a UI-focused rebuild and prototype rather than a full production commerce backend. The intention is to establish a strong visual foundation and mobile shopping experience that can later be extended with real data, authentication, checkout, and product APIs.
