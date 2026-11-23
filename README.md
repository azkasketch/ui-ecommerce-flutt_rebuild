# Bakul Market

Bakul Market is a premium dark-first e-commerce storefront demo built with Flutter. The app combines lifestyle-brand storytelling, curated product browsing, and a smooth mobile shopping flow in a polished, modern interface.

## Overview

This project is designed to feel like a premium mobile commerce experience rather than a generic marketplace. The visual direction prioritizes editorial typography, luminous dark surfaces, soft pastel accents, and high-contrast product cards that make the storefront feel more premium and lifestyle-driven.

## Highlights

- dark luxury-first UI with warm editorial styling
- product-first home feed with curated cards and action buttons
- real product imagery via Unsplash network images
- add-to-bag interaction shared across home and detail screens
- checkout flow with fake payment selection
- paid order list for demo purchases
- profile area with personal branding and recent order state
- polished Material 3 styling and Google font pairing

## Design System

The app uses a refined design language based on:

- Instrument Serif for headlines and editorial moments
- Instrument Sans for body text, labels, and interface copy
- soft coral, mint, and lavender accents on a near-black base
- rounded cards, subtle shadows, and elevated surfaces for depth
- warm luxury palette balanced with playful retail energy

## Current Demo Flow

The app currently supports a practical storefront demo flow:

1. Login screen
2. Home browsing with product grid and category styling
3. Product detail view with CTA to add to bag
4. Bag/cart summary with live totals
5. Payment selection modal
6. Checkout confirmation and transition to orders
7. Orders list with purchase summary and item details

## Tech Stack

- Flutter
- Dart
- Material 3
- Google Fonts

## Project Structure

```text
lib/
├── cart_manager.dart
├── main.dart
├── models/
│   └── product.dart
├── order_manager.dart
├── pages/
│   ├── account_page.dart
│   ├── cart_page.dart
│   ├── detail_page.dart
│   ├── detail_chat.dart
│   ├── home_page.dart
│   ├── list_chat.dart
│   ├── login_page.dart
│   └── orders_page.dart
├── theme.dart
├── widget_previews.dart
└── widgets/
    ├── cart_item_samples.dart
    ├── categories_widget.dart
    ├── home_app_bar.dart
    └── items_widget.dart
```

## Getting Started

### Prerequisites

- Flutter SDK installed and configured
- Android emulator, iOS Simulator, or physical device

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

### Preview screens and components

The project includes Flutter Widget Preview entries for the login, home, product
detail, bag, profile, messages, conversation, orders, and order detail screens,
plus the product grid component.

```bash
flutter widget-preview start
```

In the previewer, browse the **Bakul Market / Screens** and
**Bakul Market / Components** groups. Some previews use remote product/profile
images and Google Fonts, so an internet connection is needed for those assets.

### Run tests

```bash
flutter test
```

### Static analysis

```bash
flutter analyze
```

## Notes

This is a UI-first e-commerce prototype and demo app, not a production backend system. The goal is to demonstrate a premium mobile shopping experience, interaction flow, and visual brand direction that can later be extended with authentication, real product APIs, persistent storage, and full checkout integration.
