//
//  BottomOrderCardView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 02/05/2021.
//

import SwiftUI

struct BottomOrderCardView: View {
    var body: some View {
        VStack(spacing: 10) {
            Rectangle().frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("Current order")
                .font(Font.headline.bold())
            
            Divider()
            VStack {
                
                CheckoutBannerView(icon: "cart.fill",
                                   title: "3 products",
                                   price: "$45.5")
            }
            .padding(.horizontal, 10)
            
            Spacer( )
        }
        .padding(.top, 8)
    }
}


struct BottomOrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        IBottomSheetView(showCard: .constant(true)) {
            BottomOrderCardView()
        }
    }
}


struct CheckoutBannerView: View {
    let icon: String
    let title: String
    let price: String
    var body: some View {
        HStack {
            Image(systemName:icon)
            Text(title)
            Spacer()
            
            Text(price)
        }
        .font(Font.callout.weight(.semibold))
        .padding()
        .foregroundColor(.mainBackground)
        .background(Color.mainDark)
        .cornerRadius(8)
    }
}
