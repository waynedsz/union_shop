# Union Shop

[![Flutter](https://img.shields.io/badge/Flutter-3.13-blue.svg)](https://flutter.dev)

**Author:** waynedsz
**Project Type:** E-commerce Mobile App (Flutter)

---

## Table of Contents

* [Project Overview](#project-overview)
* [Features](#features)
* [Project Structure](#project-structure)
* [Installation](#installation)
* [How It Works](#how-it-works)
* [Dependencies](#dependencies)
* [Testing](#testing)
* [License](#license)

---

## Project Overview

Union Shop is a Flutter-based e-commerce mobile application designed to provide a seamless shopping experience. The application showcases products, allows users to manage their cart, browse collections, and navigate through different pages such as Home, Product Details, Cart, and Collections. It includes reusable components for headers, footers, and product displays to ensure consistent UI across the app.

This project demonstrates a modular architecture with provider-based state management for the shopping cart.

---

## Features

* **Home Screen**: Hero section, featured collections, and navigation to collections.
* **Collection Page**: Displays products in a grid layout with sorting and filtering options.
* **Product Page**: Product details, price, category, and description.
* **Cart Page**: Add, increment, decrement, and remove products. Displays total price dynamically.
* **Reusable Components**:

  * `Header` and `Footer` widgets for consistent navigation and branding.
  * `ProductTile`, `ProductCard`, and other modular widgets for product display.
* **State Management**: Provider used for cart state (`CartState`).
* **Responsive Design**: Layouts adapt to different screen sizes.

---

## Project Structure

```
union_shop/
├─ lib/
│  ├─ pages/
│  │  ├─ home_screen.dart
│  │  ├─ cart_page.dart
│  │  ├─ collection_page.dart
│  │  ├─ product_page.dart
│  │  └─ ... (other screens)
│  ├─ reusable_content/
│  │  ├─ cart_widgets/       # Cart-related widgets
│  │  ├─ product_widgets/    # Product display widgets
│  │  ├─ collection_widgets/ # Collection cards/grids
│  │  ├─ home_screen_widgets # Hero, featured collections
│  │  └─ header.dart, footer.dart
│  └─ main.dart
├─ assets/
│  ├─ images/
│  │  ├─ products/
│  │  ├─ collections/
│  │  └─ homepage/
├─ test/
│  ├─ pages/
│  │  ├─ cart_page_test.dart
│  │  ├─ home_screen_test.dart
│  │  ├─ collection_page_test.dart
│  │  └─ ...
│  └─ reusable_content/
├─ pubspec.yaml
└─ README.md
```

---

## Installation

1. **Clone the repository**:

```bash
git clone https://github.com/waynedsz/union_shop.git
cd union_shop
```

2. **Install dependencies**:

```bash
flutter pub get
```

3. **Run the application**:

```bash
flutter run
```

> Ensure you have Flutter installed (version 3.13 or higher recommended) and a connected device or emulator.

---

## How It Works

1. **Navigation**: The app uses `MaterialApp` routing to navigate between pages. The `Header` widget provides top-level navigation to Home, Collections, Login, and Cart.
2. **Product Display**: Products are displayed using reusable `ProductTile` or `ProductCard` widgets, with dynamic data passed from collections or backend API.
3. **Cart Management**: Using Provider (`CartState`), the cart tracks product quantities, total prices, and updates UI reactively.
4. **Responsive Layouts**: Widgets such as `GridView` and `ListView` are used to ensure content scales correctly across devices.

---

## Dependencies

Key dependencies in `pubspec.yaml`:

* `flutter`
* `provider` (state management)
* `cupertino_icons`

---

## Testing

This project includes widget tests for key pages:

* **Home Screen**: Verifies header, hero section, collections, and footer render correctly.
* **Collection Page**: Tests grid display, dropdown selection, and product tap functionality.
* **Cart Page**: Tests cart item display, increment/decrement functionality, and total price updates.

Run tests using:

```bash
flutter test
```

---

## License

This project is open source and available under the MIT License.

---

**Union Shop** aims to demonstrate a clean, modular Flutter e-commerce app with best practices for reusable components and state management.
