# E-Commerce Product Catalog Application

## Overview
The E-Commerce Product Catalog is a modern Flutter application implementing Clean Architecture with the BLoC pattern for state management. This application showcases a responsive product grid with features such as infinite scroll pagination, pull-to-refresh, smooth animations, offline support, and more. Additionally, it includes product details, a wishlist functionality, and search & filter capabilities.

## Features

### Core Features

#### Product Grid:
- Responsive layout with a gridview.
- Infinite scroll pagination for seamless navigation.
- Pull-to-refresh for updating product lists.
- Error handling with retry functionality.

#### Product Details:
- Full-screen image carousel with smooth hero transitions.
- Floating action button for adding/removing products to/from the wishlist.
- Expandable product description with specifications displayed in a table.
- Share functionality for easy sharing of product details.

#### Search & Filter:
- Search functionality with debouncing.
- Category filtering.
- Price range filtering.
- Sorting by price or name.

#### Offline Support:
- Products are cached locally using Hive for offline viewing.
- Syncing functionality for data when the application goes online.

## Technical Stack
- **Flutter**: Cross-platform framework for building beautiful, natively compiled applications.
- **BLoC**: State management solution for handling business logic.
- **Hive**: Lightweight local storage for caching product data.
- **get_it**: Dependency injection for managing dependencies efficiently.


## Architecture
### Clean Architecture
The application adheres to Clean Architecture principles:
- **Presentation Layer**: Manages the UI and user interactions using the BLoC pattern.
- **Domain Layer**: Contains business logic and core functionalities.
- **Data Layer**: Responsible for managing the data models, repositories and services.

### BLoC Pattern
The state management is achieved using the BLoC (Business Logic Component) pattern:
- Events trigger state changes.
- States represent the current state of the application.
- Repositories handle data persistence and API calls.

## Screenshots


## Getting Started

### Prerequisites
- Flutter SDK installed
- Dart SDK installed

### Installation
1. Clone the repository:
   git clone https://github.com/your-username/ecommerce-product-catalog.git
   cd ecommerce-product-catalog
