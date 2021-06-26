//
//  CartView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .font(Font.body.bold())
                Spacer()
                Text("Cart")
                    .font(Font.headline.bold())
                Spacer()
                Image(systemName: "trash")
                    //                    .imageScale(.large)
                    .font(Font.body.bold())
            }
            .padding()
            Divider()
            VStack(alignment: .leading) {
                cartItemsView
                
                suggestionsView
                
                Spacer()
            }
            .padding(10)
            Divider()
            CheckoutBannerView(icon: "creditcard",
                               title: "Checkout",
                               price: "$9.76")
                .padding([.horizontal, .bottom])
        }
    }
    
    private var cartItemsView: some View {
        Section {
            ForEach(0 ..< 3) { item in
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 40, height: 40)
                    VStack(alignment: .leading) {
                        Text("Ice Breakers")
                            .font(Font.headline)
                        Text("$1.4")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer(minLength: 3)
                    HStack(spacing: 3) {
                        Button(action: {}, label: {
                            Image(systemName: "minus")
                                .font(Font.caption.bold())
                                .frame(width: 40, height: 40)
                                .foregroundColor(.primary)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(8)
                        })
                        
                        Text("1")
                            .frame(minWidth: 40)
                        
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                                .font(Font.caption.bold())
                                .frame(width: 40, height: 40)
                                .foregroundColor(.primary)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(8)
                        })
                    }
                }
            }
        }
    }
    
    private var suggestionsView: some View {
        Section(header: Text("Suggestion")
                    .font(Font.title2.weight(.semibold))
                    .padding(.vertical, 10))
        {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(Drink.drinks) { drink in
                        VStack(alignment: .leading) {
                            Color.gray.opacity(0.1)
                                .frame(width: 100, height: 100)
                            Text(drink.name)
                                .lineLimit(1)
                            HStack {
                                Image(systemName: "cart.badge.plus")
                                Spacer()
                                Text(drink.formattedPrice)
                            }
                            .font(.caption)
                            .padding(10)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                        }
                        .frame(width: 100)
                    }
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        
        IBottomSheetView(canReachTop: true, showCard: .constant(true)) {
            CartView()
        }
    }
}
