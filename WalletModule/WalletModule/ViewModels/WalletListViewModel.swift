//
//  WalletListViewModel.swift
//  WalletModule
//
//  Created by Almira Khafizova on 15.12.25.
//

import SwiftUI

final class WalletListViewModel: ObservableObject, TopBarViewModelProtocol {
  @Published var isLoading = false
  var navigationTitle: String = ""
  var navigationImage: String = ""
  var navigationSubtitle: String = ""
  var navigationBalance: String = ""
  
  @Published var allWallets: [WalletData] = []
  @Published var activeWallets: [WalletData] = []
  @Published var archivedWallets: [WalletData] = []
  
  func fetchMoneyboxes() {
    self.isLoading = true
    let url = APIEndpoints.getMoneyboxes
    
    NetworkManager.shared.fetch([WalletData].self, from: url) { [weak self] result in
      switch result {
      case .success(let wallets):
        DispatchQueue.main.async {
          self?.allWallets = wallets
          self?.filterWallets()
        }
      case .failure(let error):
        Logger.console.error("Error fetching moneyboxes: \(error.localizedDescription)")
      }
    }
  }
  
  func filterWallets() {
    activeWallets = allWallets.filter { !$0.wallet.isArchived }
    archivedWallets = allWallets.filter { $0.wallet.isArchived }
  }
}
