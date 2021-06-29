//
//  NotificationApprovalView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 01/05/2021.
//

import SwiftUI

struct NotificationApprovalView: View {
    @EnvironmentObject private var mainObject: MainViewModel
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(.easeIn) {
                        mainObject.showNotificationApprovalView = false
                        mainObject.showLocationApprovalView.toggle()
                    }
                    
                }) {
                    Text("Skip")
                        .foregroundColor(.mainBlack)
                    
                }
                .padding([.top, .trailing])
            }

            OnboardingStepView(step: OnBoardingModel(image: Image("notifications"), title: "Allow Push Notifications", description: "IShop needs to send you notifications to keep you updated about discounts, coupons, etc."))
            Spacer()
            Button(action: {
                // Present Alert and Manage States
            }) {
                Text("Allow")
                    .fontWeight(.medium)
                    .largeButtonStyle()
            }
            .padding()
        }
    }
}

struct NotificationApprovalView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationApprovalView()
    }
}

