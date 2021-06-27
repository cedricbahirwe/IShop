//
//  CreateAccountBottomSheet.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct CreateAccountBottomSheet: View {
    var body: some View {
        VStack(alignment: .leading) {
            BottomSheetHeader("Create an account", didPressBack:  { })
            VStack(alignment: .leading) {
                Text("Enter phone number:")
                HStack {
                    Text("+243")
                        .font(.callout)
                    
                    TextField("--- --- ---", text: .constant(""))
                        .textContentType(.telephoneNumber)
                        .keyboardType(.numberPad)
                }
                .padding(10)
                .background(Color.lightGray)
                .cornerRadius(8)
                
                Group {
                    Text("By continuing, you accept the ")
                        + Text("the terms of use and privacy policy")
                        .foregroundColor(.accentColor)
                }
                .font(.system(size: 14))
                .foregroundColor(.gray)
            }
            .padding(10)
            
            Divider()
            Button(action: {
                
            }, label: {
                Text("Continue")
                    .bold()
                    .padding()
                    .foregroundColor(.mainBackground)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainDark)
                    .cornerRadius(10)
            })
            .padding(8)
        }
    }
}

struct CreateAccountBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
//        CreateAccountBottomSheet()
        
        IBottomSheetView(initialOffsetY: 360, showCard: .constant(true)) {
            CreateAccountBottomSheet()
        }
    }
}
