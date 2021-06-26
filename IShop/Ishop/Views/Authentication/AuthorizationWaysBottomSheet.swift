//
//  AuthorizationWaysBottomSheet.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct AuthorizationWaysBottomSheet: View {
    var body: some View {
        VStack {
                Text("Please, log in")
                    .font(Font.headline.bold())
                    .padding(10)
                Divider()
            
            VStack {
                Button(action: {
                    
                }, label: {
                    Text("Create an Account")
                        .bold()
                        .padding()
                        .foregroundColor(.mainBackground)
                        .frame(maxWidth: .infinity)
                        .background(Color.mainDark)
                        .cornerRadius(10)
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Sign In")
                        .bold()
                        .padding()
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                })
            }
            .padding(10)
        }
    }
}

struct AuthorizationWaysBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        IBottomSheetView(initialOffsetY: 450, showCard: .constant(true)) {
        AuthorizationWaysBottomSheet()
        }
    }
}

