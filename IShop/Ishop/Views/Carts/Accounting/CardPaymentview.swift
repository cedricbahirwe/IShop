//
//  CardPaymentview.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

// TODO: Card Service Detection
struct CardPaymentview: View {
    var body: some View {
        VStack{
            Text("Add payment card details")
                .font(Font.headline.bold())
                .padding(10)
            Divider()
            VStack (spacing: 10) {
                TextField("Cardholder Name", text: .constant(""))
                    .grayField()
                HStack(spacing: 2) {
                    Image(systemName: "creditcard.fill")
                        .foregroundColor(.gray)
                    TextField("Placeholder", text: .constant(""))
                }
                .grayField()
                
                HStack {
                    TextField("YY//MM", text: .constant(""))
                        .grayField()
                    HStack {
                        TextField("CVC", text: .constant(""))
                        Image(systemName: "creditcard.fill")
                    }
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

