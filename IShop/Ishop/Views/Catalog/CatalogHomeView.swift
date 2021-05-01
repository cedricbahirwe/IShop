//
//  CatalogHomeView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 01/05/2021.
//

import SwiftUI

struct CatalogHomeView: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image(systemName: "line.horizontal.3")
                Text("52 Av Du Musee, Himbi")
                    .fontWeight(.semibold)
                    .foregroundColor(.mainBackground)
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainDark)
                    .clipShape(Capsule())
                Image(systemName: "magnifyingglass")
                
            }
            .padding()
            
            ScrollView {
                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0 ..< 5) { item in
                                ZStack {
                                   Text("Shopping is effortless, \ndelivery is now.")
                                    .font(Font.callout.bold())
                                }
                                .padding(8)
                                .frame(width: 245, height: 120, alignment: .topLeading)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(11)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Trending")
                            .font(Font.title3.bold())
                            .opacity(0.85)
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(["Health", "Drinks", "Snacks & Quick Meals", "Grocery"], id: \.self) { category in
                                ZStack {
                                    Text(category)
                                        .font(Font.callout.bold())
                                }
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: size.width/2.5, alignment: .top)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Daily Essentials")
                            .font(Font.title3.bold())
                            .opacity(0.85)
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(["Meals", "Juices", "Toundra", "Beverage"], id: \.self) { category in
                                ZStack {
                                    Text(category)
                                        .font(Font.callout.bold())
                                }
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: size.width/2.5, alignment: .top)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            }
            
            
            Spacer()
        }
    }
}

struct CatalogHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogHomeView()
//            .preferredColorScheme(.dark)
    }
}
