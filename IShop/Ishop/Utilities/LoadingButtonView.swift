//
//  LoadingButtonView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct LoadingButton: View {
    
    enum ButtonState {
        case initial, loading, finished
    }
    let title: String
    var isActive: Bool = true // Will be used for coloring
    var state: ButtonState = .initial
    let action: () -> ()
    @State private var animate: Bool = false
    
    var body: some View {
        Button(action: action) {
            ZStack {
                switch state {
                case .initial:
                    Text(title)
                        .font(Font.callout.weight(.semibold))
                    
                case .loading:
                    
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 20, height: 20)
                        .rotationEffect(Angle(degrees: animate ? 360 : 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    Image(systemName: "circle.dashed")
                        .imageScale(.large)
                        .rotationEffect(Angle(degrees: animate ? 360 : 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                default :
                    Image(systemName: "checkmark.circle")
                        .imageScale(.large)
                }
            }
            .padding()
            .foregroundColor(.mainBackground)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(
                Color.mainDark
                            .opacity(state == .loading ? 0.65 : 1)
            )
            .cornerRadius(8)
            .animation(.easeIn)
            .disabled(!isActive)
            .contrast(isActive ? 1 : 0.5)
            .onChange(of: state) {
                animate = $0 == .loading
            }
        }
        .disabled(state == .loading)

        
    }
}


struct LoadingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingButton(title: "Loading") { }
            .padding(8)
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
