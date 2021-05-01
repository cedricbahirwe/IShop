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
}

struct OnboardingStep: View {
    let step: OnBoardingModel
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                if let img = step.image {
                    img
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: size.width-30)
                        .frame(maxHeight: 300)
                        .clipped()
                        .background(Color.gray.opacity(0.2))
                    
                } else {
                    ImagePlaceHolder()
                }
            }
            
            Text(step.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(step.description)
                .font(.title3)
                .opacity(0.85)
        }
        .padding(.horizontal)
        
    }
}

struct OnBoardingStep_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStep(step: OnBoardingModel(image: nil, title: "", description: ""))
    }
}
