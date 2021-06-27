//
//  LargePrimaryButton.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 27/06/2021.
//

import SwiftUI

struct LargePrimaryButton: View {
    let title: String
    let isActive: Bool
    let action: () -> Void
    init(_ title: String, isActive: Bool = true, action: @escaping () -> Void) {
        self.title = title
        self.isActive = isActive
        self.action = action
    }
    
    @State private var bgColor: Color = Color.mainDark
    var content: some View {
        Button(action: action){
            Text(title)
                .bold()
                .padding()
                .foregroundColor(.mainBackground)
                .frame(maxWidth: .infinity)
//                .background(Color.mainDark)
                .background(bgColor)
                .cornerRadius(10)
        }
        .padding(8)
        .disabled(!isActive)
        .contrast(isActive ? 1 : 0.5)
    }
    var body: some View {
       content
    }
}


struct LargePrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        LargePrimaryButton("Large Button", isActive: false, action: {})
    }
}
