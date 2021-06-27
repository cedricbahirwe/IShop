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
        formatter.locale = Locale(identifier: "en_US")
        //        formatter.currencyCode = "CDF"
        //        formatter.currencyCode = "USD"
        return formatter.string(from: NSNumber(value: price)) ?? "$0"
    }
    
    public static let drinks: [Drink] = [
        Drink(name: "Beer", shortDescription: "Single-serve breakfast...", price: 1.65),
        Drink(name: "Baccardi", shortDescription: "Bubblemint, 14 pieces", price: 1.55),
        Drink(name: "Vodka", shortDescription: "Single-serve breakfast...", price: 1.65),
        Drink(name: "Martini", shortDescription: "m&m milk chocolate 1,69-serve", price: 2.00),
    ]
}
struct CategoryDetailView: View {
    
    @EnvironmentObject var mainModel: MainViewModel
    var body: some View {
        VStack {
            TopNavigationHeaderView(title: "Drinks")
            
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            print("greate")
                            mainModel.showAgeVerificationView.toggle()
                        }) {
                            Image(systemName: "slider.horizontal.3")
                                .font(.callout)
                                .frame(width: 40, height: 40)
                                .background(
                                    Color.mainBlack
                                        .opacity(0.05)
                                )
                                .foregroundColor(.mainBlack)
                                .cornerRadius(12)
                        }
                        ForEach(["Water", "Energy", "Coffee", "Alcohol", "Tea", "Milk"], id:\.self) { drink in
                            Text(drink)
                                .font(.callout)
                                .padding(.horizontal, 10)
                                .frame(height: 40)
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
                    Group {
                        Text("Alcohol")
                            .fontWeight(.bold)
                        Text("Sorry you cannot buy this item due to DRC laws, as you are under 18 years old.")
                            .padding(.trailing)
                    }
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 25) {
                        ForEach(Drink.drinks) { drink in
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
                                .font(.callout)
//                                .foregroundColor(.secondary)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(12)
                            }
                        }
                        
                    }
                }
                .padding(10)
            }
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

