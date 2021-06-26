//
//  CatalogDefaultSearchView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 26/06/2021.
//

import SwiftUI

struct CatalogDefaultSearchView: View {
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
                .background(Color(.tertiarySystemGroupedBackground))
                .cornerRadius(8)
                Button("Cancel") { }
                    .foregroundColor(.primary)
                
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 8)
            Divider()
            VStack {
                Spacer()
                Text("Start typing something")
                    .foregroundColor(.secondary)
                Spacer()
                
                
            }
        }
    }
    
}

struct CatalogDefaultSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogDefaultSearchView()
    }
}

