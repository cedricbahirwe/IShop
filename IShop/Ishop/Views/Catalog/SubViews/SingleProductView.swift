//
//  SingleProductView.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 29/06/2021.
//

import SwiftUI

struct ProductOrder: Identifiable {
    let id = UUID()
    let name: String
    let description: String?
    let quantity: Int
    private(set) var orderQuantity: Int = 0
    let price: Double
    var tags: [String]
    
    var remainingQuantity: Int {
        quantity - orderQuantity
    }
    var totalPrice: Double {
        Double(orderQuantity) * price
    }
    
    mutating func increaseQty() {
        if orderQuantity < quantity {
            orderQuantity += 1
        }
    }
    
    mutating func decreaseQty() {
        if orderQuantity > 0 {
            orderQuantity -= 1
        }
    }
}

struct SingleProductView: View {
    @State private var productOrder = ProductOrder(
        name: "Ice Breakers",
        description: "Ice cube, wintergreen, 40ct",
        quantity: 16,
        price: 1.40,
        tags: ["Low Stock", "Great Value"])
    
    private var isQtyEmpty: Bool {
        productOrder.orderQuantity == 0
    }
    var body: some View {
        VStack(alignment: .leading) {
            Color.lightGray
                .frame(width: 300, height: 300 )
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
            
            Text(productOrder.name)
                .font(Font.title.bold())
            if let description = productOrder.description {
                Text(description)
            }
            Text("QTY: \(productOrder.remainingQuantity)")
                .foregroundColor(.secondary)
            
            HStack {
                ForEach(productOrder.tags, id:\.self) { item in
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
            
            
 
                HStack(spacing: 0) {
                GeometryReader { geo in
                    let halfWidth = geo.size.width/2
                    HStack(spacing: 0) {
                        if !isQtyEmpty {
                            Button(action: {
                                withAnimation {
                                    productOrder.decreaseQty()
                                }
                            }, label: {
                                Image(systemName: "minus")
                                    .font(Font.caption.bold())
                                    .frame(width: 55, height: 55)
                                    .foregroundColor(.primary)
                                    .background(Color(.secondarySystemBackground))
                                    .cornerRadius(8)
                            })
                            
                            .frame(width: halfWidth/3,
                                   alignment: .leading)
                            
                            Text(productOrder.orderQuantity.description)
                                .font(Font.title3.bold())
                                .frame(minWidth: 40, maxWidth: .infinity)
                                .frame(width: halfWidth/3)
                            
                            Button(action: {
                                productOrder.increaseQty()
                            }, label: {
                                Image(systemName: "plus")
                                    .font(Font.caption.bold())
                                    .frame(width: 55, height: 55)
                                    .foregroundColor(.primary)
                                    .background(Color(.secondarySystemBackground))
                                    .cornerRadius(8)
                            })
                            .frame(width: halfWidth/3,
                                   alignment: .trailing)
                        }
                        Button(action: {
                            withAnimation {
                                productOrder.increaseQty()
                            }
                        }) {
                            CheckoutBannerView(
                                icon: "cart.fill",
                                title: isQtyEmpty ? "Add to cart" : "View cart",
                                price: isQtyEmpty ? "$\(productOrder.price)" : "")
                        }
                        .padding(.leading,isQtyEmpty ? 0 : 10)
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
