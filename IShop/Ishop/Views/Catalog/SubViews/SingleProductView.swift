//
//  SingleProductView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 29/06/2021.
//

import SwiftUI

struct SingleProductView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Color.lightGray
                .frame(width: 300, height: 300 )
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
            
            Text("Ice Breakers")
                .font(Font.title.bold())
            Text("Ice cube, wintergreen, 40ct,")
            Text("QTY: 12")
                .foregroundColor(.secondary)
            
            HStack {
                ForEach(["Low Stock", "Great Value"], id:\.self) { item in
                    Text(item)
                        .font(.caption)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.secondary)
                        )
                        .foregroundColor(.secondary)
                }
            }
            
            CheckoutBannerView(icon: "cart.fill",
                               title: "Add to cart",
                               price: "$1.4")
            
            HStack(spacing: 0) {
                GeometryReader { geo in
                    let halfWidth = geo.size.width/2
                    HStack(spacing: 0) {
                        Button(action: {}, label: {
                            Image(systemName: "minus")
                                .font(Font.caption.bold())
                                .frame(width: 55, height: 55)
                                .foregroundColor(.primary)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(8)
                        })
                        
                        .frame(width: halfWidth/3,
                               alignment: .leading)
                        
                        Text("1")
                            .font(Font.title3.bold())
                            .frame(minWidth: 40, maxWidth: .infinity)
                            .frame(width: halfWidth/3)
                        
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                                .font(Font.caption.bold())
                                .frame(width: 55, height: 55)
                                .foregroundColor(.primary)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(8)
                        })
                        .frame(width: halfWidth/3,
                               alignment: .trailing)
                        
                        Button(action: {}) {
                            CheckoutBannerView(icon: "cart.fill",
                                               title: "View cart",
                                               price: "")
                                
                        }
                        .padding(.leading, 10)
                        
                    }
                    
                    
                }
                .frame(height: 55)
                
                
            }
        }
        .padding(10)
    }
}

struct SingleProductView_Previews: PreviewProvider {
    static var previews: some View {
        SingleProductView()
    }
}
