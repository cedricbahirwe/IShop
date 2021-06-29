//
//  SocialMediaReferalView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 29/06/2021.
//

import SwiftUI

struct SocialMediaReferalView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Share on social media")
                .multilineTextAlignment(.center)
                .font(Font.title2.bold())
            
                
                LargeBlackButton("Facebook", image: "", action: {})
                LargeBlackButton("Tweet", image: "", action: {})
                LargeBlackButton("Whatsapp", image: "", action: {})
        }
        .padding(.top)
        .padding(.horizontal, 8)
    }
}

struct SocialMediaReferalView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaReferalView()
            .previewLayout(.fixed(width: 400, height: 320))
    }
}
