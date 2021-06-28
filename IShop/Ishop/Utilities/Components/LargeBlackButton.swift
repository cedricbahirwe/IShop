//
//  LargeBlackButton.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 28/06/2021.
//

import SwiftUI

struct LargeBlackButton: View {
    let title: String
    let isActive: Bool
    let action: () -> Void
    init(_ title: String,
         isActive: Bool = true,
         action: @escaping () -> Void) {
        self.title = title
        self.isActive = isActive
        self.action = action
    }
    
    var content: some View {
        Button(action: action){
            Text(title)
                .bold()
                .padding()
                .foregroundColor(.mainBackground)
                .frame(maxWidth: .infinity)
                //                .background(Color.mainDark)
                .background(Color.primary)
                .cornerRadius(10)
        }
        .disabled(!isActive)
        .contrast(isActive ? 1 : 0.5)
    }
    var body: some View {
        content
    }
}


struct LargeBlackButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeBlackButton("Title Here", action:  { })
    }
}
