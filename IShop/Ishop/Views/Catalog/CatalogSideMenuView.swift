//
//  CatalogSideMenuView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 28/06/2021.
//

import SwiftUI

struct CatalogSideMenuView: View {
    
    @Binding var isPresented: Bool
    @State private var isAuthorized: Bool = true
    
    
    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented
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
                    
                    MenuOptionView(title: "John Doe",
                               subtitle: "My account") {}
                    NavigationLink(
                        destination: MyOrdersView(),
                        label: {
                            MenuOptionView(title: "My orders")
                        })
                    
                    MenuOptionView(title: "My wallet", action: { })
                    MenuOptionView(title: "Refer a friend", action: { })
                    MenuOptionView(title: "About IShop", action: { })
                    MenuOptionView(title: "Logout", action: { })
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
        .onDisappear {
            withAnimation {
                isPresented = false
            }
        }
    }
}

struct CatalogSideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogSideMenuView(isPresented: .constant(true))
            .previewLayout(.fixed(width: 250, height: 800))
    }
}

fileprivate struct MenuOptionView: View {
    init(title: String,
         subtitle: String? = nil,
         action: (() -> Void)? = nil ) {
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }
    
    let title: String
    let subtitle: String?
    let action: (() -> Void)?
    private let icon: String? =  "square.split.diagonal.2x2"
    var body: some View {
        if let action = action {
            Button(action: action) {
                content
            }
        } else {
            content
        }
       
    }
    
    private var content: some View {
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
        .font(.body)
        .foregroundColor(.primary)
    }
}
