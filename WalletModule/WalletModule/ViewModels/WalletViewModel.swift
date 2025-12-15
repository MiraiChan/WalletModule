//
//  WalletViewModel.swift
//  WalletModule
//
//  Created by Almira Khafizova on 15.12.25.
//

import SwiftUI

final class WalletViewModel: ObservableObject {
  @Published var wallet: WalletModel
  @Published var progressValue: Double = 0.0
  @Published var title: String
  @Published var subtitle: String
  @Published var description: Text
  @Published var goalAchievedPercentage: String
  
  init(walletData: WalletData) {
    self.wallet = walletData.wallet
    self.title = walletData.wallet.title ?? ""
    // Temporary default values
    self.subtitle = ""
    self.description = Text("")
    self.goalAchievedPercentage = ""
    // Calculate values
    self.progressValue = calculateProgressValue(walletData: walletData)
    self.subtitle = createSubtitle(walletData: walletData)
    self.description = createDescription(walletData: walletData)
    self.goalAchievedPercentage = calculateGoalAchievedPercentage(walletData: walletData)
  }
  
  private func calculateProgressValue(walletData: WalletData) -> Double {
    guard walletData.goal > 0 else { return 0.0 } // Prevent division by zero
    return Double(walletData.wallet.amount) / Double(walletData.goal)
  }
  
  private func createSubtitle(walletData: WalletData) -> String {
    let remaining = walletData.goal - Int(walletData.wallet.amount)
    
    let dateString = walletData.toDate + "T00:00:00.000Z"
    if let parsedToDate = DateUtils.parseISO8601Date(dateString) {
      let createdAt = DateUtils.parseISO8601Date(walletData.wallet.createdAt) ?? Date()
      let remainingMonths = Calendar.current.dateComponents([.month], from: createdAt, to: parsedToDate).month ?? 0
      if remainingMonths > 0 {
        let monthlyPayment = remaining / remainingMonths
        let toDate = DateUtils.formatDate(parsedToDate, format: "dd.MM.yyyy")
        return "\(monthlyPayment) \(ConstantsString.sumPerMonth) \(ConstantsString.till) \(toDate)"
      }
    }
    // If the above conditions are not met, return an empty string.
    return ""
  }
  
  private func createDescription(walletData: WalletData) -> Text {
    // swiftlint:disable:next line_length
    let amountText = Text("\(String(walletData.wallet.amount)) \(ConstantsString.currencySign)").foregroundColor(Styles.Surfaces.purpleSecondary)
    // swiftlint:disable:next line_length
    return Text("\(ConstantsString.saved) \(amountText) \(ConstantsString.from) \(String(walletData.goal)) \(ConstantsString.currencySign)").foregroundColor(Color.white)
  }
  
  private func calculateGoalAchievedPercentage(walletData: WalletData) -> String {
    return String(format: "%.0f%%", calculateProgressValue(walletData: walletData) * 100)
  }
}
