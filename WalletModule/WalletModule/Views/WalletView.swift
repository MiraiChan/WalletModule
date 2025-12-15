//
//  WalletView.swift
//  WalletModule
//
//  Created by Almira Khafizova on 15.12.25.
//

import SwiftUI

struct WalletView: View {
  
  @State private var switchValue = ConstantsString.categoryActive
  @StateObject private var walletListViewModel = WalletListViewModel()
  @StateObject private var mainCoordinator = MainCoordinator(rootCoordinator: RootCoordinator())
  
  var body: some View {
    ZStack {
      Styles.Surfaces.purple.ignoresSafeArea()
      ZStack {
        BackgroundShapeView()
        if walletListViewModel.isLoading {
          SplashLoaderView()
        } else {
          VStack {
            VStack {
              CustomSwitch(someInfo: $switchValue, info: [ConstantsString.categoryActive, ConstantsString.categoryArchive])
                .padding(Space.medium)
              
              ScrollView {
                
                Spacer()
                if switchValue == ConstantsString.categoryActive {
                  ForEach(walletListViewModel.activeWallets, id: \.wallet.id) { walletData in
                    WalletCustomCard(viewModel: WalletViewModel(walletData: walletData))
                      .padding(.horizontal)
                  }
                } else {
                  ForEach(walletListViewModel.archivedWallets, id: \.wallet.id) { walletData in
                    WalletCustomCard(viewModel: WalletViewModel(walletData: walletData))
                      .padding(.horizontal)
                  }
                }
              }
            }
            
            CustomButton(
              buttonText: ConstantsString.addGoal,
              isWide: true,
              foregroundColor: Styles.Surfaces.purpleSecondary,
              backgroundColor: Styles.Surfaces.graySecondary,
              overlayColor: Styles.Surfaces.purpleSecondary,
              action: { mainCoordinator.push(page: .addGoal) }
            )
            .padding(.bottom, 75)
          }
          CustomBackButton()
        }
      }
      .padding(.top, Space.big)
    }
  }
}

#Preview() {
  WalletView()
    .environmentObject(MainCoordinator(rootCoordinator: RootCoordinator()))
    .environmentObject(WalletListViewModel())
}
