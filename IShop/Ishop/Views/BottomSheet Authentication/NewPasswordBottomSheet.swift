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
            BottomSheetHeader("Create New password", didPressBack:  { })
            VStack(alignment: .leading) {
                Text("Enter phone number:")
                TextField("Enter your password", text: .constant(""))
                    .grayField()
                TextField("Repeat new password", text: .constant(""))
                    .grayField()
                
            }
            .padding(10)
            
            Divider()
            
            LargePrimaryButton("Continue", action: {})
                .padding(.horizontal, 8)
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

