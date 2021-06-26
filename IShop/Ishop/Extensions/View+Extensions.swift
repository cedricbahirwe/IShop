//
//  View+Extensions.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI


struct DarkMode: ViewModifier {
    func body(content: Content) -> some View {
        content.preferredColorScheme(.dark)
    }
}

extension View {
    func applyDark() -> some View {
        ModifiedContent(content: self, modifier: DarkMode())
    }
}

