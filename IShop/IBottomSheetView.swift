//
//  IBottomSheetView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct IBottomSheetView<Content>: View where Content: View {
    var canReachTop: Bool = false
    var initialOffsetY: CGFloat = 360
    var isDraggeable: Bool = true // Will be used for gesture

    @Binding var showCard: Bool // = false
    @State private var showFull:  Bool = false
    var content: () -> Content
    
    @State private var bottomState = CGSize.zero
    
    var body: some View {
        VStack {
            content()
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color(.tertiarySystemBackground))
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(radius: 20)
        // Remplace  1000 with `size.height-160` to see the simulated effect
        .offset(x: 0, y: showCard ? initialOffsetY : 1000)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .offset(y: bottomState.height)
        .gesture(
            DragGesture().onChanged { value in
                if !isDraggeable { return }
                bottomState = value.translation
                if showFull {
                    bottomState.height += -300
                }
                if bottomState.height < -300 {
                    bottomState.height = -300
                }
            }
            .onEnded { value in
                if !isDraggeable { return }
                if value.translation.height > 50 {
                    showCard = false
                }
                if (bottomState.height < -100 && !showFull) || (bottomState.height < -250 && showFull) {
                    bottomState.height = canReachTop ? -360 : -300
                    showFull = true
                } else {
                    bottomState = .zero
                    showFull = false
                }
                
            }
        )
    }
}

struct IBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        IBottomSheetView(showCard: .constant(true)) {
             Text("Hello World")
        }
    }
}
