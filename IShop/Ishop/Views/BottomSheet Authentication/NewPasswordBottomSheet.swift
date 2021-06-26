//
//  NewPasswordBottomSheet.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct NewPasswordBottomSheet: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .font(Font.body.bold())
                Spacer()
                Text("Create an account")
                    .font(Font.headline.bold())
                Spacer()
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            Divider()
            VStack(alignment: .leading) {
                Text("Enter phone number:")
                TextField("Enter your password", text: .constant(""))
                    .grayField()
                TextField("Repeat new password", text: .constant(""))
                    .grayField()
                
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

struct NewPasswordBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
//        NewPasswordBottomSheet()
        IBottomSheetView(initialOffsetY: 330, showCard: .constant(true)) {
            NewPasswordBottomSheet()
        }
    }
}
