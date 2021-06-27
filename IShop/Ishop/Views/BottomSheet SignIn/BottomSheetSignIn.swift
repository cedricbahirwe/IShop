//
//  BottomSheetSignIn.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 27/06/2021.
//

import SwiftUI

struct BottomSheetSignIn: View {
    @State private var showPassword: Bool = false
    @State private var password: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            BottomSheetHeader("Sign in", didPressBack:  { })
            VStack(alignment: .leading) {
                HStack  {
                    Text("+243")
                    TextField("--- --- ---", text: .constant(""))
                }
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
                
                Text("Incorrect username or password.")
                    .font(.caption)
                    .foregroundColor(.red)
                
                HStack {
                    Text("Having trouble signing in?")
                    Button("Reset your password") { }
                }
                .font(.caption)
            }
            .padding(10)
            
            Divider()
            
            
            LoadingButton(title: "Continue", isActive: false, state: .initial, action: { })
                .padding(10)
        }
    }
}

struct BottomSheetSignIn_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetSignIn()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
