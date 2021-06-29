//
//  OrderReferalView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 29/06/2021.
//

import SwiftUI

struct OrderReferalView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Referal program")
                .multilineTextAlignment(.center)
                .font(Font.title2.bold())
            
            Text("Free delivery, wehn you invite your friend.\nInvite a new friend and both of you will receive free delivery for 1 order.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(1)
            
            VStack {
                
                LargeBlackButton("Share", image: "", action: {})
                LargeBlackButton("Tweet", image: "", action: {})
                LargeBlackButton("Text", image: "", action: {})
                
            }
            
        }
        .padding(.top)
        .padding(.horizontal, 8)

    }
    
}

struct OrderReferalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderReferalView()
            .previewLayout(.fixed(width: 400, height: 320))

    }
}
