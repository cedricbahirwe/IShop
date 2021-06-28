//
//  CatalogMenuView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 28/06/2021.
//

import SwiftUI

struct CatalogMenuView: View {
    
    @State private var isAuthorized: Bool = true
    
    
    init() {
        UISwitch.appearance().tintColor = .red
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("IShop")
                    .font(Font.largeTitle.bold())
                Spacer()
                Toggle("", isOn: $isAuthorized.animation())
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: Color.primary))

            }
            .padding(.top, 25)
            .padding(.bottom)

            if isAuthorized {
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
            } else {
                Text("Sign in to see account details")
                    .font(.callout)
                LargePrimaryButton("Sign In", action: {})

                Spacer()
                Text("Get $10 Give $10").bold()
                Text("Sign up now and refer a friend.\nYou will get $10 and give them $10 when they complete their first order.")
                    .font(.footnote)
                LargePrimaryButton("Sign Up Now", action: {})
                
                
            }
            HStack {
                // Social Media
            }
            
            .padding(.bottom, 50)
        }
        .padding()
    }
}

struct CatalogMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogMenuView()
            .previewLayout(.fixed(width: 250, height: 800))
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
            .font(.callout)

        }
        .accentColor(.primary)
    }
}
