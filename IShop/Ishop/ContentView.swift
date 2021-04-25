//
//  ContentView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 25/04/2021.
//

import SwiftUI
import CoreData

let size = UIScreen.main.bounds.size

public enum OnBoardingStep: Int, CaseIterable {
    case one
    case two
    case three
}

extension Color {
    static let mainDark = Color("mainColor")
    static let mainBlack = Color.primary
    static let mainBackground = Color(.systemBackground)
}

struct ContentView: View {
    
    @State private var offsetX: CGFloat = .zero
    @State private var selectedStep: OnBoardingStep = .one
    var body: some View {
        VStack {
            
            
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        OnboardingView(image: nil, title: "Shop Everyday Products", description: "We deliver groceries, drinks, and home goods daily direct from our warehouse to you in one hour or less.")
                            .frame(width: geo.frame(in: .global).width)
                        OnboardingView(image: nil, title: "Shop Everyday Products", description: "We deliver groceries, drinks, and home goods daily direct from our warehouse to you in one hour or less.")
                            .frame(width: geo.frame(in: .global).width)
                        OnboardingView(image: nil, title: "Shop Everyday Products", description: "We deliver groceries, drinks, and home goods daily direct from our warehouse to you in one hour or less.")
                            .frame(width: geo.frame(in: .global).width)
                    }
                    .offset(x: offsetX)
                    .highPriorityGesture(
                        DragGesture()
                            .onEnded(updateTabs)
                    )
                    
                    VStack {
                        HStack {
                            ForEach(OnBoardingStep.allCases, id: \.self) { i in
                                Circle()
                                    .fill(Color.black.opacity(i == selectedStep ? 1 : 0.1))
                                    .frame(width: 10, height: 10)
                                
                            }
                            Spacer()
                            
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
                        
                        Button(action: { }) {
                            Text("Start Shopping")
                                .fontWeight(.medium)
                                .foregroundColor(.mainBackground)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(Color.mainBlack)
                        }
                    }
                    .padding()
                }
            }
            .animation(.default)
            
            
            
            
        }
        .padding(.top, 40)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImagePlaceHolder: View {
    var body: some View {
        Text("Image")
            .font(Font.title.weight(.heavy))
            .foregroundColor(Color.gray.opacity(0.5))
            .frame(width: size.width-20, height: 380)
            .background(Color.gray.opacity(0.2))
    }
}

struct OnboardingView: View {
    let image: Image?
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ImagePlaceHolder()
                .padding(.bottom)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Text(description)
                .font(.title3)
                .padding(.trailing)
        }
        .padding()
        
        //        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
