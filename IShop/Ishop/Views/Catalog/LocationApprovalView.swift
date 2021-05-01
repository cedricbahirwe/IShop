//
//  LocationApprovalView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 01/05/2021.
//

import SwiftUI

struct LocationApprovalView: View {
    @EnvironmentObject private var mainObject: MainViewModel
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    mainObject.showLocationApprovalView = false
                    mainObject.goToMainCatalog = true
                }) {
                    Text("Skip")
                        .foregroundColor(.mainBlack)
                    
                }
                .padding([.top, .trailing])
            }
            
            OnboardingStepView(step: OnBoardingModel(image: Image("location"), title: "Allow Location services", description: "IShop needs to send you notifications to keep you updated about discounts, coupons, etc."))
            
            
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

struct LocationApprovalView_Previews: PreviewProvider {
    static var previews: some View {
        LocationApprovalView()
    }
}
