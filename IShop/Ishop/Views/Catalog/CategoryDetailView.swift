//
//  CategoryDetailView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 02/05/2021.
//

import SwiftUI

struct Drink: Identifiable {
    var id = UUID()
    var name: String
    var shortDescription: String
    var price: Double
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: price)) ?? "$0"
    }
}
struct CategoryDetailView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    let drinks: [Drink] = [
        Drink(name: "Beer", shortDescription: "Single-serve breakfast...", price: 1.65),
        Drink(name: "Baccardi", shortDescription: "Bubblemint, 14 pieces", price: 1.55),
        Drink(name: "Vodka", shortDescription: "Single-serve breakfast...", price: 1.65),
        Drink(name: "Martini", shortDescription: "m&m milk chocolate 1,69-serve", price: 2.00),
    ]
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
            
            //            ScrollView(.horizontal) {
            //                HStack {
            //                    ForEach(["Water", "Energy", "Coffee", "Alcohol", "Tea", "Milk"], id:\.self) { drink in
            //                        Text(drink)
            //                            .font(.callout)
            //                            .padding(10)
            //                            .background(
            //                                Color.mainBlack
            //                                    .opacity(drink == "Alcohol" ? 1 : 0.05)
            //                            )
            //                            .foregroundColor(drink == "Alcohol" ?  .mainBackground : .mainBlack)
            //                            .cornerRadius(12)
            //                    }
            //                }
            //                .padding(.horizontal, 10)
            //            }
            
            
            VStack(alignment: .leading) {
                Group {
                    Text("Alcohol")
                        .fontWeight(.bold)
                    Text("Sorry you cannot buy this item due to DRC laws, as you are under 18 years old.")
                        .padding(.trailing)
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 25) {
                    ForEach(drinks) { drink in
                        VStack {
                            Color.gray.opacity(0.1)
                                .frame(height: size.width/2.5)
                            VStack(alignment: .leading) {
                                Text(drink.name)
                                Text(drink.shortDescription)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                            HStack {
                                Image(systemName: "cart.badge.plus")
                                Spacer()
                                Text(drink.formattedPrice)
                            }
                            .padding(10)
                            .font(.caption)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .foregroundColor(.secondary)
                        }
                    }
                    
                }
            }
            .padding(10)
            
            Spacer()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView()
        //            .preferredColorScheme(.dark)
    }
}
