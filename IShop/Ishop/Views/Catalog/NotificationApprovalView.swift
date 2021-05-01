//
//  NotificationApprovalView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 01/05/2021.
//

import SwiftUI

struct NotificationApprovalView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {}) {
                    Text("Skip")
                        .foregroundColor(.mainBlack)
                    
                }
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
        }
        .padding()
    }
}

struct NotificationApprovalView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationApprovalView()
    }
}

struct LargeButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.mainBackground)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.mainBlack)
    }
}

extension View {
    func largeButtonStyle() -> some View {
        ModifiedContent(content: self, modifier: LargeButtonStyle())
    }
}
