//
//  CatalogDefaultSearchView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct CatalogDefaultSearchView: View {
    @Environment(\.presentationMode) private  var presentationMode
    @State private var searchText: String = ""
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                HStack(spacing: 3) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Search", text: .constant(""))
                    Image(systemName: "mic.fill")
                        .foregroundColor(.secondary)
                    
                }
                .padding(6)
                .background(
                    Color(.tertiarySystemGroupedBackground)
                )
                .cornerRadius(8)
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.primary)
                
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 8)
            Divider()
            if !searchText.isEmpty {
                
                VStack {
                    Spacer()
                    Text("Start typing something")
                        .foregroundColor(.secondary)
                    Spacer()
                    
                }
            } else {
                LazyVGrid(columns: [GridItem(.flexible()),
                                    GridItem(.flexible())], spacing: 25) {
                    ForEach(Drink.drinks,
                            content: SubCategoryItemView.init)
                        .redacted(reason: .placeholder)
                    
                }
                .padding()
            }
            Spacer()
        }
        .navigationBarHidden(true)
        
    }
    
}

struct CatalogDefaultSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogDefaultSearchView()
    }
}

