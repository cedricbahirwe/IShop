//
//  FirendReferalView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 29/06/2021.
//

import SwiftUI

struct FirendReferalView: View {
    let profileLink = "https://github.com/cedricbahirwe"
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            TopNavigationHeaderView(title: "Refer a friend")
            
            VStack(alignment: .leading, spacing: 10) {
                ImagePlaceHolder()
                    .frame(height: size.height/5)
                    .frame(maxWidth: .infinity)
    
                
                Text("The gift that keeps\non giving")
                    .font(Font.title.bold())
                    .layoutPriority(3)
                VStack(alignment: .leading,spacing: 0) {
                    Text("Earn promo credits when a friend makes")
                    HStack {
                        Text("their first purchase.")
                        Link("See details",
                             destination:
                                URL(string: profileLink)!)
                    }
                }
                
                VStack(alignment: .leading) {
                    ReferalInfoView(title: "You get $10",
                                    subtitle: "Minimum order $15")
                    ReferalInfoView(title: "They get $10",
                                    subtitle: "First order - minum $15")
                    
                }
                
                Text(profileLink.rot13())
                    .foregroundColor(.secondary)
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.lightGray)
                    .cornerRadius(10)
                
                LargeBlackButton("Copy link", action: copyLink)
                LargePrimaryButton("Share on social media", action: {})
            }
            .padding(10)
            Spacer()
        }
    }
    
    private func copyLink() {
        let pasteboard = UIPasteboard.general
        pasteboard.string = profileLinkx
    }
}

struct FirendReferalView_Previews: PreviewProvider {
    static var previews: some View {
        FirendReferalView()
    }
}

fileprivate struct ReferalInfoView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "person")
                .imageScale(.large)
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                Text(subtitle)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .padding(.bottom, 10)
            .overlay(
                Color.secondary.frame(height: 0.5), alignment: .bottom)
            .padding(.vertical, 5)
        }
    }
}
