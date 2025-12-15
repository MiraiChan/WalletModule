//
//  WalletCustomCard.swift
//  WalletModule
//
//  Created by Almira Khafizova on 15.12.25.
//

import SwiftUI

struct WalletCustomCard: View {
  @ObservedObject var viewModel: WalletViewModel
  
  var body: some View {
    VStack {
      HStack {
        ZStack {
          Circle()
            .stroke(Styles.Colors.disabled, lineWidth: LineSizes.tiny)
            .frame(width: FrameSize.medium.width, height: FrameSize.medium.height)
          Circle()
            .trim(from: TrimConstants.trimStart, to: viewModel.progressValue)
            .stroke(style: StrokeStyle(lineWidth: LineSizes.tiny, lineCap: .round, lineJoin: .round))
            .frame(width: FrameSize.medium.width, height: FrameSize.medium.height)
            .foregroundColor(Styles.Surfaces.purpleMain)
            .rotationEffect(.degrees(RotationDegree.forProgressCircle))
          Text(viewModel.goalAchievedPercentage)
            .font(Styles.Typography.labelSmall)
            .foregroundColor(Styles.Colors.bright)
        }
        .offset(y: OffsetConstants.yOffset)
        VStack(alignment: .leading) {
          Text(viewModel.title)
            .font(Styles.Typography.labelMedium)
            .foregroundColor(Styles.Colors.bright)
            .padding(.bottom, Space.micro)
          Text(viewModel.subtitle)
            .font(Styles.Typography.labelXSmall)
            .foregroundColor(Styles.Colors.secondary)
            .padding(.bottom, Space.small)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, Space.small)
      }
      Divider().background(Styles.Surfaces.darkGray)
        .frame(height: FrameSize.micro.height)
      HStack {
        viewModel.description
          .font(Styles.Typography.titleSmall)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.top, Space.ultraSmall)
          .padding(.bottom, Space.ultraSmall)
      }
    }
    .padding(Space.small)
    .background(Styles.Surfaces.graySecondary)
    .cornerRadius(CornerRadius.intermediate)
    .padding(.horizontal, Space.interSmall)
  }
}

struct WalletCustomCard_Previews: PreviewProvider {
  static var previews: some View {
    WalletCustomCard(viewModel: WalletViewModel(walletData: WalletData(
      walletID: 0,
      toDate: "",
      goal: 0,
      id: 0,
      wallet: WalletModel(
        title: "",
        currencyID: 0,
        userID: "",
        isArchived: false,
        amount: 0,
        id: 0,
        goalIsAchieved: false,
        createdAt: "",
        updatedAt: ""
      )
    )))
    .previewLayout(.sizeThatFits)
  }
}
