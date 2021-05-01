//
//  OnBoardingView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 25/04/2021.
//

import SwiftUI

struct OnBoardingView: View {
    
    private let onboardingSteps: [OnBoardingModel] = [
        OnBoardingModel(image: Image("shopping"), title: "Shop Everyday Products", description: "We deliver groceries, drinks, and home goods daily direct from our warehouse to you in one hour or less."),
        OnBoardingModel(image: Image("delivery"), title: "Get Delivery \nWhen You Need It", description: "Your time matters. IShop delivers your order directly from our fulfillment centers. We don't rely on 3rd party stores. Get your products when you want them."),
        OnBoardingModel(image: Image("fees"), title: "Save Big On Fees", description: "Pricing should not be a game. Our delivery fee is simple, and our product prices are fair. \nShop with confindence.")
    ]
    @State private var offsetX: CGFloat = .zero
    @State private var selectedStep: OnBoardingStep = .one
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    ForEach(
                        onboardingSteps,
                        content: OnboardingStepView.init
                    )
                    .frame(width: geo.frame(in: .global).width)
                    
                }
//                .background(Color.red.edgesIgnoringSafeArea(.top))
                .offset(x: offsetX)
                .highPriorityGesture(
                    DragGesture()
                        .onEnded(updateTabs)
                )
                
                VStack(spacing: 30) {
                    HStack {
                        ForEach(OnBoardingStep.allCases, id: \.self) { i in
                            Circle()
                                .fill(Color.mainBlack.opacity(i == selectedStep ? 1 : 0.1))
                                .frame(width: 10, height: 10)
                            
                        }
                        Spacer()
                        
                        if selectedStep != .three {
                            Button(action: {
                                
                                if selectedStep  == .one {
                                    selectedStep = .two
                                } else if selectedStep == .two {
                                    selectedStep = .three
                                }
                            }) {
                                Text("Next")
                                    .fontWeight(.medium)
                            }
                        }
                    }
                    
                    Button(action: {}) {
                        Text("Start Shopping")
                            .fontWeight(.medium)
                            .largeButtonStyle()
                    }
                }
                .padding()
                
            }
        }
        .animation(.default)
        .foregroundColor(.mainBlack)
        .onChange(of: selectedStep, perform: updateLayout)
    }
    
    private func updateTabs(with swipeValue: DragGesture.Value) {
        
        if (-swipeValue.translation.width > 50)  {
            switch selectedStep {
            case .one:
                selectedStep = .two
            case .two:
                selectedStep = .three
            default: break
            }
        }
        
        if (swipeValue.translation.width > 50) {
            switch selectedStep {
            case .three:
                selectedStep = .two
            case .two:
                selectedStep = .one
            default: break
            }
        }
        
    }
    
    private func updateLayout(step: OnBoardingStep) {
        switch step {
        case .one:
            offsetX = 0
        case .two:
            offsetX = -size.width
        case .three:
            offsetX = -size.width*2
        }
    }
    
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
