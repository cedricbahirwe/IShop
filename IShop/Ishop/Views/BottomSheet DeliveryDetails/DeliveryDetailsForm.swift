//
//  DeliveryDetailsForm.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 27/06/2021.
//

import SwiftUI

struct DeliveryDetailsForm: View {

    init() {
            UITextView.appearance().backgroundColor = .systemGroupedBackground
        }

    
    var body: some View {
        VStack {
            BottomSheetHeader("Address details")
            
            VStack(alignment: .leading) {
                addressFilling
                addressOptions
                instructionsView
            }
            .padding(10)
            
            Divider()
            LargePrimaryButton("Save", action: {})
            
        }
    }
    
    
    private var addressFilling: some View {
        TextField("Himbi, Av Du Musee 12", text: .constant(""))
            .grayField()
        
    }
    
    private var addressOptions: some View {
        Group {
            HStack(alignment: .top) {
                Image(systemName: "pin")
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Himbi, Riviera Hotel")
                                .font(.body)
                            Text("Goma, Av Du Musee")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        Image(systemName: "slider.horizontal.3")
                    }
                    Divider()

                }
            }
            Button(action: {}) {
                HStack {
                    Image(systemName: "bubble.right")
                        .accentColor(.primary)
                    Text("Add delivery instructions")
                }
            }
        }
    }
    
    private var instructionsView: some View {
        
        TextEditor(text: .constant("PlaceHolder"))
            .frame(height: 80)
            .cornerRadius(10)
    }
}

struct DeliveryDetailsForm_Previews: PreviewProvider {
    static var previews: some View {
        IBottomSheetView(initialOffsetY: 200, showCard: .constant(true)) {
            DeliveryDetailsForm()
        }
    }
}
