//
//  CardPaymentView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 27/06/2021.
//

import SwiftUI

// TODO: Card Service Detection
struct CardPaymentView: View {
    var body: some View {
        VStack{
            BottomSheetHeader("Add payment card details")
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
                .padding(.horizontal, 8)
        }
    }
}

struct CardPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CardPaymentView()
            .previewLayout(.fixed(width: 400, height: 340))
        CardAdditionView()
            .previewLayout(.fixed(width: 400, height: 240))
    }
}

struct CardAdditionView: View {
    var body: some View {
        VStack {
            BottomSheetHeader("Add payment card")
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "creditcard.fill")
                        .frame(width: 25, height: 25)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Apple Pay")
                            Spacer()
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                        .padding(.bottom, 10)
                        .overlay(Divider(), alignment: .bottom)
                    }
                }
                
                Button(action: {}){
                    Image(systemName: "checkmark")
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                    Text("Add card Pay")
                }
                .padding(.vertical, 5)
            }
            .padding(10)
            
            Divider()
            
            LargePrimaryButton("Continue", action: { })
                .padding(.horizontal, 8)
        }
    }
}
