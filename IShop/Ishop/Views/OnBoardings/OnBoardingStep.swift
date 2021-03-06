//
//  OnBoardingStep.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 01/05/2021.
//

import SwiftUI

struct OnBoardingModel: Identifiable {
    var id = UUID()
    let image: Image?
    let title: String
    let description: String
    
    static let example = OnBoardingModel(image: Image("camera"), title: "Camera Title", description: "The best camera in our new branding")
}

struct OnboardingStepView: View {
    let step: OnBoardingModel
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                if let img = step.image {
                    img
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: size.width*0.9, maxHeight: size.width*0.8)
                        .clipped()
                        .background(Color.gray.opacity(0.2))
                    
                } else {
                    ImagePlaceHolder()
                }
            }
//            .frame(maxWidth: .infinity)
            
            Text(step.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(step.description)
                .font(.title3)
                .opacity(0.85)
        }
        .padding(.horizontal, 16)
        
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStepView(step: OnBoardingModel(image: nil, title: "", description: ""))
    }
}
