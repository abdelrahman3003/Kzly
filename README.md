# KZLY System

## Table of Contents
1. [Introduction](#introduction)
2. [Stakeholders](#stakeholders)
3. [Analysis](#analysis)
4. [Best Practices for Flutter and GetX](#best-practices)
5. [Project Structure](#project-structure)
6. [Prototype and Screens](#prototype-and-screens)
6. [Build for Release](#build-for-release)

---

## Introduction <a name="introduction"></a>

### Background and Motivation
The KZLY System emerges from the necessity to provide a comprehensive platform supporting the fields of plants and flowers.

### Problem Statement
Current tools lack accessibility and user-friendliness, hindering individuals, businessmen, and merchants from achieving their goals. Key challenges include:
- Data Accessibility and Interpretation
- Custom Analysis
- Visualization and Understanding
- Decision Support

### Objectives
1. Develop a User-Centric Interface
2. Integrate Interactive Data Visualization Tools
3. Curate Region-Specific Services
4. Implement Parameter Selection Mechanism
5. Provide application that accommodates different users
6. Generate system with high usability

### Project Scope and Limitations
The application aims to provide specific functionalities related to flowers, serving various users from customers to suppliers, florists, coaches, and more.

## Stakeholders

- Business Owners
- Project Manager
- UI/UX Designers
- Development Team (Frontend and backend developers)
- Users (customer, supplier, florist, coach, Admin)

## Analysis <a name="analysis"></a>

### Functional Requirements
- User registration and Authentication
- Browse, Search, and Filter products
- Flower Details and Images
- Shopping Cart and Checkout
- Order Management
- Add to Favorite and Check Favorite
- Reminders for Notifications
- Region and Country Selection
- More Services (Courses, Coaches, Florists)
- Profile Management for various users

### Non-Functional Requirements
1. Usability
2. Robustness
3. Reliability
4. Performance
5. Security
6. Authentication
7. Assumptions

### System Scenarios
- Home page Main page
- First Scenario: Garden Module
- Second Scenario: Courses Module
- Third Scenario: Florist Module
- Fourth Scenario: Coach Module
- Fifth Scenario: Supplier Module
- Sixth Scenario: Join Us Module

## Best Practices for Flutter and GetX <a name="best-practices"></a>

- **Flutter Best Practices:**
  - Follow the Flutter team's recommended project structure for better organization.
  - Utilize StatelessWidget for static UI components and StatefulWidget for dynamic UI components.
  - Implement efficient state management techniques such as Provider, Riverpod, or Bloc pattern.
  - Optimize performance by minimizing widget rebuilds using const constructors and the const keyword.
  - Use Flutter's built-in widgets and plugins for common functionalities to ensure compatibility and stability.
  - Utilize Flutter's hot reload feature for faster development iterations.
  - Write concise and readable code following Dart's best practices and guidelines.

- **GetX Best Practices:**
  - Leverage GetX's reactive state management for efficient and scalable application development.
  - Utilize GetBuilder and Obx widgets for reactive UI updates based on state changes.
  - Take advantage of GetX's dependency injection system for managing dependencies and services.
  - Utilize GetX's named routes and route management for navigation within the application.
  - Use GetX's internationalization (i18n) support for multi-language applications.
  - Implement error handling and logging using GetX's built-in features for better debugging and maintenance.
  - Follow GetX's documentation and community guidelines for utilizing additional features and best practices.

## Project Structure <a name="project-structure"></a>

```plaintext
project_root
|-- main_dev.dart
|-- main_prod.dart
|-- gen
|   |-- assets.gen.dart
|   |-- README.md
|-- models
|-- controllers
|-- helpers
|   |-- api_helpers.dart
|   |-- assets.dart
|   |-- routes.dart
|   |-- validation.dart
|   |-- localization
|-- views
|   |-- themes
|   |-- widgets
|-- pages
```


## Prototype and Screens <a name="prototype-and-screens"></a>
*(Coming Soon...)*

## Build for Release <a name="build-for-release"></a>
Command to build for release:
``` flutter build appbundle -t lib/main_prod.dart ```

---

This README serves as a comprehensive guide for the KZLY System, outlining its objectives, scope, stakeholders, analysis, best practices for Flutter and GetX, and prototype. For further details, refer to the corresponding sections.
