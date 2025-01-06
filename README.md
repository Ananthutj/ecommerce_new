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
<img src="https://github.com/user-attachments/assets/79556244-00ec-4a98-b2b3-d98e534bef09" width="300" />

<img src="https://github.com/user-attachments/assets/c24511af-2355-4153-bb4d-f79516a464d5" width="300" />

<img src="https://github.com/user-attachments/assets/24e63f5f-d3d8-4bdf-8204-262e42c286a4" width="300" />

<img src="https://github.com/user-attachments/assets/03a6027b-068b-450f-9dcf-17c290a30d95" width="300" />

<img src="https://github.com/user-attachments/assets/11a927dc-c3a0-49c9-8547-adc2808cdb14" width="300" />

<img src="https://github.com/user-attachments/assets/b1e7fcc9-b473-4c99-9fe7-eb8937d9cfa5" width="300" />

<img src="https://github.com/user-attachments/assets/1991e7e9-7f13-4b9d-9a0d-bbf8608c704c" width="300" />


## Getting Started

### Prerequisites
- Flutter SDK installed
- Dart SDK installed

### Installation
Clone the repository:
   git clone https://github.com/Ananthutj/ecommerce_new.git
