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
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .font(Font.body.bold())
                Spacer()
                Text("Account details")
                    .font(Font.headline.bold())
                Spacer()
            }
            .padding(10)
            Divider()
            
            VStack(alignment: .leading) {
                Text("Almost done, next lets add:")
                HStack {
                    TextField("First name", text: .constant(""))
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.lightGray)
                        .cornerRadius(10)
                    
                    TextField("Last name", text: .constant(""))
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.lightGray)
                        .cornerRadius(10)
                }
                
                TextField("Your email", text: .constant(""))
                    .frame(height: 50)
                    .padding(.leading, 10)
                    .background(Color.lightGray)
                    .cornerRadius(10)
                
                
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
                .frame(height: 50)
                .padding(.leading, 10)
                .background(Color.lightGray)
                .cornerRadius(10)
            }
            .padding(10)
            Divider()
            
            Button(action: {}, label: {
                Text("Continue")
                    .font(Font.callout.weight(.semibold))
                    .padding()
                    .foregroundColor(.mainBackground)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainDark)
                    .cornerRadius(8)
            })
            .padding(10)
        }
    }
}

struct AccountDetails_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetails()
    }
}
