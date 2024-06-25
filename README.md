
# Top-Up App

Welcome to the Top-Up App! This Flutter application is designed to manage top-up beneficiaries and execute top-up transactions. The app follows the principles of Clean Architecture and the BLoC (Business Logic Component) design pattern to ensure a robust, maintainable, and testable codebase.

## Table of Contents

- [Screens and Features](#screens-and-features)
- [Architecture](#architecture)
- [BLoC Design Pattern](#bloc-design-pattern)
- [Getting Started](#getting-started)
- [Running the App](#running-the-app)
- [Contributing](#contributing)
- [Demo](#demo)

## Screens and Features

1. **Home Page**
   - Displays a list of beneficiaries.
   
2. **Top-Up Page**
   - Allows users to select an available top-up option and initiate a top-up transaction for a selected beneficiary.

3. **Summary Page**
   - Shows a summary of the transaction before completion.

4. **Success Page**
   - Confirms the successful top-up transaction.

## Architecture

This application is built using **Clean Architecture**, which divides the project into three main layers:

1. **Presentation Layer**: Contains UI code and widgets. This layer depends on the BLoC components to retrieve data and handle events.
2. **Domain Layer**: Contains business logic and domain entities. It includes use cases that encapsulate specific business rules.
3. **Data Layer**: Responsible for data retrieval from various sources (e.g., network, database). It implements the repositories defined in the domain layer.

### Diagram

```plaintext
Presentation Layer
    ├── UI (Widgets, Screens)
    └── BLoC (State Management)
Domain Layer
    ├── Entities
    ├── Use Cases
    └── Repositories (Interfaces)
Data Layer
    ├── Repositories (Implementations)
    └── Data Sources (Remote, Local)
```

## BLoC Design Pattern

The **BLoC** (Business Logic Component) pattern is used to manage state and business logic separately from the UI. BLoC components act as intermediaries between the presentation layer and the domain layer, handling all the business logic and state management.

### Key Components

- **Bloc**: Contains the business logic.
- **Event**: Represents an action or intent (e.g., `LoadBeneficiaries`, `InitiateTopUp`).
- **State**: Represents the current state of the UI (e.g., `LoadedState`, `LoadingState`, `ErrorState`).

### Example Flow

1. **Event**: User taps on a beneficiary to initiate a top-up.
2. **Bloc**: The event is captured and processed by the Bloc, which calls the relevant use case in the domain layer.
3. **Use Case**: Executes the business logic, retrieves necessary data, and returns the result.
4. **Bloc**: Updates the state based on the result of the use case.
5. **State**: The UI reacts to the new state and updates accordingly.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/MustafaSaify/top_up.git
   cd top_up
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

## Running the App

1. Connect a device or start an emulator.
2. Run the app:

   ```bash
   flutter run
   ```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch:

   ```bash
   git checkout -b feature-name
   ```

3. Make your changes.
4. Commit your changes:

   ```bash
   git commit -m "Description of changes"
   ```

5. Push to the branch:

   ```bash
   git push origin feature-name
   ```

6. Open a pull request.

## Demo
![](demo/app-demo.gif)

