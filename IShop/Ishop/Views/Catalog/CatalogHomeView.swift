//
//  CatalogHomeView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 01/05/2021.
//

import SwiftUI

struct CatalogHomeView: View {
    @State private var showCard = false
    @State private var bottomState = CGSize.zero
    @State private var showFull = false
    
    @State private var showSideBar = false
    private let width = size.width
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 20) {
                    Button(action: {
                        withAnimation(.spring()) {
                            showSideBar.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.primary)
                    }
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
                    NavigationLink(
                        destination: CatalogDefaultSearchView()){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.primary)
                    }
                    
                    
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
                                        CategoryItemView(category: category)
                                        
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
                                ForEach(["Women's\nEssential", "Baby & Kids", "Toundra", "Beverage"],
                                        id: \.self,
                                        content: CategoryItemView.init)
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
            .blurring(isActive: showSideBar, intensity: 3)
            
            // Show Bottom Card Order
            IBottomSheetView(showCard: $showCard) {
                BottomOrderCardView()
            }
            
            
            HStack(spacing: 0) {
                CatalogSideMenuView(isPresented: $showSideBar)
                    .frame(width: width*0.65)
                    .background(Color.mainBackground)
                    .offset(x: showSideBar ? 0 :  -(width*0.65))
                
                if showSideBar {
                    Color.black
                        .opacity(0.01)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showSideBar.toggle()
                            }
                        }
                } else {
                    Spacer()
                }
            }
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
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



struct CategoryItemView: View {
    let category: String
    var body: some View {
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
