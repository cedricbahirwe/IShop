//
//  CategoryDetailView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 02/05/2021.
//

import SwiftUI

struct CategoryDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    HStack(spacing: 0) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .font(Font.body.bold())
                        Text("Back")
                            .fontWeight(.regular)
                    }
                }
                .foregroundColor(.black)
                
                Text("Drinks")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    
            }
            .padding(8)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(["Water", "Energy", "Coffee", "Alcohol", "Tea", "Milk"], id:\.self) { drink in
                        Text(drink)
                            .font(.callout)
                            .padding(10)
                            .background(
                                Color.mainBlack
                                    .opacity(drink == "Alcohol" ? 1 : 0.05)
                            )
                            .foregroundColor(drink == "Alcohol" ?  .mainBackground : .mainBlack)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 10)
            }
            
            
            VStack(alignment: .leading) {
                Text("Alcohol")
                    .fontWeight(.bold)
                Text("Sorry you cannot buy this item due to DRC laws, as you are under 18 years old.")
                    .padding(.trailing)
            }
            Spacer()
        }
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView()
    }
}
