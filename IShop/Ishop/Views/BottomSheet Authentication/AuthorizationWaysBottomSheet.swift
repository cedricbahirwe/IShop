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
            BottomSheetHeader("Please, log in")
            
            VStack {
                Button(action: {
                    
                }, label: {
                    Text("Create an Account")
                        .bold()
                        .padding()
                        .foregroundColor(.mainBackground)
                        .frame(maxWidth: .infinity)
                        .background(Color.mainDark)
                        .cornerRadius(8)
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

