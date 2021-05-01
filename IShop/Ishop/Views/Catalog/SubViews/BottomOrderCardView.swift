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
                
                HStack {
                    Image(systemName: "cart.fill")
                    Text("3 products")
                    Spacer()
                    
                    Text("$45.5")
                }
                .font(Font.callout.weight(.semibold))
                .padding()
                .foregroundColor(.mainBackground)
                .background(Color.mainDark)
                .cornerRadius(8)
            }
            .padding(.horizontal, 10)

            Spacer( )
        }
        .padding(.top, 8)
        .frame(maxWidth: .infinity)
        .background(Color(.tertiarySystemBackground))
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}


struct BottomOrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomOrderCardView()
    }
}
