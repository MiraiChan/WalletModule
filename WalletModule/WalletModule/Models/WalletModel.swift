//
//  WalletModel.swift
//  WalletModule
//
//  Created by Almira Khafizova on 15.12.25.
//

import Foundation

struct WalletModel: Codable {
  let title: String?
  let currencyID: Int?
  let userID: String
  let isArchived: Bool
  let amount: Int
  let id: Int
  let goalIsAchieved: Bool
  let createdAt: String
  let updatedAt: String?
  
  enum CodingKeys: String, CodingKey {
    case title = "name"
    case currencyID = "currency_id"
    case userID = "user_id"
    case isArchived = "is_archived"
    case amount
    case id
    case goalIsAchieved = "goal_is_achieved"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
  }
}

// API Response
struct WalletData: Codable {
  let walletID: Int
  let toDate: String
  let goal: Int
  let id: Int
  let wallet: WalletModel
  
  enum CodingKeys: String, CodingKey {
    case walletID = "wallet_id"
    case toDate = "to_date"
    case goal
    case id
    case wallet
  }
}
