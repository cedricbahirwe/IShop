//
//  View+Extensions.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI


struct GrayField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 50)
            .padding(.horizontal, 10)
            .background(Color.lightGray)
            .cornerRadius(10)
    }
}

struct DarkMode: ViewModifier {
    func body(content: Content) -> some View {
        content.preferredColorScheme(.dark)
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    public func grayField() -> some View {
        ModifiedContent(content: self, modifier: GrayField())
    }
    
    public func applyDark() -> some View {
        ModifiedContent(content: self, modifier: DarkMode())
    }
    
    
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }

}
