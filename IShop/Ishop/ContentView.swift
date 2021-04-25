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
    
    var body: some View {
        
       OnBoardingView()
        
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
