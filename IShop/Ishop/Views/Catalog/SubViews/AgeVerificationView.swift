//
//  AgeVerificationView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 27/06/2021.
//

import SwiftUI

struct AgeVerificationView: View {
    @EnvironmentObject var mainModel: MainViewModel
    var body: some View {
        VStack {
            Text("18+")
                .font(Font.system(size: 50, weight: .bold))
            Text("You confirm that you\nare over 18 years old.")
                .multilineTextAlignment(.center)
                .font(Font.title2.bold())
            
            Text("Some products are available to get only with documents confirming the age.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .layoutPriority(1)
            
            VStack {
                LargePrimaryButton("Yes, I'm already 18", action: {
                    mainModel.showAgeVerificationView.toggle()
                })
                LargePrimaryButton("No, I'm under 18", action: {
                    mainModel.showAgeVerificationView.toggle()
                })

            }
            .padding(.horizontal, 8)
                
        }
        .padding(.top)
    }
}

struct AgeVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        AgeVerificationView()
            .previewLayout(.fixed(width: 400, height: 400))
        
//        IBottomSheetView(initialOffsetY: 300, showCard: .constant(true)) {
//            AgeVerificationView()
//        }
    }
}
