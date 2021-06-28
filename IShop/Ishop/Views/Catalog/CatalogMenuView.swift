//
//  CatalogMenuView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 28/06/2021.
//

import SwiftUI

struct CatalogMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("IShop")
                .font(Font.largeTitle.bold())
                .padding(.top, 25)
            
            Group {
                MenuOption(title: "John Doe",
                           subtitle: "My account") {}
                
                MenuOption(title: "My orders", action: { })
                MenuOption(title: "My wallet", action: { })
                MenuOption(title: "Refer a friend", action: { })
                MenuOption(title: "About IShop", action: { })
                MenuOption(title: "My orders", action: { })
                MenuOption(title: "Logout", action: { })
            }
            Spacer()
            Text("Get paid to help deliver the products our customers want.")
                .font(.callout)
            LargePrimaryButton("Drive for IShop", action: {})
                .padding(-10)
            HStack {
                // Social Media
            }
            
            .padding(.bottom, 50)
        }
        .padding(10)
    }
}

struct CatalogMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogMenuView()
//            .previewLayout(.fixed(width: 250, height: 800))
    }
}

fileprivate struct MenuOption: View {
    init(title: String, subtitle: String? = nil, action: @escaping() -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }
    
    let title: String
    let subtitle: String?
    let action: () -> Void
    private let icon: String? =  "square.split.diagonal.2x2"
    var body: some View {
        Button(action: action) {
            HStack(alignment: subtitle == nil ? .center : .top) {
                Image(systemName: icon!)
                    .frame(width: 20, height: 20)
                    .padding(.bottom, 5)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.footnote)
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding(.bottom, 8)
                .overlay(
                    Color.secondary.frame(height: 0.5)
                    , alignment: .bottom
                )
            }
            .padding(.top, 5)
        }
        .accentColor(.primary)
    }
}
