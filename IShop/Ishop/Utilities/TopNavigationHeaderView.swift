//
//  TopNavigationHeaderView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct TopNavigationHeaderView: View {
    let title: String
    var didPop: (() -> ())? = nil
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        ZStack(alignment: .leading) {
            
            Button(action: {
                if let action = didPop {
                    action()
                } else {
                    presentationMode.wrappedValue.dismiss()
                }
            }){
                HStack(spacing: 0) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .font(Font.body.bold())
                    Text("Back")
                        .fontWeight(.regular)
                }
            }
            .foregroundColor(.mainBlack)

            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
            
        }
        .padding(8)
    }
}

struct TopNavigationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TopNavigationHeaderView(title: "Title Here")
    }
}
