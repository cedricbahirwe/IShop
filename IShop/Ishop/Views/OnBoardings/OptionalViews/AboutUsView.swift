//
//  AboutUsView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 25/06/2021.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        VStack {
            TopNavigationHeaderView(title: "About IShop")
            VStack(alignment: .leading, spacing: 16) {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.secondarySystemBackground))
                        .frame(height: 100)
                    Text("IShop™ 2021")
                        .bold()
                        .padding(8)
                    
                }
                
                Label("About us", systemImage: "arrow.up.forward.app")
                Label("Terms and Conditions", systemImage: "arrow.up.forward.app")
                Label("Privacy Policy", systemImage: "arrow.up.forward.app")
                Label("Carrers", systemImage: "arrow.up.forward.app")
                Label("Speak with Zarba", systemImage: "arrow.up.forward.app")

                
            }
            .padding(12)
            
            Spacer()
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
