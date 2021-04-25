//
//  SpashScreenView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 25/04/2021.
//

import SwiftUI

struct SpashScreenView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("abc.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(20)
                .background(Color.black.opacity(0.7))
                .cornerRadius(20)
            
            Text("IShop")
                .font(Font.largeTitle.bold())
                
        }
    }
}

struct SpashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SpashScreenView()
    }
}
