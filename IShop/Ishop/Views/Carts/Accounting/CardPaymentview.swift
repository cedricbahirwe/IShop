//
//  CardPaymentview.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct CardPaymentview: View {
    var body: some View {
        VStack {
            Text("Add payment card details")
                .font(Font.headline.bold())
                .padding(10)
            Divider()
            VStack {
                TextField("Cardholder Name", text: .constant(""))
                    .grayField()
                HStack {
                    TextField("Placeholder", text: .constant(""))
                }
                .grayField()
                
                HStack {
                    TextField("YY//MM", text: .constant(""))
                        .grayField()
                    TextField("CVC", text: .constant(""))
                        .grayField()
                }
            }
            .padding(10)
            Divider()
            LoadingButton(title: "Add") { }
                .padding(10)
            
        }
    }
}

struct CardPaymentview_Previews: PreviewProvider {
    static var previews: some View {
        IBottomSheetView(initialOffsetY: 320, showCard: .constant(true)) {
            CardPaymentview()
        }
    }
}

