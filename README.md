# BankViewer

A modern iOS banking application built with SwiftUI that allows users to view their bank accounts and transaction history with a clean, intuitive interface.

## 📱 Features

### Account Management
- **Account List**: View all your bank accounts with balance information
- **Account Details**: See account name, balance, currency, and description
- **Pull-to-Refresh**: Refresh account data with a simple swipe gesture
- **Infinite Scrolling**: Load more accounts as you scroll through the list

### Transaction History
- **Transaction List**: Browse through your transaction history
- **Transaction Details**: View transaction amounts, dates, sender/receiver information
- **Interactive Charts**: Visual representation of transaction data
- **Search & Filter**: Find specific transactions easily

### User Experience
- **Modern UI**: Clean, intuitive interface built with SwiftUI
- **Responsive Design**: Optimized for different iOS device sizes
- **Loading States**: Smooth loading indicators and error handling
- **Custom Styling**: Beautiful color scheme and typography

## 🏗️ Architecture

The project follows **Clean Architecture** principles with a modular structure:

```
BankViewer/
├── Features/
│   ├── AccountsList/          # Account management feature
│   │   ├── Data/             # Data layer (API, DTOs, Converters)
│   │   ├── Domain/           # Business logic (Entities, Use Cases)
│   │   ├── Presentation/     # UI layer (Views, ViewModels)
│   │   └── DI/              # Dependency injection
│   └── Transactions/         # Transaction management feature
│       ├── Data/            # Data layer
│       ├── Domain/          # Business logic
│       ├── Presentation/    # UI layer
│       └── DI/             # Dependency injection
├── Networking/              # Network layer
├── UI/                     # Reusable UI components
├── DI/                     # Dependency injection container
└── Resources/              # Assets and resources
```

### Key Components

- **Clean Architecture**: Separation of concerns with Data, Domain, and Presentation layers
- **MVVM Pattern**: Model-View-ViewModel for UI components
- **Dependency Injection**: Centralized dependency management
- **Repository Pattern**: Abstract data access layer
- **Use Case Pattern**: Business logic encapsulation

## 🛠️ Technical Stack

- **Language**: Swift 5.0+
- **Framework**: SwiftUI
- **Architecture**: Clean Architecture + MVVM
- **Dependency Injection**: Custom DI container
- **Networking**: Custom networking layer
- **Minimum iOS Version**: iOS 18.0+

## 📦 Installation

### Prerequisites
- Xcode 16.0 or later
- iOS 18.0+ deployment target
- macOS 15.0+ (for development)

### Setup
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd BankViewer
   ```

2. Open the project in Xcode:
   ```bash
   open BankViewer.xcodeproj
   ```

3. Build and run the project:
   - Select your target device or simulator
   - Press `Cmd + R` to build and run

## 🚀 Usage

### Running the App
1. Launch the app on your iOS device or simulator
2. The app will display your bank accounts list
3. Tap on any account to view its transaction history
4. Use pull-to-refresh to update data
5. Scroll through accounts and transactions with infinite loading

### Key Interactions
- **Swipe Down**: Refresh account/transaction data
- **Tap Account**: Navigate to transaction history
- **Scroll**: Load more content automatically
- **Back Button**: Return to previous screen

## 🎨 UI Components

### Custom Components
- **AccountCardView**: Displays account information in a card format
- **TransactionCardView**: Shows transaction details
- **ChartView**: Interactive charts for transaction visualization

### Design System
- **Colors**: Custom color palette with background, primary, and secondary colors
- **Typography**: Consistent font usage throughout the app
- **Spacing**: Standardized padding and margins
- **Icons**: Custom app icon and accent colors

## 🔧 Configuration

### API Configuration
The app uses a custom networking layer that can be configured for different API endpoints. Update the networking configuration in the `Networking` module to connect to your banking API.

### Dependency Injection
All dependencies are managed through the `DIAssembler` and `DIContainer` classes. New features can be easily integrated by following the existing pattern.

## 📁 Project Structure

### Core Modules
- **BankViewerApp**: Main app entry point and flow coordination
- **Features**: Feature modules following Clean Architecture
- **Networking**: Network layer for API communication
- **UI**: Reusable UI components
- **DI**: Dependency injection system

### Feature Modules
Each feature module contains:
- **Data Layer**: API calls, DTOs, data converters
- **Domain Layer**: Business entities, use cases, repositories
- **Presentation Layer**: SwiftUI views and view models
- **DI**: Feature-specific dependency injection

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow Clean Architecture principles
- Use MVVM pattern for UI components
- Implement proper error handling
- Add unit tests for business logic
- Follow Swift coding conventions

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Anastasia Kutniakhova** - *Initial work* - [GitHub Profile]

## 🙏 Acknowledgments

- SwiftUI framework for modern iOS development
- Clean Architecture principles for maintainable code
- The iOS development community for best practices

## 📞 Support

If you encounter any issues or have questions about the project, please:
1. Check the existing issues in the repository
2. Create a new issue with detailed information
3. Contact the development team

---

**Note**: This is a demo banking application. For production use, ensure proper security measures, API authentication, and compliance with banking regulations.
