//
//  LargeBlackButton.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 28/06/2021.
//

import SwiftUI

struct LargeBlackButton: View {
    let title: String
    let image: String?
    let isActive: Bool
    let action: () -> Void
    init(_ title: String,
         image: String? = nil,
         isActive: Bool = true,
         action: @escaping () -> Void) {
        self.title = title
        self.image = image
        self.isActive = isActive
        self.action = action
    }
    
    var content: some View {
        Button(action: action){
            HStack(spacing: 5) {
                if let _ = image {
                    Image(systemName: "square.split.diagonal.2x2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15,height: 15)
                        .clipped()
                }
                
                Text(title)
                    .bold()
                
            }
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
            .padding()
            .previewLayout(.fixed(width: 400, height: 70))
    }
}
