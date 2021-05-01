//
//  CatalogHomeView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 01/05/2021.
//

import SwiftUI

struct CatalogHomeView: View {
    @State private var showCard = false
    //    @State private var show = false
    //    @State private var viewState  = CGSize.zero
    @State private var bottomState = CGSize.zero
    @State private var showFull = false
    
    var body: some View {
        ZStack {
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
                        .onTapGesture {
                            showCard = true
                        }
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
                                    NavigationLink(
                                        destination: CategoryDetailView()) {
                                        ZStack {
                                            Text(category)
                                                .font(Font.callout.bold())
                                                .foregroundColor(.mainBlack)
                                        }
                                        .padding(10)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .frame(height: size.width/2.5, alignment: .top)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(10)
                                        
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Daily Essentials")
                                .font(Font.title3.bold())
                                .opacity(0.85)
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                                ForEach(["Women's\nEssential", "Baby & Kids", "Toundra", "Beverage"], id: \.self) { category in
                                    ZStack {
                                        Text(category)
                                            .font(Font.callout.bold())
                                            .foregroundColor(.mainBlack)
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
            .blur(radius: showCard || bottomState != .zero ? 10 : 0)
            .opacity(showCard || bottomState != .zero ? 0.4 : 1)
            .disabled(showCard || bottomState != .zero)
            .animation(Animation.default.delay(0.1).speed(2))
            
            BottomOrderCardView()
                // Remplace  1000 with `size.height-160` to see the simulated effect
                .offset(x: 0, y: showCard ? 360 : 1000)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .offset(y: bottomState.height)
                .gesture(
                    DragGesture().onChanged { value in
                        bottomState = value.translation
                        if showFull {
                            bottomState.height += -300
                        }
                        if bottomState.height < -300 {
                            bottomState.height = -300
                        }
                    }
                    .onEnded { value in
                        if value.translation.height > 50 {
                            showCard = false
                        }
                        if (bottomState.height < -100 && !showFull) || (bottomState.height < -250 && showFull) {
                            bottomState.height = -300
                            showFull = true
                        } else {
                            bottomState = .zero
                            showFull = false
                        }
                        
                    }
                )
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CatalogHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView  {
            CatalogHomeView()
        }
        //            .preferredColorScheme(.dark)
    }
}
