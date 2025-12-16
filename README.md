# WalletModule (SwiftUI + MVVM) 
This Wallet module is part of a larger private project "Budget" hosted on GitLab.

## Notes:
• The code here is extracted for demonstration purposes and does not include any sensitive data or API keys.<br>
• The full project is private and cannot be shared publicly.<br>
• This module shows architecture, MVVM implementation for displaying and managing financial goals and SwiftUI usage.<br>
• Networking is demonstrated via WalletListViewModel.fetchMoneyboxes() (API layer stubbed).<br>

## Features
• Display active and archived wallets with a toggle switch.<br>
• ❗Show wallet progress, including saved amount vs. goal.<br>
• ❗Calculate monthly payments and goal completion percentage.<br>
• Add new goals with a button navigating via MainCoordinator.<br>
• Fully reactive SwiftUI views updated via @StateObject and @Published.<br>

## Architecture
MVVM Pattern<br>
• WalletView — Main SwiftUI view displaying the list of wallets and UI elements.<br>
• WalletListViewModel — Handles fetching and filtering wallets, exposes activeWallets and archivedWallets.<br>
• WalletViewModel — Prepares data for individual wallet cards (progress, subtitle, description).<br>
• WalletCustomCard — UI component rendering a single wallet's progress and information.<br>

Model Layer<br>
• WalletModel — Represents a wallet from the API.<br>
• WalletData — Wrapper with goal, target date, and wallet information.<br>

## Usage
```swift
// Preview example
WalletView()
    .environmentObject(MainCoordinator(rootCoordinator: RootCoordinator()))
    .environmentObject(WalletListViewModel())
```
WalletView automatically reacts to changes in WalletListViewModel.<br>
Each WalletCustomCard uses a WalletViewModel to render wallet-specific data.


## Technology Stack
Language: Swift<br>
UI Framework: SwiftUI<br>
Architecture: MVVM (Model-View-ViewModel)<br>
Reactive Programming: Combine (@Published, @StateObject, @ObservedObject)<br>
Networking: URLSession / NetworkManager (stubbed in this module)<br>
Data Models: Codable structs (WalletModel, WalletData)<br>
Dependency Management: None in this module (part of a larger Swift project)<br>
Platform: iOS (supports previews via SwiftUI)<br>
## Screenshots

Budget categories and wallets<img width="1099" height="666" alt="Budget categories and piggy banks" src="https://github.com/user-attachments/assets/40e3b0b0-57f8-4dd9-83c1-45e87d598879" />

Wallets in progress<br>
![Wallets in progress](https://github.com/user-attachments/assets/5c863ddb-3fff-4dc0-83f3-c24f952a9c76)
