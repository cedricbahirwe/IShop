//
//  AccountDetails.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct AccountDetails: View {
    @State private var showPassword: Bool = false
    @State private var password: String = ""
    @State private var State: LoadingButton.ButtonState = .initial
    var body: some View {
        VStack(alignment: .leading) {
            BottomSheetHeader("Account details", didPressBack: { })
            
            VStack(alignment: .leading) {
                Text("Almost done, next lets add:")
                HStack {
                    TextField("First name", text: .constant(""))
                        .grayField()
                    
                    TextField("Last name", text: .constant(""))
                        .grayField()
                }
                
                TextField("Your email", text: .constant(""))
                    .grayField()
                
                HStack(spacing: 0) {
                    if showPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .padding()
                        .onTapGesture { }
                }
                .grayField()
            }
            .padding(10)
            Divider()
            
            LoadingButton(title: "Continue", state: State) {
            }
            .padding(10)
            
        }
    }
}

struct AccountDetails_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetails()
    }
}

